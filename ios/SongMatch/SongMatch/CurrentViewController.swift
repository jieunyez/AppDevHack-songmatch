//
//  CurrentViewController.swift
//  SongMatch
//
//  Created by Lily Pham on 12/3/21.
//

import UIKit
import SwiftUI

class CurrentViewController: UIViewController {
    
    var tableView = UITableView()
    
    let reuseIdentifier = "songCellReuse"
    let cellHeight = 150
    let imageRadius = 4
    
    var currcell : Song = Song(title: "", artist: "", album: "", cover: "", genre: [Genre(name: "")], mood: [Mood(name: "")])
    var cellnum = 1000
    var songs: [Song] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        title = "Playlist"
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 0.043, green: 0.467, blue: 0.494, alpha: 1.0).cgColor, UIColor(red: 0.196, green: 0.749, blue: 0.486, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.shouldRasterize = true
        view.layer.addSublayer(gradientLayer)



        getSongs(mood: "", genre: "")
        
        if (cellnum != 1000) {
            songs[cellnum] = currcell
        }
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func getSongs(mood: String, genre: String) {
        if (mood != "" && genre != "") {
            return NetworkManager.getSongsbyInputs(mood: mood, genre: genre) { songs in
                self.songs = songs
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        if (mood == "" && genre == "") {
            return NetworkManager.getSongs { songs in
                self.songs = songs
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        else if (mood != "") {
            return NetworkManager.getSongsbyMood(mood: mood) { songs in
                self.songs = songs
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        if (genre != "" && mood == "") {
            return NetworkManager.getSongsbyGenre(genre: genre) { songs in
                self.songs = songs
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

}

extension CurrentViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? SongTableViewCell {
            let song = songs[indexPath.row]
            cell.configure(song: song)
            cell.selectionStyle = .none
            cell.coverImage.layer.masksToBounds = true
            cell.coverImage.layer.cornerRadius = 50
            cell.backgroundColor = .clear
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension CurrentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedCell = tableView.cellForRow(at: indexPath) as! SongTableViewCell
        let song = songs[indexPath.row]
        let songViewController = CurrentViewController()
        selectedCell.backgroundColor = UIColor(red: 0.039, green: 0.388, blue: 0.502, alpha: 1.0)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        var deselectedCell = tableView.cellForRow(at: indexPath) as! SongTableViewCell
        deselectedCell.backgroundColor = .clear
     }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let lastIndexPath = tableView.indexPathsForVisibleRows?.last{
            if lastIndexPath.row <= indexPath.row{
                cell.center.y = cell.center.y + cell.frame.height / 2
                cell.alpha = 0
                UIView.animate(withDuration: 0.5, delay: 0.05*Double(indexPath.row), options: [.curveEaseInOut], animations: {
                    cell.center.y = cell.center.y - cell.frame.height / 2
                    cell.alpha = 1
                }, completion: nil)
            }
        }
    }
    
}

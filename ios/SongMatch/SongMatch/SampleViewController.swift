//
//  SampleViewController.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 11/20/21.
//

import UIKit
import SwiftUI

class SampleViewController: UIViewController {
    
    var tableView = UITableView()
    
    let reuseIdentifier = "songCellReuse"
    let cellHeight = 150
    let imageRadius = 4
    
    var currcell : Song = Song(title: "", artist: "", album: "", cover: "", genre: [Genre(name: "")], mood: [Mood(name: "")])
    var cellnum = 1000
    var songs: [Song] = []
    
    private var selectedGenre = "default2"
    private var selectedMood = "default2"
    
    weak var delegate: UpdateMoodGenreDelegate?
    init(delegate: UpdateMoodGenreDelegate?, selectedMood: String, selectedGenre: String) {
        self.delegate = delegate
        self.selectedMood = selectedMood
        self.selectedGenre = selectedGenre
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        title = "Playlist"
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 138/255, green: 34/255, blue: 191/255, alpha: 1.0).cgColor, UIColor(red: 17/255, green: 3/255, blue: 79/255, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.shouldRasterize = true
        view.layer.addSublayer(gradientLayer)


        print("Printing Mood in Sample: \(selectedMood)")
        print("Printing Genre in Sample: \(selectedGenre)")
        getSongs(mood: selectedMood, genre: selectedGenre)
        //getSongs(mood: "sad", genre: "indie")
        
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

extension SampleViewController: UITableViewDataSource {

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

extension SampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedCell = tableView.cellForRow(at: indexPath) as! SongTableViewCell
        let song = songs[indexPath.row]
        let songViewController = SampleViewController(delegate: self, selectedMood: selectedMood, selectedGenre: selectedGenre)
        selectedCell.backgroundColor = UIColor(red: 214/255, green: 65/255, blue: 234/255, alpha: 1.0)
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

protocol UpdateMoodGenreDelegate: class {
    func updateMoodGenre(newMood: String, newGenre: String)
}

extension SampleViewController: UpdateMoodGenreDelegate {
    func updateMoodGenre(newMood: String, newGenre: String) {
        self.selectedMood = newMood
        self.selectedGenre = newGenre
    }
}

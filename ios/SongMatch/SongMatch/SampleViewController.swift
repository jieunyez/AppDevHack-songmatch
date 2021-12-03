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
    
    var currcell : Song = Song(name: "", artist: "", album: "", cover: "")
    
    var cellnum = 1000
    
    public var songs: [Song] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        title = "Playlist"
        
        if (cellnum != 1000) {
            songs[cellnum] = currcell
        }
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
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
        if (mood != "" && genre != "") {
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
            return cell
        } else {
            return UITableViewCell()
        }
    }

}

extension SampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = songs[indexPath.row]
        if let cell = tableView.cellForRow(at: indexPath) as? SongTableViewCell {
            currcell = song
            cellnum = indexPath.row
        }
    }
}


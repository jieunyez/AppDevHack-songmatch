//
//  PlaylistViewController.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 11/20/21.
//

import UIKit
import SwiftUI

class PlaylistViewController: UIViewController {
    
    var tableView = UITableView()
    
    let reuseIdentifier = "songCellReuse"
    let cellHeight = 150
    
    var currcell : Song = Song(name: "", artist: "", album: "", cover: "")
    
    var cellnum = 1000
    
    var songs: [Song] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        title = "Playlist"
        
        var americanboy = Song(name: "American Boy", artist: "Estelle, Kanye West", album: "Shine", cover: "americanboy")
        var fireflies = Song(name: "Fireflies", artist: "Owl City", album: "Ocean Eyes", cover: "fireflies")
        var gooddays = Song(name: "Good Days", artist: "SZA", album: "Good Days", cover: "gooddays")
        var jocelynflores = Song(name: "Jocelyn Flores", artist: "XXXTENTACION", album: "17", cover: "jocelynflores")
        var july = Song(name: "July", artist: "Noah Cyrus", album: "THE END OF EVERYTHING", cover: "july")
        var sandm = Song(name: "S&M", artist: "Rihanna", album: "Loud", cover: "sandm")
        var slowdancing = Song(name: "SLOW DANCING IN THE DARK", artist: "Joji", album: "BALLADS 1", cover: "slowdancing")
        var stressedout = Song(name: "Stressed Out", artist: "Twenty One Pilots", album: "BlurryFace", cover: "stressedout")
        var sweaterweather = Song(name: "Sweater Weather", artist: "The Neighbourhood", album: "I Love You.", cover: "sweaterweather")
        var waitingontheworld = Song(name: "Waiting On the World to Change", artist: "John Mayer", album: "Continuum", cover: "waitingontheworld")
        
        songs = [americanboy, fireflies, gooddays, jocelynflores, july, sandm, slowdancing, stressedout, sweaterweather, waitingontheworld]
        
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

}

extension PlaylistViewController: UITableViewDataSource {

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

extension PlaylistViewController: UITableViewDelegate {
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



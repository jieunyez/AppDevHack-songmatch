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
    let imageRadius = 4
    
    var currcell : Song = Song(title: "", artist: "", album: "", cover: "", genre: [Genre(genre: "")], mood: [Mood(mood: "")])
    
    var cellnum = 1000
    
    var songs: [Song] = []

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


        
        var americanboy = Song(title: "American Boy", artist: "Estelle, Kanye West", album: "Shine", cover: "americanboy", genre: [Genre(genre: "")], mood: [Mood(mood: "")])
        var fireflies = Song(title: "Fireflies", artist: "Owl City", album: "Ocean Eyes", cover: "fireflies", genre: [Genre(genre: "")], mood: [Mood(mood: "")])
        var gooddays = Song(title: "Good Days", artist: "SZA", album: "Good Days", cover: "gooddays", genre: [Genre(genre: "")], mood: [Mood(mood: "")])
        var jocelynflores = Song(title: "Jocelyn Flores", artist: "XXXTENTACION", album: "17", cover: "jocelynflores", genre: [Genre(genre: "")], mood: [Mood(mood: "")])
        var july = Song(title: "July", artist: "Noah Cyrus", album: "THE END OF EVERYTHING", cover: "july", genre: [Genre(genre: "")], mood: [Mood(mood: "")])
        var sandm = Song(title: "S&M", artist: "Rihanna", album: "Loud", cover: "sandm", genre: [Genre(genre: "")], mood: [Mood(mood: "")])
        var slowdancing = Song(title: "SLOW DANCING IN THE DARK", artist: "Joji", album: "BALLADS 1", cover: "slowdancing", genre: [Genre(genre: "")], mood: [Mood(mood: "")])
        var stressedout = Song(title: "Stressed Out", artist: "Twenty One Pilots", album: "BlurryFace", cover: "stressedout", genre: [Genre(genre: "")], mood: [Mood(mood: "")])
        var sweaterweather = Song(title: "Sweater Weather", artist: "The Neighbourhood", album: "I Love You.", cover: "sweaterweather", genre: [Genre(genre: "")], mood: [Mood(mood: "")])
        var waitingontheworld = Song(title: "Waiting On the World to Change", artist: "John Mayer", album: "Continuum", cover: "waitingontheworld", genre: [Genre(genre: "")], mood: [Mood(mood: "")])
        
        songs = [americanboy, fireflies, gooddays, jocelynflores, july, sandm, slowdancing, stressedout, sweaterweather, waitingontheworld]
        
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
            cell.coverImage.layer.masksToBounds = true
            cell.coverImage.layer.cornerRadius = 50
            cell.backgroundColor = .clear
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension PlaylistViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedCell = tableView.cellForRow(at: indexPath) as! SongTableViewCell
        let song = songs[indexPath.row]
        let songViewController = PlaylistViewController()
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



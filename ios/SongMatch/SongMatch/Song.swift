//
//  Song.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 11/20/21.
//

import Foundation

class Song {
    var name: String
    var artist: String
    var album: String
    var cover: String
    
    init(name: String, artist: String, album: String, cover: String) {
        self.name = name
        self.artist = artist
        self.album = album
        self.cover = cover
    }
    
}

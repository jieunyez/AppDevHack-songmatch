//
//  Song.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 11/20/21.
//

import Foundation

class Song: Codable {
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

struct SongsResponse: Codable {
    var success: Bool
    var data: [Song]
}

struct SongResponse: Codable {
    var success: Bool
    var data: Song
}

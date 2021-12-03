//
//  Song.swift
//  SongMatch
//
//  Created by Elizabeth Tang on 11/20/21.
//

import Foundation


struct Song: Codable {
    var title: String
    var artist: String
    var album: String
    var cover: String
    var genre: [Genre]
    var mood: [Mood]
    
}

struct Genre: Codable {
    let name: String
}

struct Mood: Codable {
    let name: String
}

struct SongsResponse: Codable {
//    var success: Bool
    var songs: [Song]
}

//struct SongResponse: Codable {
//    var success: Bool
//    var data: Song
//}


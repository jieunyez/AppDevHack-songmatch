//
//  NetworkManager.swift
//  SongMatch
//
//  Created by Lily Pham on 12/1/21.
//

import Foundation
import Alamofire

class NetworkManager {

    static let endpoint0 = "https://songmatchappdev.herokuapp.com/tests/songs/"
    static let endpoint = "https://songmatchappdev.herokuapp.com/getsongs/"



    static func getSongs(completion: @escaping ([Song]) -> Void) {
        AF.request(endpoint0, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let songResponse = try? jsonDecoder.decode(SongsResponse.self, from: data) {
                    let songs = songResponse.songs
                    completion(songs)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    static func getSongsbyGenre(genre: String, completion: @escaping ([Song]) -> Void) {
        AF.request("\(endpoint)?genre=\(genre)", method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let songResponse = try?
                    jsonDecoder.decode(SongsResponse.self, from:data) {
                    let song = songResponse.songs
                    print(song)
                    completion(song)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    static func getSongsbyMood(mood: String, completion: @escaping ([Song]) -> Void) {
        AF.request("\(endpoint)?mood=\(mood)", method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let songResponse = try?
                    jsonDecoder.decode(SongsResponse.self, from:data) {
                    let song = songResponse.songs
                    print(song)
                    completion(song)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func getSongsbyInputs(mood: String, genre: String, completion: @escaping ([Song]) -> Void) {
        AF.request("\(endpoint)?mood=\(mood)&genre\(genre)", method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let songResponse = try?
                    jsonDecoder.decode(SongsResponse.self, from:data) {
                    let song = songResponse.songs
                    print(song)
                    completion(song)
                } else {
                    print("decode error")
                }
//                do {
//                    let jsonDecoder = JSONDecoder()
//                    let songResponse = try
//                        jsonDecoder.decode(SongsResponse.self, from:data)
//                        let song = songResponse.songs
//                        print(song)
//                        completion(song)
//                } catch {
//                    print(error)
//                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

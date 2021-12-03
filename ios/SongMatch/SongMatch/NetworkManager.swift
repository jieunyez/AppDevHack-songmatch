//
//  NetworkManager.swift
//  SongMatch
//
//  Created by Lily Pham on 12/1/21.
//

import Foundation
import Alamofire

class NetworkManager {

    static let endpoint = "https://songmatchappdev.herokuapp.com/song/"



    static func getSongs(completion: @escaping ([Song]) -> Void) {
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let songResponse = try? jsonDecoder.decode(SongResponse.self, from: data) {
                    let songs = songResponse.data
                    completion([songs])
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
                    jsonDecoder.decode(SongResponse.self, from:data) {
                    let song = songResponse.data
                    print(song)
                    completion([song])
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
                    jsonDecoder.decode(SongResponse.self, from:data) {
                    let song = songResponse.data
                    print(song)
                    completion([song])
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

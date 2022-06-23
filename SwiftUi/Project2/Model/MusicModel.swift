//
//  MusicModel.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 23/06/2022.
//

import Foundation

struct MusicModel: Codable{
    var results: [Results]
    
    struct Results: Codable{
        var id: UUID{UUID()}
        var trackId: Int?
        var trackName: String?
        var artworkUrl100: String
        var trackPrice: Float?
        var currency: String
        var previewUrl: String?
        var trackTimeMillis: Int?
    }
}

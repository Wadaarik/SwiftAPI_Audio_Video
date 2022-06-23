//
//  VideoModel.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 22/06/2022.
//

import Foundation

struct VideoListModel: Codable{
    var id: UUID{UUID()}
    var description: String
    var sources: [String]
    var subtitle: String
    var thumb: String
    var title: String
}

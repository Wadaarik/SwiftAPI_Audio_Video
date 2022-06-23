//
//  ContactModel.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 22/06/2022.
//

import Foundation


struct ContactModel: Codable{
    var results: [Results]
    var info: Info
    
    struct Results: Codable{
        var id: UUID{UUID()}
        var name: Name
        var picture: Picture
        var email: String
    }
    
    struct Name: Codable{
        var title: String
        var first: String
        var last: String
    }
    
    struct Info: Codable{
        var seed: String
    }
    struct Picture: Codable{
        var large: String
    }
}


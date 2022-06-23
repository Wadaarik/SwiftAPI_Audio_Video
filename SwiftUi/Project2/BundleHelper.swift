//
//  BundleHelper.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 22/06/2022.
//

import Foundation

class BundleHelper{
    static func getFile(name: String, ext: String)-> Data?{
        
        guard let url = Bundle.main.url(forResource: name, withExtension: ext)
        
        else{return nil}
        
        do{
            let data = try Data(contentsOf: url)
            return data
        }catch{
            return nil
        }
    }
}

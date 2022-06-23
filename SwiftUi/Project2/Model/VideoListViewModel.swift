//
//  VideoListViewModel.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 22/06/2022.
//

import Foundation

class VideoListViewModel: ObservableObject{
    @Published var list: [VideoListModel]
    
    init(){
        guard let data = BundleHelper.getFile(name: "newJson", ext: "json")
        else{
            list = []
            return
        }
        do{
            let json = try JSONDecoder().decode([VideoListModel].self, from: data)
            list = json
        }catch{
            list = []
        }
    }
    
}

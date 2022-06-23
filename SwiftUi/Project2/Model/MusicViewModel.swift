//
//  MusicViewModel.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 23/06/2022.
//

import Foundation
import Combine

class MusicViewModel: ObservableObject{
    
    @Published var data: [MusicModel.Results] = []
    var seed: String = ""
    var cancellable: [AnyCancellable] = []
    var webService: WebService<MusicModel>
    
    var url: URL?
    
    init(){
        let url = URL(string: "https://itunes.apple.com/search?term=")!
        webService = WebService(url: url)
        webService.$dataFromApi
            .sink{
            [weak self] musicModel in
            if let res = musicModel{
                self?.data = res.results
            }
        }.store(
            in: &cancellable
        )
    }

    func searchAPI(searchName: String){
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "itunes.apple.com"
        urlComponent.path = "/search"
        urlComponent.queryItems = [URLQueryItem(name: "term", value: "\(searchName)"),
        ]
        url = urlComponent.url
        
        webService = WebService(url: url!)
        webService.$dataFromApi
            .sink{
            [weak self] musicModel in
            if let res = musicModel{
                self?.data = res.results
            }
        }.store(
            in: &cancellable
        )
    }
    
}

//
//  ViewModel.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 22/06/2022.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject{
    @Published var data: [ContactModel.Results] = []
    var seed: String = ""
    var cancellable: [AnyCancellable] = []
    var webService: WebService<ContactModel>
    
    init(){
        let url = URL(string: "https://randomuser.me/api/?results=30")!
        webService = WebService(url: url)
        webService.$dataFromApi
            .sink{
            [weak self] contactModel in
            if let res = contactModel{
                self?.data = res.results
            }
        }.store(
            in: &cancellable
        )
    }

    
    func refresh(){
        webService.fetch()
    }
    
}

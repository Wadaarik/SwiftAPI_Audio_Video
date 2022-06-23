//
//  WebService.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 22/06/2022.
//

import Foundation
import Combine

class WebService<T: Codable>{
    
    private var cancellable: [AnyCancellable] = []
    private var url: URL
    @Published var dataFromApi : T?
    
    init(url: URL){
        self.url = url
        fetch()
    }
    
    func fetch(){
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map{$0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .sink { completion in
                switch completion{
                case .failure(let error):
                    print(error)
                default: break
                }
        } receiveValue: { value in
            self.dataFromApi = value
        }
        .store(in: &cancellable)

    }
}

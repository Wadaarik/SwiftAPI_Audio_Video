//
//  WebService.swift
//  swift_advanced01
//
//  Created by BOUDIER Nicolas on 21/06/2022.
//

import Foundation
import Combine

class WebService<T: Codable>{
    
    private var cancellable: [AnyCancellable] = []
    private var url: URL
    @Published var result : T?
    
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
            self.result = value
        }
        .store(in: &cancellable)

    }
}

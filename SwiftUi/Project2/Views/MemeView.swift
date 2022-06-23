//
//  memeView.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 22/06/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct MemeView: View{
    
    
    @State private var searchTop: String = ""
    @State private var searchBottom: String = ""
    
    var top: String = ""
    var bottom: String = ""
    
    @State var url: URL?
    
    var body: some View{
        ZStack{
                    Form{
                        
                    TextField(
                            "keyword",
                            text: $searchTop
                        )
                    TextField(
                            "keyword",
                            text: $searchBottom
                        )
                        
                        Button{
                            var urlComponent = URLComponents()
                            urlComponent.scheme = "https"
                            urlComponent.host = "apimeme.com"
                            urlComponent.path = "/meme"
                            urlComponent.queryItems = [URLQueryItem(name: "meme", value: "Morpheus"),
                                URLQueryItem(name: "top", value: searchTop),
                                URLQueryItem(name: "bottom", value: searchBottom)
                            ]
                            url = urlComponent.url
                        }label: {
                            Text("Search")
                        }
                    }
            
            ImageView(url: url, height: 250, width: 250)
                
        }

    }
}

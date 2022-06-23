//
//  ContentView.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 22/06/2022.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel = ContentViewModel()
    
    
    var body: some View {
        NavigationView{
            List(viewModel.data, id:\.id){
                contact in
                NavigationLink(destination: DetailContentView(contact: contact)){
                    HStack{
                        ImageView(url: URL(string: contact.picture.large), height: 80, width: 80)
                                    .clipShape(Circle())
                        VStack (alignment: .leading){
                            HStack{
                                Text(contact.name.first).bold()
                                Text(contact.name.title).bold()
                            }
                            Text(contact.email)
                        }
                    }
                }
            }.listStyle(.automatic)
                
            .navigationTitle("My List")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        viewModel.refresh()
                    }label: {
                        Image(systemName: "gobackward")
                            .foregroundColor(Color.black)
                    }
                }
            }
        }
    }
}


struct ImageView: View{
    let url: URL?
    var height: Int
    var width: Int
    var body: some View{
        WebImage(url: url)
            .resizable()
            .frame(width: CGFloat(width), height: CGFloat(height))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

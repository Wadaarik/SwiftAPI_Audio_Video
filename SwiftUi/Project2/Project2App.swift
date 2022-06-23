//
//  Project2App.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 22/06/2022.
//

import SwiftUI

@main
struct Project2App: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem{
                        VStack{
                            Image(systemName: "person.crop.circle")
                            Text("Contact")
                        }
                    }
                MemeView()
                    .tabItem{
                        VStack{
                            Image(systemName: "trash.circle.fill")
                            Text("Meme")
                        }
                    }
                VideoListView()
                    .tabItem{
                        VStack{
                            Image(systemName: "video")
                            Text("Videos")
                        }
                    }
                MusicView()
                    .tabItem{
                        VStack{
                            Image(systemName: "metronome.fill")
                            Text("Musiques")
                        }
                    }
            }
        }
    }
}

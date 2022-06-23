//
//  MusicView.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 23/06/2022.
//

import SwiftUI

struct MusicView: View {
    
    @ObservedObject var musicViewModel: MusicViewModel = MusicViewModel()
    @ObservedObject var musicPlayer: MusiquePlayer = MusiquePlayer()
    @State private var searchName: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Spacer()
                    TextField(
                        "Nom de l'artiste",
                        text: $searchName
                    )
                    Button{
                        musicViewModel.searchAPI(searchName: searchName)
                    }label: {
                        Text("Search")
                    }
                    Spacer()
                }
                List(musicViewModel.data, id:\.id){
                    music in
                    NavigationLink(destination: DetailMusicView(music: music)){
                        HStack{
                            ImageView(url: URL(string: music.artworkUrl100), height: 80, width: 80)
                            VStack (alignment: .leading){
                                Text(music.trackName ?? "").bold()
                                HStack {
                                    Text(music.trackPrice?.description ?? "")
                                    Text(music.currency)
                                }
                            }
                            Spacer()
                            Button{
                                if musicPlayer.isPlaying() == false{
                                    musicPlayer.startPlaying(url: URL(string: music.previewUrl ?? "")!)
                                }else{
                                    musicPlayer.stopPlaying()
                                }
                            }label: {
                                Image(systemName: "play")
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                    
                }.listStyle(.automatic)
            }
            .navigationTitle("My music")
        }
        
        
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}

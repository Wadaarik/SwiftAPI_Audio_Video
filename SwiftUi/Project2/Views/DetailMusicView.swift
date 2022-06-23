//
//  DetailMusicView.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 23/06/2022.
//

import SwiftUI
import AVKit

struct DetailMusicView: View {
    
    @ObservedObject var musicPlayer: MusiquePlayer = MusiquePlayer()
    
    var music: MusicModel.Results
    
    var body: some View {
        VStack {
            ImageView(url: URL(string: music.artworkUrl100), height: 100, width: 100)
                .clipShape(Circle())
            VStack {
                Text(music.trackName ?? "")
                HStack {
                    Text(music.trackPrice?.description ?? "")
                    Text(music.currency)
                }
                Text(String(format: "Temps: %.2f min", (Float (music.trackTimeMillis!)/60000)))
                
                HStack {
                    Button {
                        musicPlayer.startPlaying(url: URL(string: music.previewUrl ?? "")!)
                    } label: {
                        Image(systemName: "play.circle")
                            .font(.system(size: 30))
                    }
                    Button {
                        musicPlayer.stopPlaying()
                    } label: {
                        Image(systemName: "pause.circle")
                            .font(.system(size: 30))
                    }
                }
                
                if let videoMusic = music.previewUrl {
                    let player = AVPlayer(url: URL(string: videoMusic)!)
                    VideoPlayer(player: player)
                        .frame(width: 300, height: 250)
                }
            
            }
        }
        Spacer()
    }
}



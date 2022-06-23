//
//  VideoListView.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 22/06/2022.
//

import SwiftUI
import AVKit

struct VideoListView: View {
    
    @ObservedObject var viewModel: VideoListViewModel = VideoListViewModel()
    @State var show: Bool = false
    @State var videoUrl: URL?
    
    
    var body: some View {
        NavigationView{
            List(viewModel.list, id:\.id){video in
                HStack{
                    Text(video.title)
                    Spacer()
                    ImageView(url: URL(string: video.thumb), height: 80, width: 80).clipShape(Circle())
                }
                .onTapGesture {
                    if let video = video.sources.first{
                        videoUrl = URL(string: video)
                        show = true
                    }
                }
            }.sheet(isPresented: $show){
                if let videoUrl = videoUrl{
                    let player = AVPlayer(url: videoUrl)
                    VideoPlayer(player: player)
                    
                }
            }
            .navigationTitle("Vidéos")
        }
     }
}

//
//  MusiquePlayer.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 23/06/2022.
//

import Foundation
import AVFoundation

class MusiquePlayer: ObservableObject{
    
    static let player = AVPlayer()
    
    init(){
        startSession()
    }
    private func startSession(){
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        }catch{
            
        }
    }
    func startPlaying(url: URL)
    {
        let item = AVPlayerItem(url: url)
        MusiquePlayer.player.replaceCurrentItem(with: item)
        MusiquePlayer.player.play()
    }
    
    func isPlaying() -> Bool{
        return MusiquePlayer.player.timeControlStatus == .playing
    }
    func stopPlaying(){
        MusiquePlayer.player.pause()
    }
    
}

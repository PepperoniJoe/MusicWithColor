//
//  AudioPlayerManager.swift
//  MusicWithColor
//
//  Created by Marcy Vernon on 5/28/20.
//  Copyright © 2020 Marcy Vernon. All rights reserved.
//


import Foundation
import AVFoundation


enum SoundType: String {
    case mp3
    case wav
    case m4a
}

struct AudioPlayerManager {

    var player: AVAudioPlayer? = AVAudioPlayer()

    mutating func setupPlayer(soundName: String, soundType: SoundType) {
        
        if let soundURL = Bundle.main.url(forResource: soundName, withExtension: soundType.rawValue) {
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                player?.prepareToPlay()
            }
            catch  {
                print("❗️", error.localizedDescription)
            }
        } else {
            print("❗️Sound file was missing, name is misspelled or wrong case.")
        }
    }
    
    func play(_ numberOfLoops: Int = -1) {
        player?.numberOfLoops = numberOfLoops
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
    
    func stop() {
        player?.stop()
    }
}



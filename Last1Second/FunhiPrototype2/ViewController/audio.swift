//
//  audio.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/13.
//
var currentBGM : String = "mainGameBGM"
import Foundation
import AVFoundation
extension mainGameViewController {
    
    
}
var effectPlayer: AVAudioPlayer?
var bgmPlayer: AVAudioPlayer?
func audioConfigure(bgmName: String, isBGM: Bool, ofType: String) {
   
    let urlString = Bundle.main.path(forResource: bgmName, ofType: ofType)
    

    do {
                try AVAudioSession.sharedInstance().setMode(.default)
        try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

        guard let urlString = urlString else {
            print("urlstring is nil")
            return
        }
        if isBGM {
            currentBGM = bgmName
            bgmPlayer = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            bgmPlayer?.numberOfLoops = -1

            guard let bgmPlayer = bgmPlayer else {
                print("player is nil")
                return
            }
            bgmPlayer.volume
                = Float(player.setting.bgmVolume)
            bgmPlayer.play()
        } else {
            effectPlayer = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

            guard let effectPlayer = effectPlayer else {
                print("player is nil")
                return
            }
            effectPlayer.volume
                = Float(player.setting.effectVolume)
            effectPlayer.play()
        }
        
    }
    catch {
        print("error occurred")
    }
}

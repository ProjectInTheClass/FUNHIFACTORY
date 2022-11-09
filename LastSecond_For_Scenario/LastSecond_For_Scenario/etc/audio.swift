//
//  audio.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/13.
//

import Foundation
import AVFoundation

var currentBGM : String = "mainGameBGM"
var effectPlayer: AVAudioPlayer?
var bgmPlayer: AVAudioPlayer?

enum EffectSound: String {
  case buttonClick = "buttonTap"
}

enum SoundType: String {
  case mp3 = "mp3"
}

func audioConfigure(bgmName: String, isBGM: Bool, ofType: SoundType) {
  
  let urlString = Bundle.main.path(forResource: bgmName, ofType: ofType.rawValue)
  
  do {
    try AVAudioSession.sharedInstance().setMode(.default)
    try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
    guard let urlString = urlString else { print("urlstring is nil"); return }
    if isBGM {
      currentBGM = bgmName
      bgmPlayer = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
      bgmPlayer?.numberOfLoops = -1
      guard let bgmPlayer = bgmPlayer else { print("player is nil"); return }
      bgmPlayer.volume = Float(player.setting.bgmVolume)
      bgmPlayer.play()
      
    } else {
      effectPlayer = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
      guard let effectPlayer = effectPlayer else { print("player is nil"); return }
      effectPlayer.volume = Float(player.setting.effectVolume)
      effectPlayer.play()
    }
  }
  catch {
    print("error occurred")
  }
}

func playEffectSound(_ sound: EffectSound, type: SoundType) {
  audioConfigure(bgmName: sound.rawValue, isBGM: false, ofType: type)
}

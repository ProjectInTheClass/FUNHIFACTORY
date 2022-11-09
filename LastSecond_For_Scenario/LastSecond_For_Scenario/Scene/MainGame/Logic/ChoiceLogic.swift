//
//  choiceLogic.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/11.
//

import UIKit

var isChoiceOn = false



func playBgm(put bgm : String){
  //currentBlockOfDay().backGroundMusic.info()
  guard bgm != currentBGM else {return}
  if bgm == ""    //bgm을 멈춰야 할 때
  {
    bgmPlayer?.stop()
    currentBGM = bgm
    return
  }
  else    //새로운 bgm이 들어왔을 때
  {
    audioConfigure(bgmName: bgm, isBGM: true, ofType: .mp3)
  }
}

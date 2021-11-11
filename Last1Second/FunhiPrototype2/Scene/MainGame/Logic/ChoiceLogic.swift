//
//  choiceLogic.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/11.
//

import UIKit

var isChoiceOn = false

extension MainGameViewController {
    func chatUpdateTimer()
    {
        if timer != nil{
            timer.invalidate()
        }
        print("chatUpdateTimer 실행")
        timer = Timer.scheduledTimer(withTimeInterval: player.setting.textSpeed, repeats: true, block: {timer in
            self.chatUpdate()
            print(timer)
        })
        
    }
    func chatUpdate(){
        print("스토리 \(player.indexNumber)/\(currentChatAmount())")
        playBgm(put: currentBlockOfDay().backGroundMusic.info())
        if (player.indexNumber != currentChatAmount())
        {
            checkEnterAnimation()
        }
        //게임 오버 시 뜰 배드엔딩 창 띄우기.
        if player.indexNumber == currentChatAmount() && currentBlockOfDay().choices[0].nextTextIndex.hasPrefix("ending"){
            player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex = currentBlockOfDay().choices[0].nextTextIndex
            print("타이머 여부 :\(timer == nil)")
            if timer != nil {
                print("timer invalidate")
                timer!.invalidate()
                timer = nil
              }
            blackView.bounds = self.view.bounds
            blackView.center = self.view.center
            self.view.addSubview(blackView)
            blackView.alpha = 0
            UIView.animate(withDuration: 2.0) {
                self.blackView.alpha = 1
            } completion: { [self] _ in
                player.indexNumber = 0
                player.currentChatArray.removeAll()
                self.mainGameTableView.reloadData()
                self.performSegue(withIdentifier: "badEnding", sender: nil)
                blackView.removeFromSuperview()
            }
            return
        }
        //에피소드를 깼을 때
        else if player.indexNumber == currentChatAmount() && currentBlockOfDay().choices[0].nextTextIndex == "episodeSuccess"{
            if timer != nil{
                timer.invalidate()
            }
            player.currentEpisodes[player.dayIndex].isCleared = true
            print("\(player.currentEpisodes[player.dayIndex].episodeID) 클리어")
            player.currentEpisodes[strToIndex(str: player.dayId)].chatHistory = player.currentChatArray
            player.currentChatArray.removeAll()
            
            print("-------------------------maingameend----------------------")
            if player.dayId == "prologue"
            {
                performSegue(withIdentifier: "performSelect", sender: nil)
            }
            else
            {
                performSegue(withIdentifier: "mainToHome", sender: nil)
            }
            return
        }
        else if player.indexNumber < currentChatAmount() && currentBlockOfDay().chats[player.indexNumber].type != .ar{
            //일반적인 채팅
                player.currentChatArray.append(currentBlockOfDay().chats[player.indexNumber])
                self.mainGameTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)
        }
        else if player.indexNumber == currentChatAmount() && currentBlockOfDay().choiceSkip == false
        {
            //선택지가 나올 때
            if timer != nil{
                timer.invalidate()
            }
            print("invalidate")
            guard player.currentChatArray.last?.type != .choice else {return}
            choiceUpdate()
            return
        }
        else if player.indexNumber == currentChatAmount() && currentBlockOfDay().choiceSkip == true
        {
            //선택지 없이 바로 다음 스토리블럭으로 갈 때
            if (currentBlockOfDay().isGodChat != currentEpisode().storyBlocks[currentBlockOfDay().choices[0].nextTextIndex]!.isGodChat)
            {
                
                if (currentBlockOfDay().isGodChat == true)
                {
                    player.currentChatArray.append(Chat(text_: "", image_: "", type_: .endGodChat, who_: .danhee, characterFace_: .none, optionalOption_: nil, animationOption_: .none, isGodChat_: false))
                    myChoiceText.textColor = .white
                    self.view.backgroundColor = UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
                    mainGameTableView.backgroundColor =  UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
                    choiceBarLine.backgroundColor = UIColor(red: 0.484, green: 0.581, blue: 0.671, alpha: 1)
                }
                else
                {
                    mainGameTableView.backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1)
                    player.currentChatArray.append(Chat(text_: "", image_: "", type_: .startGodChat, who_: .danhee, characterFace_: .none, optionalOption_: nil, animationOption_: .none, isGodChat_: true))
                    self.view.backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1)
                    myChoiceText.textColor = .black
                    choiceBarLine.backgroundColor = UIColor(red: 0.243, green: 0.357, blue: 0.459, alpha: 1)
                }
                mainGameTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)
            }
            player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex = currentBlockOfDay().choices[0].nextTextIndex
            player.indexNumber = 0
            chatUpdate()
            scrollToBottom()
            return
        }
        else if player.indexNumber < currentChatAmount() && currentBlockOfDay().chats[player.indexNumber].type == .ar
        {
            if timer != nil{
                timer.invalidate()
            }
            player.currentChatArray.append(currentBlockOfDay().chats[player.indexNumber])
            self.mainGameTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)
        }
        
        // 아래 네 개 각각 지금 챗에 새 업적/새 인물/새 역사 사건/새 인물 정보 있나 확인한 뒤 있는 경우 팝업창 띄우기/노트 정보 수정하는 코드입니다
        // 그 아래는 앨범 이미지 확인하는 함수예요
        checkAchievementInChat()
        checkGameCharacterInChat()
        checkCaseInChat()
        checkgameCharacterInfomationInChat()
//        popupOpen = globalPopupOpen
        checkAlbumImageInChat()
        checkCheckPointInChat()
        updateButtons()
        player.indexNumber += 1
        scrollToBottom()
    }
    
    func choiceUpdate(){
        isChoiceOn = true
        myChoiceText.isHidden = false
        choiceBarLine.isHidden = false
        if timer != nil{
            timer.invalidate()
        }
        self.choiceCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: false)
        pageControl.currentPage = 0
        choiceHeight.constant = 150
        choiceBar.setNeedsUpdateConstraints()
        choiceBar.isHidden = false
        safeAreaBottom.isHidden = false
        choiceCollectionView.reloadData()
        mainGameTableView.layoutIfNeeded()
        if !(player.currentChatArray.count == 1) && !player.currentChatArray.isEmpty{
            mainGameTableView.contentOffset.y += 149
        }
        scrollToBottom()
    }
    func closeChoiceBar(){
        myChoiceText.isHidden = true
        choiceBarLine.isHidden = true
        isChoiceOn = false
            choiceHeight.constant = 0
            choiceBar.isHidden = true
            safeAreaBottom.isHidden = true
            choiceBar.setNeedsUpdateConstraints()
            mainGameTableView.layoutIfNeeded()
    }
    
    func checkEnterAnimation(){
        if let animation = player.currentEpisodes[strToIndex(str: player.dayId)].storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]?.chats[player.indexNumber].animationOption
        {
            if (animation != .none)
            {
                timer.invalidate()
            }
            switch animation
            {
                case .none:
                    return
                case .fadeIn:
                    blackView.bounds = self.view.bounds
                    blackView.center = self.view.center
                    self.view.addSubview(blackView)
                    blackView.alpha = 1
                    UIView.animate(withDuration: 2.0) {
                        self.blackView.alpha = 0
                    } completion: { _ in
                        self.blackView.removeFromSuperview()
                        self.chatUpdateTimer()
                    }
                case .fadeOut:
                    blackView.bounds = self.view.bounds
                    blackView.center = self.view.center
                    self.view.addSubview(blackView)
                    blackView.alpha = 0
                    UIView.animate(withDuration: 2.0) {
                        self.blackView.alpha = 1
                    } completion: { _ in
                        self.blackView.removeFromSuperview()
                        self.chatUpdateTimer()
                    }
            }
        }
    }
    func alertTargetView(targetView: UIView, timeInterval : Double, firstColor : UIColor, secondColor : UIColor){
        alertTimer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: {timer in
            if targetView.backgroundColor == firstColor{
                targetView.backgroundColor = secondColor
            }else {
                targetView.backgroundColor = firstColor
            }
        })
    }
}

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

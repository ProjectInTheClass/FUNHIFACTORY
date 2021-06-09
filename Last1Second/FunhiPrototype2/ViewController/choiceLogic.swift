//
//  choiceLogic.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/11.
//

import UIKit

var isChoiceOn = false
var isGodChatOn = false

extension mainGameViewController{
    func chatUpdateTimer()
    {
        print("chatUpdateTimer 실행")
        timer = Timer.scheduledTimer(withTimeInterval: player.setting.textSpeed, repeats: true, block: {timer in
            self.chatUpdate()
            print(timer)
        })
        
    }
    func chatUpdate(){
        print("스토리 \(player.indexNumber)/\(currentChatAmount())")
        bgm()
        if (player.indexNumber != currentChatAmount())
        {
            checkEnterAnimation()
        }
        //게임 오버 시 뜰 배드엔딩 창 띄우기.
        if player.indexNumber == currentChatAmount() && currentBlockOfDay().choices[0].nextTextIndex == "badEnding"{
            print("타이머 여부 :\(timer == nil)")
            if timer != nil {
                print("timer invalidate")
                timer!.invalidate()
                timer = nil
              }
            player.currentChatId = "001"
            player.indexNumber = 0
            player.currentChatArray.removeAll()
            mainGameTableView.reloadData()
            let storyBoard=storyboard?.instantiateViewController(withIdentifier: "Ending")
            storyBoard?.modalPresentationStyle = .fullScreen
            performSegue(withIdentifier: "badEnding", sender: nil)
            //업적이랑 이미지나 캐릭터 정보를 다 삭제해야 하나?
            return
        }
        //에피소드를 깼을 때
        else if player.indexNumber == currentChatAmount() && currentBlockOfDay().choices[0].nextTextIndex == "episodeSuccess"{
            if timer != nil{
                timer.invalidate()
            }
            player.currentEpisodes[player.dayIndex].isCleared = true
            print("\(player.currentEpisodes[player.dayIndex].episodeID) 클리어")
            //currentChatArray를 저장해야 함.
            player.currentChatArray.removeAll()
            
//            let selectStageStoryBoard = storyboard?.instantiateViewController(withIdentifier: "selectStage")
//            selectStageStoryBoard?.modalPresentationStyle = .fullScreen
//            present(selectStageStoryBoard!, animated: true, completion: nil)
            performSegue(withIdentifier: "unwindSelectStage", sender: nil)
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
            player.currentChatId = currentBlockOfDay().choices[0].nextTextIndex
            player.indexNumber = 0
            chatUpdate()
            scrollToBottom()
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
        player.indexNumber += 1
        scrollToBottom()
    }
    
    func choiceUpdate(){
        isChoiceOn = true
        if timer != nil{
            timer.invalidate()
        }
        self.choiceCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: false)
        pageControl.currentPage = 0
        choiceHeight.constant = 149
        choiceBar.setNeedsUpdateConstraints()
        choiceBar.isHidden = false
        choiceCollectionView.reloadData()
        mainGameTableView.layoutIfNeeded()
        mainGameTableView.contentOffset.y += 149
        scrollToBottom()
    }
    func closeChoiceBar(){
        isChoiceOn = false
        if isGodChatOn == false{
            choiceHeight.constant = 0
            choiceBar.isHidden = true
            choiceBar.setNeedsUpdateConstraints()
            mainGameTableView.layoutIfNeeded()
            //scrollToBottom(input: 0)
        }
    }
    
    
    func bgm(){
        let bgm = currentBlockOfDay().backGroundMusic.info()
        guard bgm != currentBGM else {return}
        if bgm == ""    //bgm을 멈춰야 할 때
        {
            bgmPlayer?.stop()
            currentBGM = bgm
            return
        }
        else    //새로운 bgm이 들어왔을 때
        {
            audioConfigure(bgmName: bgm, isBGM: true, ofType: "mp3")
        }
    }
    
    func checkEnterAnimation(){
        if let animation = player.currentEpisodes[strToIndex(str: player.dayId)].storyBlocks[player.currentChatId]?.chats[player.indexNumber].animationOption
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

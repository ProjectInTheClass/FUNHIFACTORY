//
//  choiceLogic.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/11.
//

import UIKit

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
        print("------------chatUpdate 시작합니다------------")
        print("현재 속도: \(player.setting.textSpeed)")
        print("스토리 \(player.indexNumber)/\(currentChatAmount())")
        //게임 오버 시 뜰 배드엔딩 창 띄우기.
        if player.indexNumber == currentChatAmount() && currentBlockOfDay().choices[0].nextTextIndex == "badEnding"{
            timer.invalidate()
            player.currentChatId = "001"
            player.indexNumber = 0
            player.currentChatArray.removeAll()
            mainGameTableView.reloadData()
            let storyBoard=storyboard?.instantiateViewController(withIdentifier: "Ending")
            storyBoard?.modalPresentationStyle = .fullScreen
            present(storyBoard!, animated: true, completion: nil)
            //업적이랑 이미지나 캐릭터 정보를 다 삭제해야 하나?
            return
        }
        //에피소드를 깼을 때
        else if player.indexNumber == currentChatAmount() && currentBlockOfDay().choices[0].nextTextIndex == "episodeSuccess"{
            timer.invalidate()
            player.currentEpisodes[player.dayIndex].isCleared = true
            print("\(player.currentEpisodes[player.dayIndex].episodeID) 클리어")
            //currentChatArray를 저장해야 함.
            player.currentChatArray.removeAll()
            
            let selectStageStoryBoard = storyboard?.instantiateViewController(withIdentifier: "selectStage")
            selectStageStoryBoard?.modalPresentationStyle = .fullScreen
            present(selectStageStoryBoard!, animated: true, completion: nil)
            return
        }
        else if player.indexNumber < currentChatAmount() && currentBlockOfDay().chats[player.indexNumber].type != .ar{
            print("채팅이 업데이트되었습니다.")
            player.currentChatArray.append(currentBlockOfDay().chats[player.indexNumber])
            self.mainGameTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)}
        
        else if player.indexNumber == currentChatAmount() && currentBlockOfDay().choices[0].nextTextIndex == "End"{
            //챕터가 끝났을 때
            guard timer != nil else {return}
            timer.invalidate()
        }
        else if player.indexNumber == currentChatAmount() && currentBlockOfDay().choiceSkip == false{
            //선택지가 나올 때
            timer.invalidate()
            print("invalidate")
            guard player.currentChatArray.last?.type != .choice else {return}
            choiceUpdate()
            return
        } else if player.indexNumber == currentChatAmount() && currentBlockOfDay().choiceSkip == true{
            //선택지 없이 바로 다음 스토리블럭으로 갈 때
            player.currentChatId = currentBlockOfDay().choices[0].nextTextIndex
            player.indexNumber = 0
            chatUpdate()
            scrollToBottom()
            return
        } else if player.indexNumber < currentChatAmount() && currentBlockOfDay().chats[player.indexNumber].type == .ar{
            timer.invalidate()
            player.currentChatArray.append(currentBlockOfDay().chats[player.indexNumber])
            self.mainGameTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)
        }
        
        // 아래 네 개 각각 지금 챗에 새 업적/새 인물/새 역사 사건/새 인물 정보 있나 확인한 뒤 있는 경우 팝업창 띄우기/노트 정보 수정하는 코드입니다
        // 그 아래는 앨범 이미지 확인하는 함수예요
        checkAchievementInChat()
        checkGameCharacterInChat()
        checkCaseInChat()
        checkgameCharacterInfomationInChat()
        popupOpen = globalPopupOpen
        checkAlbumImageInChat()
        player.indexNumber += 1
        scrollToBottom()
    }
    
    func choiceUpdate(){
        isChoiceOn = true
        timer.invalidate()
        self.choiceCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: false)
        pageControl.numberOfPages = 0
        choiceHeight.constant = 149
        choiceBar.setNeedsUpdateConstraints()
        choiceBar.isHidden = false
        choiceCollectionView.reloadData()
        mainGameTableView.layoutIfNeeded()
        mainGameTableView.contentOffset.y += 149 //231
        scrollToBottom()
    }
    func closeChoiceBar(){
        isChoiceOn = false
        choiceHeight.constant = 0
        choiceBar.isHidden = true
        choiceBar.setNeedsUpdateConstraints()
        mainGameTableView.layoutIfNeeded()
        scrollToBottom()
    }
    
    func checkLikability(choiceNumber : Int){
        let choiceLikability = currentBlockOfDay().choices[choiceNumber].likability
        guard choiceLikability.count != 0 else {return}
        for a in choiceLikability{
            let target = a.who
            let amount = a.number
            target.info().likability = target.info().likability + amount
            print("\(target.info().name)의 호감도에 \(amount)만큼 변동")
        }
    }
}

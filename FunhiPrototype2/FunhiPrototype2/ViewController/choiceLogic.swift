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
        print("------------chatUpdate 시작합니다------------")
        print("현재 속도: \(player.setting.textSpeed)")
        print("스토리 \(player.indexNumber)/\(currentChatAmount())")
        //게임 오버 시 뜰 배드엔딩 창 띄우기.
        if player.indexNumber == currentChatAmount() && currentBlockOfDay().choices[0].nextTextIndex == "badEnding"{
            while timer == nil{
                timer.invalidate()
            }
            player.currentChatId = "001"
            player.indexNumber = 0
            player.currentChatArray.removeAll()
            player.currentGodChatArray.removeAll()
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
            if currentBlockOfDay().isGodChat == .on{
                player.currentGodChatArray.append(currentBlockOfDay().chats[player.indexNumber])
                self.godChatTableView.insertRows(at: [IndexPath(row: player.currentGodChatArray.count-1, section: 0)], with: .none)
            }else if currentBlockOfDay().isGodChat == .off{
                player.currentChatArray.append(currentBlockOfDay().chats[player.indexNumber])
                self.mainGameTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)
            }
        }
        
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
            scrollToBottom(input: 0)
            scrollToBottom(input: 1)
            return
        } else if player.indexNumber < currentChatAmount() && currentBlockOfDay().chats[player.indexNumber].type == .ar{
            timer.invalidate()
            player.currentChatArray.append(currentBlockOfDay().chats[player.indexNumber])
            self.mainGameTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)
        }
        
        // 아래 네 개 각각 지금 챗에 새 업적/새 인물/새 역사 사건/새 인물 정보 있나 확인한 뒤 있는 경우 팝업창 띄우기/노트 정보 수정하는 코드입니다
        // 그 아래는 앨범 이미지 확인하는 함수예요
        checkAchievementInChat(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel)
        checkGameCharacterInChat(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel)
        checkCaseInChat(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel)
        checkgameCharacterInfomationInChat(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel)
        popupOpen = globalPopupOpen
        checkAlbumImageInChat()
        player.indexNumber += 1
        if isGodChatOn == true{
            scrollToBottom(input: 1)
        }else {
            scrollToBottom(input: 0)
        }
    }
    
    func choiceUpdate(){
        isChoiceOn = true
        timer.invalidate()
        //현재 채팅이 isGodChat on일때는 메인게임의 선택지는 작동 안되도록. 메인게임채팅 중일때는 신 채팅창의 선택지가 나오지 못하도록
        if isGodChatOn == true && currentBlockOfDay().isGodChat == .on{
            self.godChatCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: false)
            pageControl.currentPage = 0
            godChatChoiceHeight.constant = 183
            godChatChoiceBar.setNeedsUpdateConstraints()
            godChatChoiceBar.isHidden = false
            godChatCollectionView.reloadData()
            godChatTableView.layoutIfNeeded()
            godChatTableView.contentOffset.y += 183
            scrollToBottom(input: 1)
        }else if isGodChatOn == false && currentBlockOfDay().isGodChat == .off{
            self.choiceCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: false)
            pageControl.currentPage = 0
            choiceHeight.constant = 149
            choiceBar.setNeedsUpdateConstraints()
            choiceBar.isHidden = false
            choiceCollectionView.reloadData()
            mainGameTableView.layoutIfNeeded()
            mainGameTableView.contentOffset.y += 149 //231
            scrollToBottom(input: 0)
        }
    }
    func closeChoiceBar(){
        isChoiceOn = false
        if isGodChatOn == true{
            godChatChoiceHeight.constant = 0
            godChatChoiceBar.isHidden = true
            godChatChoiceBar.setNeedsUpdateConstraints()
            godChatTableView.layoutIfNeeded()
            //scrollToBottom(input: 1)
        }else if isGodChatOn == false{
            choiceHeight.constant = 0
            choiceBar.isHidden = true
            choiceBar.setNeedsUpdateConstraints()
            mainGameTableView.layoutIfNeeded()
            //scrollToBottom(input: 0)
        }
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

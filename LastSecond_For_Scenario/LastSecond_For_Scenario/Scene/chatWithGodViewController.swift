//
//  chatWithGodViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/11.
//

import UIKit

class chatWithGodViewController: UIViewController {

    @IBOutlet var godChatTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closeView(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
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
        if player.indexNumber < currentChatAmount(){
            print("채팅이 업데이트되었습니다.")
            player.currentChatArray.append(currentBlockOfDay().chats[indexNumber])
            self.godChatTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)}
        else if player.indexNumber == currentChatAmount() && currentBlockOfDay().choices[0].nextTextIndex == "End"{
            guard timer != nil else {return}
            timer.invalidate()
        }
        if player.indexNumber == currentChatAmount() && currentBlockOfDay().choiceSkip == false{
            timer.invalidate()
            print("invalidate")
            guard player.currentChatArray.last?.type != .choice else {return}

            choiceUpdate()
            /*currentChatArray.append(Chat(text: "**선택지가 나올 자리**", image: "", type: .choice, who: danhee, characterFace: false))

            self.godChatTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
            print("선택지 대용 엘리먼트 추가")
            scrollToBottom()*/
            return
        } else if player.indexNumber == currentChatAmount() && currentBlockOfDay().choiceSkip == true{
            player.currentChatId = currentBlockOfDay().choices[0].nextTextIndex
            player.indexNumber = 0
            chatUpdate()
            scrollToBottom()
            return
        }
        print("스토리 \(player.indexNumber+1)/\(currentChatAmount())")
        // 아래 네 개 각각 지금 챗에 새 업적/새 인물/새 역사 사건/새 인물 정보 있나 확인한 뒤 있는 경우 팝업창 띄우기/노트 정보 수정하는 코드입니다
        // 그 아래는 앨범 이미지 확인하는 함수예요
        checkAchievementInChat()
        checkGameCharacterInChat()
        checkCaseInChat()
        checkgameCharacterInfomationInChat()
        checkAlbumImageInChat()
        player.indexNumber += 1
        scrollToBottom()
    }
    
    func choiceUpdate(){
        choiceHeight.constant = 149
        choiceBar.setNeedsUpdateConstraints()
        choiceBar.isHidden = false
        choiceCollectionView.reloadData()
        scrollToBottom()
    }
    func closeChoiceBar(){
        choiceHeight.constant = 0
        choiceBar.isHidden = true
        choiceBar.setNeedsUpdateConstraints()
        scrollToBottom()
    }
}

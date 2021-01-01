//
//  mainGameViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import UIKit

class mainGameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //Outlet
    
    var recieved: String?
    
    @IBOutlet var mainGameTableView: UITableView!
    @IBOutlet var godChat: UIView!
    

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentChatArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatText = currentChatArray[indexPath.row].text

        //텍스트 채팅이 나올 때
            //자신이 보냈을 때
                if currentChatArray[indexPath.row].type == .onlyText && currentChatArray[indexPath.row].who.info().name == "키렐"{
                    let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! myTextTableViewCell
                    cell.myTextCellUpdate(name: currentChatArray[indexPath.row].who.info().name, chat: chatText, profile: currentChatArray[indexPath.row].who.info().profileImage)
                    return cell
                }
            //상대가 보냈을 때
                else if currentChatArray[indexPath.row].type == .onlyText{
                    let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "opTextCell", for: indexPath) as! opTextTableViewCell
                    cell.opTextCellUpdate(name: currentChatArray[indexPath.row].who.info().name, chat: chatText, profile: currentChatArray[indexPath.row].who.info().profileImage)
                    return cell
                }
            //터치할 수 없는 이미지
                //자신이 보냈을 때.
            else if currentChatArray[indexPath.row].type == .untouchableImage {
                let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell

                cell.imageUpdate(name: currentChatArray[indexPath.row].who.info().name,pfImage: currentChatArray[indexPath.row].who.info().profileImage,mainImage: currentChatArray[indexPath.row].image)
                return cell
                }
            //행동 표시글 셀
            else if currentChatArray[indexPath.row].type == .sectionHeader{
                let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! sectionTableViewCell
                cell.sectionText.text = currentChatArray[indexPath.row].text
                return cell
            } else {
                let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! myTextTableViewCell
                cell.myTextCellUpdate(name: currentChatArray[indexPath.row].who.info().name, chat: chatText, profile: currentChatArray[indexPath.row].who.info().profileImage)
                return cell
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainGameTableView.delegate = self
        self.mainGameTableView.dataSource = self
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
        if indexNumber < currentChatAmount() && currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber].type == .onlyText{
            print("채팅이 업데이트되었습니다.")
            currentChatArray.append(currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber])
            self.mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
        if indexNumber == currentChatAmount() && currentDay().storyBlocks[player.currentChatId]!.choices[0].nextTextIndex == "End"{
            guard timer != nil else {return}
            timer.invalidate()
        }
        if indexNumber == currentChatAmount() && currentDay().storyBlocks[player.currentChatId]!.choiceSkip == false{
            timer.invalidate()
            print("invalidate")
            guard currentChatArray.last?.type != .choice else {return}
            currentChatArray.append(Chat(text: "**선택지가 나올 자리**", image: "", type: .choice, who: .kirell, characterFace: false))
            self.mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
            print("선택지 대용 엘리먼트 추가")
            scrollToBottom()
            return
        } else if indexNumber == currentChatAmount() && currentDay().storyBlocks[player.currentChatId]!.choiceSkip == true{
            player.currentChatId = currentBlockOfDay().choices[0].nextTextIndex
            indexNumber = 0
            chatUpdate()
            scrollToBottom()
            return
        }
        print("스토리 \(indexNumber+1)/\(currentChatAmount())")
        
        indexNumber += 1
        scrollToBottom()
    }
}
    //가장 밑으로 스크롤해주는 함수
    func scrollToBottom(){
        guard currentChatArray.count != 0 else {return}
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: currentChatArray.count-1, section: 0)
            self.mainGameTableView.scrollToRow(at: indexPath, at: .bottom, animated: false) //true로 바꾸면 좀 더 천천히 내려가긴 하는데, 못 따라오는 경우도 있다.
        }
    }
}

//
//  godChatViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/02/01.
//

import UIKit

class godChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var choiceHeight: NSLayoutConstraint!
    @IBOutlet var choicePageControl: UIPageControl!
    @IBOutlet var godChoiceCollectionView: UICollectionView!
    @IBOutlet var choiceBar: UIView!
    @IBOutlet var godChatTableView: UITableView!
    
    var isChoiceOn = false
    override func viewDidLoad() {
        super.viewDidLoad()
        godChatTableView.dataSource = self
        godChatTableView.delegate = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        player.currentChatArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if dummyData.stories[player.dayId]?.storyBlocks[player.currentChatId]?.isGodChat == .on{
            let chatText = player.currentChatArray[indexPath.row].text
            print("cellForRowAt")
            //텍스트 채팅이 나올 때
                //자신이 보냈을 때
            if player.currentChatArray[indexPath.row].type == .onlyText && player.currentChatArray[indexPath.row].who.info().name == "이단희"{
                print("자신 텍스트 출력")
                        let cell = godChatTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! myTextTableViewCell
                cell.myTextCellUpdate(name: player.currentChatArray[indexPath.row].who.info().name, chat: chatText, profile: player.currentChatArray[indexPath.row].characterFace)
                        return cell
                    }
                //상대가 보냈을 때
                    else if player.currentChatArray[indexPath.row].type == .onlyText {
                        print("상대 텍스트 출력")
                        let cell = godChatTableView.dequeueReusableCell(withIdentifier: "opTextCell", for: indexPath) as! opTextTableViewCell
                        cell.opTextCellUpdate(name: player.currentChatArray[indexPath.row].who.info().name, chat: chatText,normalProfile: player.currentChatArray[indexPath.row].who.info().profileImage, mainProfile: player.currentChatArray[indexPath.row].characterFace, isLocked: player.currentChatArray[indexPath.row].who.info().isLocked, profileBackGroundColor: player.currentChatArray[indexPath.row].who.info().profileBackgroundColor)
                        return cell
                    }
                //터치할 수 없는 이미지
                else if player.currentChatArray[indexPath.row].type == .untouchableImage {
                    print("이미지 출력")
                    let cell = godChatTableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell

                    cell.imageUpdate(mainImage: player.currentChatArray[indexPath.row].image)
                    return cell
                    }
                //행동 표시글 셀
                else if player.currentChatArray[indexPath.row].type == .sectionHeader{
                    print("섹션헤더 출력")
                    let cell = godChatTableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! sectionTableViewCell
                    cell.sectionUpdate(text:chatText)
                    return cell
                }
                else if player.currentChatArray[indexPath.row].type == .monologue{
                    print("속마음 채팅 출력")
                    let cell = godChatTableView.dequeueReusableCell(withIdentifier: "monologue", for: indexPath) as! monologueTableViewCell
                    cell.monologueText.text = chatText
                    cell.chatUpdate(nickname: player.currentChatArray[indexPath.row].who.info().name, profile: player.currentChatArray[indexPath.row].characterFace)
                    return cell
                }
                else {
                    print("그 외")
                    let cell = godChatTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! myTextTableViewCell
                    cell.myTextCellUpdate(name: player.currentChatArray[indexPath.row].who.info().name, chat: chatText, profile: player.currentChatArray[indexPath.row].characterFace)
                    return cell
                }
        } else{
            return UITableViewCell()
        }
        
    }
    @IBAction func xButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
        timer.invalidate()
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
        print("스토리 \(player.indexNumber)/\(currentChatAmount())")
        //게임 오버 시 뜰 배드엔딩 창 띄우기.
        if player.indexNumber == currentChatAmount() && currentBlockOfDay().choices[0].nextTextIndex == "badEnding"{
            timer.invalidate()
            player.currentChatId = "001"
            player.indexNumber = 0
            player.currentChatArray.removeAll()
            godChatTableView.reloadData()
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
            self.godChatTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)}
        
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
            self.godChatTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)
        }
        
        // 아래 네 개 각각 지금 챗에 새 업적/새 인물/새 역사 사건/새 인물 정보 있나 확인한 뒤 있는 경우 팝업창 띄우기/노트 정보 수정하는 코드입니다
        // 그 아래는 앨범 이미지 확인하는 함수예요
        /*
         checkAchievementInChat(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel)
         checkGameCharacterInChat(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel)
         checkCaseInChat(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel)
         checkgameCharacterInfomationInChat(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel)
         popupOpen = globalPopupOpen
         */
        checkAlbumImageInChat()
        player.indexNumber += 1
        scrollToBottom()
    }
    
    func choiceUpdate(){
        isChoiceOn = true
        timer.invalidate()
            DispatchQueue.main.async {
                let indexPath = IndexPath(row: player.currentChatArray.count-1, section: 0)
                self.godChoiceCollectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition(rawValue: 0), animated: false)
                self.choicePageControl.numberOfPages = 0
            }
        choiceHeight.constant = 149
        choiceBar.setNeedsUpdateConstraints()
        choiceBar.isHidden = false
        godChoiceCollectionView.reloadData()
        godChatTableView.heightAnchor.constraint(equalToConstant: 459).isActive = true
        godChatTableView.layoutIfNeeded()
        godChatTableView.contentOffset.y += 149 //231
        scrollToBottom()
    }
    func closeChoiceBar(){
        isChoiceOn = false
        choiceHeight.constant = 0
        choiceBar.isHidden = true
        choiceBar.setNeedsUpdateConstraints()
        godChatTableView.heightAnchor.constraint(equalToConstant: 608).isActive = true
        godChatTableView.layoutIfNeeded()
        //godChatTableView.contentOffset.y -= 149
        scrollToBottom()
    }
    func scrollToBottom(){
        guard player.currentChatArray.count != 0 else {return}
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: player.currentChatArray.count-1, section: 0)
            self.godChatTableView.scrollToRow(at: indexPath, at: .bottom, animated: false) //true로 바꾸면 좀 더 천천히 내려가긴 하는데, 못 따라오는 경우도 있다.
        }
    }
}

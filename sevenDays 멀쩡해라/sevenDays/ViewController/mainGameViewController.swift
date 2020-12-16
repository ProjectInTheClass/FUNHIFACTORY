//
//  ViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/25.
//

import UIKit

class mainGameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    @IBOutlet var wholeView: UIView!
    @IBOutlet var mainGameTableView: UITableView!
    @IBOutlet var pauseBar: UIView!
    @IBOutlet var resumeButton: UIButton!
    @IBOutlet var homeButton: UIButton!
    @IBOutlet var imagePopUpView: UIView!
    @IBOutlet var popUpImage: UIImageView!
    @IBOutlet var textPopUpView: UIView!
    @IBOutlet var textPopUpProfile: UIImageView!
    @IBOutlet var textPopUpText: UILabel!
    @IBOutlet var chapterCoverTitle: UILabel!
    @IBOutlet var chapterCoverName: UILabel!
    @IBOutlet var chapterCoverImage: UIImageView!
    @IBOutlet var chapterCover: UIView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentChatArray.count
    }
    var dd = 0
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        dd += 1
        print("//\(dd)번째 TableView 업데이트//")
        
        var cellToReturn = UITableViewCell()
        let chatText = currentChatArray[indexPath.row].text
        //블록의 마지막 챗에 도달했을 때, 선택지 셀을 출력하는 조건문.
        if  indexNumber == currentChatAmount() && currentChatArray[indexPath.row].isItLastPage == false{
            choiceCell = true
            let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "choiceTableViewCell", for: indexPath) as! choiceTableViewCell
            cell.cellDelegate = self
            print("선택지 1 : \(currentBlockOfDay().choices[0].text)")
            print("선택지 2 : \(currentBlockOfDay().choices[1].text)")
            cell.firstChoiceButton.setTitle(currentBlockOfDay().choices[0].text, for: .normal)
            cell.secondChoiceButton.setTitle(currentBlockOfDay().choices[1].text, for: .normal)
            cellToReturn = cell
            print(currentChatArray)
        }
        //키렐의 텍스트 채팅이 나올 때
        else if currentChatArray[indexPath.row].type == .onlyText && currentChatArray[indexPath.row].who.info().name == "키렐"{
            let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myOnlyText", for: indexPath) as! myOnlyTextTableViewCell
            cell.myChatUpdate(name: currentChatArray[indexPath.row].who.info().name, chat: chatText)
            cell.myProfileUpdate(imageName: currentChatArray[indexPath.row].who.info().profileImage)
            cellToReturn = cell
        }
        //상대가 텍스트 채팅으로 말을 할 때
        else if currentChatArray[indexPath.row].type == .onlyText{
            let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "opOnlyText", for: indexPath) as! opOnlyTextTableViewCell
            cell.opTextCellUpdate(name: currentChatArray[indexPath.row].who.info().name, chat: chatText, imageName: currentChatArray[indexPath.row].who.info().profileImage, characterFace: currentChatArray[indexPath.row].characterFace)
            cellToReturn = cell
        }
        //행동 표시글 셀
        else if currentChatArray[indexPath.row].type == .sectionHeader{
            let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "sectionHeaderCell", for: indexPath) as! sectionHeaderTableViewCell
            cell.headerLabel.text = currentChatArray[indexPath.row].text
            cellToReturn = cell
        }
        //터치할 수 없는 이미지
        else if currentChatArray[indexPath.row].type == .untouchableImage {
            //자신이 보냈을 때.
            if currentChatArray[indexPath.row].who.info().name == "키렐" {
                let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myUnTouchableImage", for: indexPath) as! myUntouchableImageTableViewCell
                
                cell.imageUpdate(name: currentChatArray[indexPath.row].who.info().name,pfImage: currentChatArray[indexPath.row].who.info().profileImage,mainImage: currentChatArray[indexPath.row].image)
                cellToReturn = cell
            }
            //상대가 보냈을 때
            else {
                let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "opUntouchAbleImage", for: indexPath) as! opUntouchableImageTableViewCell
                cell.update(name: currentChatArray[indexPath.row].who.info().name, profile: currentChatArray[indexPath.row].who.info().profileImage, main: currentChatArray[indexPath.row].image)
                cellToReturn = cell
            }
               
        }
        //터치할 수 있는 이미지를 자신이 보냈을 때
        else if currentChatArray[indexPath.row].type == .touchableImage {
            if currentChatArray[indexPath.row].who.info().name == "키렐"{
                let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myTouchableImage", for: indexPath) as! myTouchableImageTableViewCell
                cell.update(profile: currentChatArray[indexPath.row].who.info().profileImage, name: currentChatArray[indexPath.row].who.info().name, main: currentChatArray[indexPath.row].image)
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageScaleUp))
                cell.mainImage.tag = indexPath.row
                cell.mainImage.addGestureRecognizer(tapGesture)
                cellToReturn = cell
            }
            else {
                let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "opTouchableImage", for: indexPath) as! opTouchableImageTableViewCell
                cell.update(profile: currentChatArray[indexPath.row].who.info().profileImage, name: currentChatArray[indexPath.row].who.info().name, main: currentChatArray[indexPath.row].image)
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageScaleUp))
                cell.mainImage.tag = indexPath.row
                cell.mainImage.addGestureRecognizer(tapGesture)
                cellToReturn = cell
            }
        }
        //print("현재 챗 아이디 : \(player.currentChatId)")
        return cellToReturn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainGameTableView.refreshControl = nil
        self.mainGameTableView.delegate = self
        self.mainGameTableView.dataSource = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(chatUpdateObjc))
        textPopUpView.addGestureRecognizer(tapGesture)
        textPopUpView.isUserInteractionEnabled = true
        let coverTapGesture = UITapGestureRecognizer(target: self, action: #selector(chapterCoverTapped))
        chapterCover.addGestureRecognizer(coverTapGesture)
        chapterCover.isUserInteractionEnabled = true
        
    }
    @objc func chatUpdateObjc(){
        chatUpdate()
    }
    override func viewDidAppear(_ animated: Bool) {
        chatUpdateTimer()
    }
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard choiceCell == false else {return}
        chatUpdate()
    }
    //상단 퍼즈버튼 눌렀을 때
    @IBAction func pause(_ sender: Any) {
        pauseBar.isHidden = false
    }
    //상단 퍼즈버튼 누른 후, 홈 버튼
    @IBAction func goHome(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //상단 퍼즈버튼 누른 후, 재생 버튼
    @IBAction func resume(_ sender: Any) {
        pauseBar.isHidden = true
    }
    //이미지 팝업 후 닫기 버튼
    @IBAction func imagePopUpClose(_ sender: Any) {
        imagePopUpView.isHidden = true
        wholeView.sendSubviewToBack(imagePopUpView)
    }
    func chapterUpdate(){
            //챕터 넘기기
            player.dayIndex += 1
            player.dayId = "day+\(player.dayIndex)"
            player.currentChatId = dummyData.stories[player.dayId]!.startEpisode
            currentChatArray.removeAll()
            mainGameTableView.reloadData()
            //챕터 커버 업데이트
            chapterCover.isHidden = false
            wholeView.bringSubviewToFront(chapterCover)
            chapterCoverTitle.text = "\(dummyData.stories[player.dayId]?.chapter.chapterNumber) 일 차"
            chapterCoverName.text = dummyData.stories[player.dayId]?.chapter.chapterName
            chapterCoverImage.image = UIImage(named: (dummyData.stories[player.dayId]?.chapter.chapterImage)!)
    }
    @objc func chapterCoverTapped(){
        chapterCover.isHidden = true
        wholeView.sendSubviewToBack(chapterCover)
        chatUpdateTimer()
    }
    
    
    var choiceCell = false
    //채팅 자동으로 올라오게 하는 함수
    var timer:Timer!
    func chatUpdateTimer()
    {
        print("chatUpdateTimer 실행")
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {timer in
            self.chatUpdate()
            print(timer)
        })
    }
    func chatUpdate(){
        print("------------chatUpdate 시작합니다------------")
        self.textPopUpView.isHidden = true
        if indexNumber < currentChatAmount() && currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber].type != .textPopup{
            print("채팅이 업데이트되었습니다.")
            currentChatArray.append(currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber])
            self.mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
        } else if indexNumber < currentChatAmount() && currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber].type == .textPopup {
            print("텍스트 팝업이 실행되었습니다.")
            currentChatArray.append(currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber])
            self.textPopUpView.isHidden = false
            self.wholeView.bringSubviewToFront(self.textPopUpView)
            self.textPopUpdate()
            currentChatArray.removeLast()
        }
        if currentDay().storyBlocks[player.currentChatId]!.choices[0].nextTextId == "End"{
            chapterUpdate()
        }
        if indexNumber == currentChatAmount() && currentDay().storyBlocks[player.currentChatId]!.choiceSkip == false{
            timer.invalidate()
            print("invalidate")
            currentChatArray.append(Chat(text: "**선택지가 나올 자리**", image: "", type: .onlyText, who: .kirell, characterFace: false, isItLastPage: false))
            self.mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
            print("선택지 대용 엘리먼트 추가")
            scrollToBottom()
            return
        } else if indexNumber == currentChatAmount() && currentDay().storyBlocks[player.currentChatId]!.choiceSkip == true{
            player.currentChatId = currentBlockOfDay().choices[0].nextTextId
            indexNumber = 0
            chatUpdate()
            scrollToBottom()
            return
        }
        print("스토리 \(indexNumber+1)/\(currentChatAmount())")
        
        indexNumber += 1
        scrollToBottom()
    }
    
    //가장 밑으로 스크롤해주는 함수
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: currentChatArray.count-1, section: 0)
            self.mainGameTableView.scrollToRow(at: indexPath, at: .bottom, animated: false) //true로 바꾸면 좀 더 천천히 내려가긴 하는데, 못 따라오는 경우도 있다.
        }
    }
    
    //이미지를 터치하면 팝업 띄우는 함수
    @objc func imageScaleUp(_ sender: UITapGestureRecognizer){
        imagePopUpView.isHidden = false
        wholeView.bringSubviewToFront(imagePopUpView)
        popUpImage.image = UIImage(named: currentChatArray[sender.view!.tag].image)
    }
    func textPopUpdate(){
        textPopUpProfile.image = UIImage(named:currentChatArray[currentChatArray.count-1].who.info().profileImage)
        textPopUpText.text = currentChatArray[currentChatArray.count-1].text
    }
}

//선택지 Action 로직
extension mainGameViewController : choiceCellDelegate{
    func firstChoice(){
        currentChatArray.removeLast()
        currentChatArray.append(Chat(text: currentBlockOfDay().choices[0].text, image: "", type: .onlyText, who: .kirell,characterFace: true, isItLastPage: false))
        player.currentChatId = currentBlockOfDay().choices[0].nextTextId
        mainGameTableView.reloadRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
        print("First button tapped")
        
        indexNumber = 0
        choiceCell = false
        print(currentChatArray)
        chatUpdateTimer()
    }
    func secondChoice() {
        currentChatArray.removeLast()
        currentChatArray.append(Chat(text: currentBlockOfDay().choices[1].text, image: "", type: .onlyText, who: .kirell, characterFace: true, isItLastPage: false))
        player.currentChatId = currentBlockOfDay().choices[1].nextTextId
        mainGameTableView.reloadRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
        print("Second button Tapped")
        
        
        indexNumber = 0
        choiceCell = false
        print(currentChatArray)
        chatUpdateTimer()
    }
}


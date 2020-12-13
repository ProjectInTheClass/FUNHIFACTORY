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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentChatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellToReturn = UITableViewCell()
        let chatText = currentChatArray[indexPath.row].text
        //블록의 마지막 챗에 도달했을 때, 선택지 셀을 출력하는 조건문.
        if  indexNumber == currentChatAmount() {
            choiceCell = true
            let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "choiceTableViewCell", for: indexPath) as! choiceTableViewCell
            cell.cellDelegate = self
            print("선택지 1 : \(currentBlockOfDay().choices[0].text)")
            print("선택지 2 : \(currentBlockOfDay().choices[1].text)")
            //cell.choiceUpdate(first: currentBlockOfDay().choices[0], second: currentBlockOfDay().choices[1])
            cellToReturn = cell
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
        scrollToBottom()
        print(currentChatArray.last)
        return cellToReturn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainGameTableView.delegate = self
        self.mainGameTableView.dataSource = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(chatUpdateObjc))
        textPopUpView.addGestureRecognizer(tapGesture)
        textPopUpView.isUserInteractionEnabled = true
    }
    @objc func chatUpdateObjc(){
        chatUpdate()
    }
    override func viewDidAppear(_ animated: Bool) {
        chatUpdate()
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
        let chapterNumber = 0
    }
    
    
    
    var choiceCell = false
    //채팅 자동으로 올라오게 하는 함수
    var timer:Timer!
    func chatUpdateTimer()
    {
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: {timer in
            self.chatUpdate()
        })
    }
    func chatUpdate(){
        self.textPopUpView.isHidden = true
        if indexNumber < currentChatAmount() && currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber].type != .textPopup{
            currentChatArray.append(currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber])
            self.mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
        } else if indexNumber < currentChatAmount() && currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber].type == .textPopup {
            currentChatArray.append(currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber])
            self.textPopUpView.isHidden = false
            self.wholeView.bringSubviewToFront(self.textPopUpView)
            self.textPopUpdate()
            currentChatArray.removeLast()
            self.chatUpdateTimer()
        }
        if indexNumber == currentChatAmount(){
            timer.invalidate()
            currentChatArray.append(currentDay().storyBlocks[player.currentChatId]!.chats[0])
            self.mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
            return
        }
        print("스토리 \(indexNumber)/\(currentChatAmount())")
        indexNumber += 1
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
    /*func tapping(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(skipChat))
        mainGameTableView.addGestureRecognizer(tap)
        mainGameTableView.isUserInteractionEnabled = true
        tap.delegate = self
    }*/
}

//선택지 Action 로직
extension mainGameViewController : choiceCellDelegate{
    func firstChoice(){
        player.currentChatId = currentBlockOfDay().choices[0].nextTextId
        currentChatArray.removeLast()
        mainGameTableView.deleteRows(at: [IndexPath(row: currentChatArray.count, section: 0)], with: .none)
        currentChatArray.append(Chat(text: currentBlockOfDay().choices[0].text, image: "", type: .onlyText, who: .kirell, characterFace: true, isItLastPage: false))     //선택지 창이 뜨게 하기 위한 더미 Chat 파일. 직접 보이진 않음.(채우기 용)
           //indexNumber 초기화
        mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
        print("First button tapped")
        indexNumber = 0
        choiceCell = false
        chatUpdateTimer()
    }
    func secondChoice() {
        player.currentChatId = currentBlockOfDay().choices[1].nextTextId
        currentChatArray.removeLast()
        mainGameTableView.deleteRows(at: [IndexPath(row: currentChatArray.count, section: 0)], with: .none)
        currentChatArray.append(Chat(text: currentBlockOfDay().choices[1].text, image: "", type: .onlyText, who: .kirell, characterFace: true, isItLastPage: false))
        mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
        print("Second button Tapped")
        indexNumber = 0
        choiceCell = false
        chatUpdateTimer()
    }
}


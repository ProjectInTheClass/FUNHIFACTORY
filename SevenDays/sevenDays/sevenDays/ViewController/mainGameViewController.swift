//
//  ViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/25.
//

import UIKit

class mainGameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var mainGameTableView: UITableView!
    @IBOutlet var pauseBar: UIView!
    @IBOutlet var resumeButton: UIButton!
    @IBOutlet var homeButton: UIButton!
    
    var indexNumber = 0
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentChatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellToReturn = UITableViewCell()
        let chatText = currentChatArray[indexPath.row].text
        
        if indexNumber == currentDay().storyBlocks[player.currentChatId]!.chats.count {
            print("초이스 시작")
            let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "choiceTableViewCell", for: indexPath) as! choiceTableViewCell
            cell.cellDelegate = self
            print(currentBlockOfDay().choices[0].text)
            print(currentBlockOfDay().choices[1].text)
            cell.firstChoiceButton.setTitle(currentBlockOfDay().choices[0].text, for: .normal)
            cell.secondChoiceButton.setTitle(currentBlockOfDay().choices[1].text, for: .normal)
            //cell.choiceUpdate(first: currentBlockOfDay().choices[0], second: currentBlockOfDay().choices[1])
            cellToReturn = cell
        } else if (currentChatArray[indexPath.row].type == .onlyText||currentChatArray[indexPath.row].type == .textPopup) && currentChatArray[indexPath.row].who.info().name == "키렐"{
            let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myOnlyText", for: indexPath) as! myOnlyTextTableViewCell
            cell.myChatUpdate(name: currentChatArray[indexPath.row].who.info().name, chat: chatText)
            cell.myProfileUpdate(imageName: currentChatArray[indexPath.row].who.info().profileImage)
            cellToReturn = cell
        } else if currentChatArray[indexPath.row].type == .onlyText{
            let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "opOnlyText", for: indexPath) as! opOnlyTextTableViewCell
            cell.opChatUpdate(name: currentChatArray[indexPath.row].who.info().name, chat: chatText)
            cell.opProfileUpdate(imageName: currentChatArray[indexPath.row].who.info().profileImage)
            cellToReturn = cell
        } else if currentChatArray[indexPath.row].type == .untouchableImage && currentChatArray[indexPath.row].who.info().name == "키렐"{
            let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myUnTouchableImage", for: indexPath) as! myUntouchableImageTableViewCell
            
            cell.imageUpdate(name: currentChatArray[indexPath.row].who.info().name,pfImage: currentChatArray[indexPath.row].who.info().profileImage,mainImage: currentChatArray[indexPath.row].image)
            cellToReturn = cell
        }
        
        
        print(currentChatArray)
        return cellToReturn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainGameTableView.delegate = self
        self.mainGameTableView.dataSource = self
        
        self.mainGameTableView.rowHeight = UITableView.automaticDimension
        self.mainGameTableView.estimatedRowHeight = 200
    }
    override func viewDidAppear(_ animated: Bool) {
        chatUpdate()
    }
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @IBAction func pause(_ sender: Any) {
        pauseBar.isHidden = false
    }
    @IBAction func goHome(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func resume(_ sender: Any) {
        pauseBar.isHidden = true
    }
    var timer:Timer!
    //채팅 자동으로 올라오게 하기
    func chatUpdate()
    {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: {timer in
            if self.indexNumber < currentDay().storyBlocks[player.currentChatId]!.chats.count{
                currentChatArray.append(currentDay().storyBlocks[player.currentChatId]!.chats[self.indexNumber])
                self.mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
                //self.indexNumber += 1
                print("스토리 \(self.indexNumber)/\(currentChatAmount())")
            }
            if self.indexNumber == currentDay().storyBlocks[player.currentChatId]!.chats.count{
                    timer.invalidate()
                currentChatArray.append(currentDay().storyBlocks[player.currentChatId]!.chats[0])
                self.mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
                //self.indexNumber += 1
                    return
                }
            self.indexNumber += 1
        })
    }
    func nextEpisode(){
        
    }
    func nextDay(){
        
    }
}
//선택지 Action 로직
extension mainGameViewController : choiceCellDelegate{
    func firstChoice(){
        player.currentChatId = currentBlockOfDay().choices[0].nextTextId
        currentChatArray.removeLast()
        mainGameTableView.deleteRows(at: [IndexPath(row: currentChatArray.count, section: 0)], with: .none)
        currentChatArray.append(Chat(text: currentBlockOfDay().choices[0].text, image: "", type: .onlyText, who: .kirell, characterFace: true))     //선택지 창이 뜨게 하기 위한 더미 Chat 파일. 직접 보이진 않음.(채우기 용)
        indexNumber = 0     //indexNumber 초기화
        mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
        print("First button tapped")
    }
    func secondChoice() {
        player.currentChatId = currentBlockOfDay().choices[1].nextTextId
        currentChatArray.append(Chat(text: currentBlockOfDay().choices[1].text, image: "", type: .onlyText, who: .kirell, characterFace: true))
        indexNumber = 0
        mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
        print("Second button Tapped")
    }
}

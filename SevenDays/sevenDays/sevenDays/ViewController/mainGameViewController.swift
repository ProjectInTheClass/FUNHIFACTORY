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
        print("현재 인덱스넘버 \(indexPath.row)")
        
        if (currentChatArray[indexPath.row].type == .onlyText||currentChatArray[indexPath.row].type == .textPopup) && currentChatArray[indexPath.row].who.info().name == "키렐"{
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
    func chatUpdate(){
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: {timer in
            currentChatArray.append(currentDay().storyBlocks[player.currentChatId]!.chats[self.indexNumber])
            self.mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .automatic)
            self.indexNumber += 1
            print("스토리 \(self.indexNumber)/\(currentDay().storyBlocks[player.currentChatId]!.chats.count)")
            print("1 더함")
                if self.indexNumber > currentDay().storyBlocks[player.currentChatId]!.chats.count{
                    timer.invalidate()
                    return
                }
        })
 }
}


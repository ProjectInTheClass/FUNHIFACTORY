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
        let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "opOnlyText", for: indexPath) as! opOnlyTextTableViewCell
        let chatText = currentChatArray[indexNumber].text
        cell.opChatUpdate(name: currentChatArray[indexNumber].who.info().name, chat: chatText)
        cell.opProfileUpdate(imageName: currentChatArray[indexNumber].who.info().profileImage)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainGameTableView.delegate = self
        self.mainGameTableView.dataSource = self
        chatUpdate()
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
    
    func chatUpdate(){
        currentChatArray.append(currentDay().storyBlocks[player.currentChatId]!.chats[indexNumber])
        mainGameTableView.reloadData()
    }
}


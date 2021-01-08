//
//  EpisodeHistoryViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/08.
//

import UIKit

class EpisodeHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//------------------------테이블뷰--------------------------------
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let chats = recieved else {
            return 0
        }
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let chats = recieved else {
            return UITableViewCell()
        }
        let chatText = chats[indexPath.row].text
        
        if chats[indexPath.row].type == .onlyText && chats[indexPath.row].who.info().name == "이단희"{
            print("자신 텍스트 출력")
                    let cell = episodeHistoryTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! myTextTableViewCell
            cell.myTextCellUpdate(name: chats[indexPath.row].who.info().name, chat: chatText, profile: chats[indexPath.row].who.info().profileImage)
                    return cell
                }
            //상대가 보냈을 때
                else if chats[indexPath.row].type == .onlyText {
                    print("상대 텍스트 출력")
                    let cell = episodeHistoryTableView.dequeueReusableCell(withIdentifier: "opTextCell", for: indexPath) as! opTextTableViewCell
                    cell.opTextCellUpdate(name: chats[indexPath.row].who.info().name, chat: chatText, profile: chats[indexPath.row].who.info().profileImage)
                    return cell
                }
            //터치할 수 없는 이미지
            else if chats[indexPath.row].type == .untouchableImage {
                print("이미지 출력")
                let cell = episodeHistoryTableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell

                cell.imageUpdate(mainImage: chats[indexPath.row].image)
                return cell
                }
            //행동 표시글 셀
            else if chats[indexPath.row].type == .sectionHeader{
                print("섹션헤더 출력")
                let cell = episodeHistoryTableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! sectionTableViewCell
                cell.sectionUpdate(text:chatText)
                return cell
            } else {
                print("그 외")
                let cell = episodeHistoryTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! myTextTableViewCell
                cell.myTextCellUpdate(name: chats[indexPath.row].who.info().name, chat: chatText, profile: chats[indexPath.row].who.info().profileImage)
                return cell
            }
    }
    
//------------------------기본--------------------------------
    @IBOutlet weak var episodeHistoryTableView: UITableView!
    var recieved: [Chat]?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.episodeHistoryTableView.delegate = self
        self.episodeHistoryTableView.dataSource = self
    }
}

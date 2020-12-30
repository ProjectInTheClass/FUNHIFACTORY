//
//  mainGameViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import UIKit

class mainGameViewController: UIViewController {
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
    }
}

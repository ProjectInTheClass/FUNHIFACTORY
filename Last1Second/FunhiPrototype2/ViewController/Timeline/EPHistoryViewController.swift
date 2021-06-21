//
//  EPHistoryViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/09.
//

import UIKit




class EPHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let currentChat = currentEpisode?.chatHistory else {
            return 0
        }
        return currentChat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentChat = currentEpisode?.chatHistory else {
            return UITableViewCell()
        }
        let target = currentChat[indexPath.row]
        let chatText = currentChat[indexPath.row].text
        //텍스트 채팅이 나올 때
        //자신이 보냈을 때
        if target.type == .onlyText && target.who.info().name == "이단희"{
            print("메인게임 - 자신 텍스트 출력")
            let cell = chatHistoryTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! myTextTableViewCell
            cell.myTextCellUpdate(name: target.who.info().name, chat: chatText, profile: target.characterFace, godchat: target.isGodChat)
            return cell
        }
        //상대가 보냈을 때
        else if target.type == .onlyText {
            print("메인게임 - 상대 텍스트 출력")
            let cell = chatHistoryTableView.dequeueReusableCell(withIdentifier: "opTextCell", for: indexPath) as! opTextTableViewCell
            cell.profileNickname.textColor = .white
            cell.opTextCellUpdate(name: target.who.info().name, chat: chatText,normalProfile: target.who.info().profileImage, mainProfile: target.characterFace, isLocked: target.who.info().isLocked, godchat: target.isGodChat)
            cell.contentView.setNeedsDisplay()
            return cell
        }
        //터치할 수 없는 이미지
        else if target.type == .untouchableImage {
            print("메인게임 - 이미지 출력")
            let cell = chatHistoryTableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell

            cell.imageUpdate(mainImage: target.image, godchat: target.isGodChat)
            return cell
        }
        //행동 표시글 셀
        else if target.type == .sectionHeader{
            print("메인게임 - 섹션헤더 출력")
            let cell = chatHistoryTableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! sectionTableViewCell
            cell.sectionUpdate(text:chatText, godchat: target.isGodChat)
            return cell
        }
        else if target.type == .monologue{
            print("메인게임 - 속마음 채팅 출력")
                    
            let cell = chatHistoryTableView.dequeueReusableCell(withIdentifier: "monologue", for: indexPath) as! monologueTableViewCell
            cell.monologueText.text = chatText
            cell.name.textColor = .white
            cell.chatUpdate(nickname: target.who.info().name, profile: target.characterFace, godchat: target.isGodChat)
            return cell
        }
        else if target.type == .ar{
            let cell = chatHistoryTableView.dequeueReusableCell(withIdentifier: "arTableViewCell", for: indexPath) as! ARTableViewCell
            cell.delegate = self
            return cell
        }
        else if (target.type == .endGodChat || target.type == .startGodChat)
        {
            print("메인게임 - 구분자 채팅 출력")
            let cell = chatHistoryTableView.dequeueReusableCell(withIdentifier: "separatorCell", for: indexPath) as! SeparatorTableViewCell
            cell.separatorUpdate(chatType: target.type)
            return cell
        }
        else {
            print("메인게임 - 오류 발생1")
            return UITableViewCell()
        }
    }
    

    var currentEpisode: Episode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.chatHistoryTableView.delegate = self
        self.chatHistoryTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var chatHistoryTableView: UITableView!
    @IBOutlet var yearLabel: UILabel!
    //------------지도 팝업-------
    
    @IBAction func openMap(_ sender: Any) {
        openMapPopup()
        updateMapImage()
    }
    @IBOutlet var mapPopupView: UIView!
    @IBOutlet var mapPopupBoxView: UIView!
    @IBOutlet var mapImageView: UIImageView!
    @IBAction func mapPopupExitButton(_ sender: Any) {
        mapPopupView.removeFromSuperview()
    }
    
    func openMapPopup() {
        mapPopupView.center = self.view.center
        mapPopupView.bounds = self.view.bounds
        self.view.addSubview(mapPopupView)
        mapPopupBoxView.setBolder(color: .white, width: 4)
        
    }
    func updateMapImage() {
        guard let currentEpisode = currentEpisode else {
            return }
        mapImageView.image = UIImage(named:"\(currentEpisode.episodeID)map")
        if currentEpisode.episodeID == "1623" || currentEpisode.episodeID == "prologue" {
            mapImageView.image = UIImage(named:"2020map")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension EPHistoryViewController : arDelegate {

    
    func goToAR(arid: ARID) {
        print("buttonClicked")
        let dataToSend: ARID
        // dataToSend = 현재 Chat의 ARID
        performSegue(withIdentifier: "goToARView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToARView" {
            let destination = segue.destination as! MaingameARViewController
            if let arContent = sender as? ARID {
                destination.recievedAR = arContent
            }
        }
    }
}

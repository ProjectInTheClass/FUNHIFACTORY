//
//  EPHistoryViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/09.
//

import UIKit


class TLsectionTableViewCell: UITableViewCell {

    @IBOutlet var sectionText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

         // Configure the view for the selected state
    }
    func sectionUpdate(text : String){
        sectionText.text = text
    }
}


class TLopTextTableViewCell: UITableViewCell {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var profileNickname: UILabel!
    @IBOutlet var chatText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func opTextCellUpdate(name:String,chat:String,profile:String){
        profileNickname.text = name
               chatText.text = chat
               profileImage.image = UIImage(named: profile)
    }

}

class TLmyTextTableViewCell: UITableViewCell {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var profileNickname: UILabel!
    @IBOutlet var chatText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func myTextCellUpdate(name:String,chat:String,profile:String){
        profileImage.image = UIImage(named: profile)
        profileNickname.text = name
        chatText.text = chat
    }
}

class TLmonologueTableViewCell: UITableViewCell {
    @IBOutlet var monologueText: UILabel!
    @IBOutlet var monologueCell: UIView!
    @IBOutlet var monologueCircle: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        monologueUI(cell: monologueCell)
        monologueUI(cell: monologueCircle)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

class TLImageTableViewCell: UITableViewCell {

    @IBOutlet var unTouchableImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func imageUpdate(mainImage:String){
        print("<현재 출력될 이미지 : \(mainImage)>")
        guard mainImage != "" else {return}
           unTouchableImage.image = UIImage(named: mainImage)
       }
}


class EPHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let recieved = recieved else {
            return 0
        }
        return recieved.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let recieved = recieved else {
            return UITableViewCell()
        }
        
        let chatText = recieved[indexPath.row].text
        let chatType = recieved[indexPath.row].type
        let chatPerson = recieved[indexPath.row].who.info()
        print("cellForRowAt")
        
        //텍스트 채팅이 나올 때
            //자신이 보냈을 때
        if chatType == .onlyText && recieved[indexPath.row].who.info().name == "이단희"{
            print("자신 텍스트 출력")
            let cell = chatTableView.dequeueReusableCell(withIdentifier: "timelinemyTextCell", for: indexPath) as! TLmyTextTableViewCell
            cell.myTextCellUpdate(name: chatPerson.name, chat: chatText, profile: chatPerson.profileImage)
                    return cell
        }
            //상대가 보냈을 때
        else if chatType == .onlyText {
                print("상대 텍스트 출력")
                let cell = chatTableView.dequeueReusableCell(withIdentifier: "timelineopTextCell", for: indexPath) as! TLopTextTableViewCell
                cell.opTextCellUpdate(name: chatPerson.name, chat: chatText, profile: chatPerson.profileImage)
                return cell
            }
        //터치할 수 없는 이미지
        else if chatType == .untouchableImage {
            print("이미지 출력")
            let cell = chatTableView.dequeueReusableCell(withIdentifier: "timelineimageCell", for: indexPath) as! TLImageTableViewCell

            cell.imageUpdate(mainImage: recieved[indexPath.row].image)
            return cell
        }
        //행동 표시글 셀
        else if chatType == .sectionHeader{
            print("섹션헤더 출력")
            let cell = chatTableView.dequeueReusableCell(withIdentifier: "timelinesectionCell", for: indexPath) as! TLsectionTableViewCell
            cell.sectionUpdate(text:chatText)
            return cell
            
        }
        
        else if chatType == .monologue{
            print("속마음 채팅 출력")
            let cell = chatTableView.dequeueReusableCell(withIdentifier: "timelinemonologue", for: indexPath) as! TLmonologueTableViewCell
            cell.monologueText.text = chatText
            return cell
        }
        
        else {
            print("그 외")
            let cell = chatTableView.dequeueReusableCell(withIdentifier: "timelinemyTextCell", for: indexPath) as! TLmyTextTableViewCell
            cell.myTextCellUpdate(name: chatPerson.name, chat: chatText, profile: chatPerson.profileImage)
            return cell
        }
    }
    

    var recieved: [Chat]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.chatTableView.delegate = self
        self.chatTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var chatTableView: UITableView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

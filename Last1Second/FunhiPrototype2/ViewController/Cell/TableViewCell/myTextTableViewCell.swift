//
//  myTextTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import UIKit

class myTextTableViewCell: UITableViewCell {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var profileNickname: UILabel!
    @IBOutlet var chatText: UILabel!
    @IBOutlet var chatView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
        
        // Initialization code
    }
    func designCell() {
        profileNickname.font = UIFont(name: "NanumSquareEB", size: 18)
        chatText.font = UIFont(name: "NanumSquareB", size: 17)
        chatText.setLineSpacing(lineSpacing: 6)
        chatView.layer.borderWidth = 1.7
        chatView.layer.borderColor = UIColor(red: 0.319, green: 0.457, blue: 0.575, alpha: 1).cgColor
        chatView.layer.cornerRadius = 20
        // 뷰의 세 모서리만 cornerRadus 값 적용되게 하는 코드
        chatView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    func myTextCellUpdate(name:String,chat:String,profile:CharacterFace){
        profileNickname.text = name
        chatText.text = chat
        let face = findFaceImage(nickname: name, profile: profile, normalProfile: "none")
        if face == "none"{
            profileImage.isHidden = true
            profileNickname.isHidden = true
        }
        profileImage.image = UIImage(named: face)
        return
    }
}

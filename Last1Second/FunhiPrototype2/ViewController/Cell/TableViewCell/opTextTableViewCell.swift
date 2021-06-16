//
//  opTextTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import UIKit

class opTextTableViewCell: UITableViewCell {
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
       
      
        chatText.setLineSpacing(lineSpacing: 6)
        profileNickname.font = UIFont(name: "NanumSquareEB", size: 18)
        chatText.font = UIFont(name: "NanumSquareB", size: 17)
        chatView.layer.borderWidth = 1.7
        chatView.layer.borderColor = UIColor(red: 0.707, green: 0.76, blue: 0.804, alpha: 1).cgColor
        chatView.layer.cornerRadius = 20
        chatView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
   
    func opTextCellUpdate(name:String,chat:String, normalProfile:String, mainProfile:CharacterFace, isLocked : Bool){
        profileNickname.text = name
                if isLocked == true{
                    profileNickname.text = "???"
                }
        chatText.text = chat

        switch mainProfile {
        case .none:
            //chatView.removeConstraint(chatView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 64))
            profileImage.isHidden = true
            profileNickname.isHidden = true
        default:
            profileNickname.isHidden = false
            profileImage.isHidden = false
        }
        var face : String = normalProfile
        if name == "휘령"{
                switch mainProfile {
                case .none: face = "none"
                case .angry1: face = "hwiryeong angry 1"
                case .angry2: face = "hwiryeong angry 2"
                case .angry3: face = "hwiryeong angry 3"
                case .angry4: face = "hwiryeong angry 4"
                case .basic:   face = "hwiryeong basic"
                case .basictalk: face = "hwiryeong basic talk"
                case .cry1: face = " hwiryeong cry"
                case .happy1:  face = "hwiryeong happy 1"
                case .happy2:   face = "hwiryeong happy 2"
                case .sad1:  face = "hwiryeong sad"
                case .straight: face = "hwiryeong straight"
                case .surprise1:   face = "hwiryeong surprise 1"
                case .surprise2:   face = "hwiryeong surprise 2"
                default : face = "none"
                }
        }
        else if name == "투어 가이드"{
                switch mainProfile {
                case .none: face = "none"
                case .basictalk: face = "guide basic talk"
                case .basic: face = "guide basic"
                case .happytalk: face = "guide happy talk"
                case .happy1: face = "guide happy"
                default : face = "none"
            }
        }
        profileImage.image = UIImage(named: face)
    }

}

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
        chatText.setLineSpacing(lineSpacing: 6)
        // Initialization code
    }
    func opTextCellUpdate(name:String,chat:String, normalProfile:String, mainProfile:CharacterFace, isLocked : Bool){
        profileNickname.text = name
                if isLocked == true{
                    profileNickname.text = "???"
                }
               chatText.text = chat
            if mainProfile == .none{
                noProfileUIUpdate()
            }else{
                chatView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 64).isActive = true
                contentView.layoutIfNeeded()
            }
        if name == "휘령"{
            var face : String {
                switch mainProfile {
                case .none: return "none"
                case .angry1: return "hwiryeong angry face 1"
                case .angry2: return "hwiryeong angry face 2"
                case .basic:   return "hwiryeong basic face"
                case .cry1: return " hwiryeong cry face"
                case .happy1:  return "hwiryeong happy face 1"
                case .happy2:   return "hwiryeong happy face 2"
                case .sad:  return "hwiryeong sad face"
                case .scared:   return "hwiryeong scared face"
                case .straight: return "hwiryeong straight face"
                case .surprise1:   return "hwiryeong surprised face"
                default : return "none"
                }
            }
            profileImage.image = UIImage(named: face)
            return
        } else {
            profileImage.image = UIImage(named: normalProfile)
        }
    }
    
    func noProfileUIUpdate(){
        //chatView.removeConstraint(chatView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 64))
        profileImage.isHidden = true
        profileNickname.isHidden = true
        chatView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7).isActive = true
        contentView.layoutIfNeeded()
    }

}

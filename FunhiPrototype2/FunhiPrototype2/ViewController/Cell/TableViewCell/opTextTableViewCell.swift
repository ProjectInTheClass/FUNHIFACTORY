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
    @IBOutlet var chatText: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func opTextCellUpdate(name:String,chat:String, normalProfile:String, mainProfile:CharacterFace){
        profileNickname.text = name
               chatText.text = chat
            if mainProfile == .none{
                noProfileUIUpdate()
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
        profileImage.isHidden = true
        profileNickname.isHidden = true
        chatText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7).isActive = true
        contentView.layoutIfNeeded()
    }

}

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
    func opTextCellUpdate(name:String,chat:String, normalProfile:String, mainProfile:characterFace){
        profileNickname.text = name
               chatText.text = chat
        if name == "휘령"{
            var face : String {
                switch mainProfile {
                case .none: return "none"
                case .angry1: return "hwiryeong angry face1"
                case .angry2: return "hwiryeong angryface2"
                case .basic:   return "hwiryeong basic face"
                case .cry1: return " hwiryeong cry face1"
                case .happy1:  return "hwiryeong happy face1"
                case .happy2:   return "hwiryeong happy face2"
                case .sad:  return "hwiryeong sad face"
                case .scared:   return "hwiryeong scared face"
                case .straight: return "hwiryeong straight face"
                case .surprise1:   return "hwiryeong surprised face1"
                default : return "none"
            }
        }
            guard face != "none" else {return}
            profileImage.image = UIImage(named: face)
        } else {
            profileImage.image = UIImage(named: normalProfile)
        }
    }

}

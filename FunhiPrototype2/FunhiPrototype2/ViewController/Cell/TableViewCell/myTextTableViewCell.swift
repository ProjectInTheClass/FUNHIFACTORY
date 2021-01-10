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
    @IBOutlet var chatText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func myTextCellUpdate(name:String,chat:String,profile:characterFace){
        profileNickname.text = name
        chatText.text = chat
        var face : String {
            switch profile {
            case .none: return "none"
            case .angry1: return "danhee angry face1"
            case .angry2: return "danhee angryface2"
            case .basic:   return "danhee basic face"
            case .cry1: return " danhee cry face1"
            case .cry2: return " danhee cry face2"
            case .happy1:  return "danhee happy face1"
            case .happy2:   return "danhee happy face2"
            case .happy3:   return "danhee happy face3"
            case .sad:  return "danhee sad face"
            case .scared:   return "danhee scared face"
            case .straight: return "danhee straight face"
            case .surprise1:   return "danhee surprised face1"
            case .surprise2:    return "danhee surprised face2"
            case .surprise3:    return "danhee surprised face3"
            }
        }
        guard face != "none" else {return}
        profileImage.image = UIImage(named: face)
    }
}

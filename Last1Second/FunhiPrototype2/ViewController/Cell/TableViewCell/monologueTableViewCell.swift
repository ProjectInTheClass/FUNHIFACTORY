//
//  monologueTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/08.
//

import UIKit

class monologueTableViewCell: UITableViewCell {
    @IBOutlet var monologueText: UILabel!
    @IBOutlet var monologueCell: UIView!
    @IBOutlet var monologueView: UIView!
    @IBOutlet var monologueCircle: UIView!
    @IBOutlet var name: UILabel!
    @IBOutlet var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        name.font = UIFont(name: "NanumSquareEB", size: 18)
        monologueText.font = UIFont(name: "NanumSquareB", size: 17)
        monologueUI(cell: monologueCell)
        monologueUI(cell: monologueCircle)
    }
    func chatUpdate(nickname:GameCharacterID, profile:CharacterFace, godchat : Bool){
        switch godchat {
        case true:
            name.textColor = .black
            backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1)
        case false:
            name.textColor = .white
            backgroundColor =  UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
        }
        name.text = nickname.info().name
        let face = findFaceImage(nickname: nickname, profile: profile, normalProfile: "none")
        switch profile {
        case .none:
            profileImage.isHidden = true
            name.isHidden = true
        default:
            profileImage.isHidden = false
            name.isHidden = false
        }
        profileImage.image = UIImage(named: face)
        return
    }
}

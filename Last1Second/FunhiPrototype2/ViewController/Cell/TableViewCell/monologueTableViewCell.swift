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
    func chatUpdate(nickname:String, profile:CharacterFace){
        name.text = nickname
        let face = findFaceImage(nickname: nickname, profile: profile, normalProfile: "none")
        if face == "none"{
            profileImage.isHidden = true
            name.isHidden = true
        }
        profileImage.image = UIImage(named: face)
        return
    }
}

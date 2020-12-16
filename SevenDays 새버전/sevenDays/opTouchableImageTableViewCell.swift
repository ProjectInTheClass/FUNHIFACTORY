//
//  opTouchableImageTableViewCell.swift
//  sevenDays
//
//  Created by 손영웅 on 2020/12/12.
//

import UIKit

class opTouchableImageTableViewCell: UITableViewCell {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var mainImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainImage.isUserInteractionEnabled = true
    }
    func update(profile:String, name:String, main:String){
        profileImage.image = UIImage(named: profile)
        nameLabel.text = name
        mainImage.image = UIImage(named: main)
    }
}

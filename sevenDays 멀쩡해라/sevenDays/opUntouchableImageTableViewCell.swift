//
//  opUntouchableImageTableViewCell.swift
//  sevenDays
//
//  Created by 손영웅 on 2020/12/11.
//

import UIKit

class opUntouchableImageTableViewCell: UITableViewCell {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var mainImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func update(name:String, profile:String, main:String){
        profileImage.image = UIImage(named: profile)
        nameLabel.text = name
        mainImage.image = UIImage(named: main)
    }
}

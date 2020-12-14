//
//  myUntouchableImageTableViewCell.swift
//  sevenDays
//
//  Created by 손영웅 on 2020/12/06.
//

import UIKit


class myUntouchableImageTableViewCell: UITableViewCell {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameText: UILabel!
    @IBOutlet var untouchImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    func imageUpdate(name:String,pfImage:String,mainImage:String){
        nameText.text = name
        untouchImage.image = UIImage(named: mainImage)
        profileImage.image = UIImage(named: pfImage)
    }
}

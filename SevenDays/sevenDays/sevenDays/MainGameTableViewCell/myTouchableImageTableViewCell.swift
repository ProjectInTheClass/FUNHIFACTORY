//
//  myTouchableImageTableViewCell.swift
//  sevenDays
//
//  Created by 손영웅 on 2020/12/11.
//

import UIKit

class myTouchableImageTableViewCell: UITableViewCell {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var mainImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageScaleUp))
        mainImage.addGestureRecognizer(tapGesture)
        mainImage.isUserInteractionEnabled = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @objc func imageScaleUp(){
        
    }
    func update(profile:String, name:String, main:String){
        profileImage.image = UIImage(named: profile)
        nameLabel.text = name
        mainImage.image = UIImage(named: main)
    }
}

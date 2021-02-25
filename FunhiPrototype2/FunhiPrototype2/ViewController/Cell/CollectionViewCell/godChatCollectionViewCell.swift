//
//  godChatCollectionViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/02/04.
//

import UIKit

class godChatCollectionViewCell: UICollectionViewCell {
    @IBOutlet var choiceInCell: UIView!
    @IBOutlet var choiceLabel: UILabel!
    override func awakeFromNib() {
        //choiceCellUIUpdate(target: choiceInCell)
        contentView.bringSubviewToFront(choiceLabel)
       
        choiceInCell.layer.shadowColor = UIColor(red: 0.173, green: 0.227, blue: 0.278, alpha: 1).cgColor
        choiceInCell.layer.shadowOpacity = 1
        choiceInCell.layer.shadowRadius = 0
        choiceInCell.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    func choiceUpdate(choiceText : String){
        choiceLabel.text = choiceText
    }
}

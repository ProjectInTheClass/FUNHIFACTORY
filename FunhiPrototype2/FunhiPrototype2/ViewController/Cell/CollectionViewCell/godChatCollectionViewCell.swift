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
        choiceInCell.layer.borderWidth = 2
    }
    
    func choiceUpdate(choiceText : String){
        choiceLabel.text = choiceText
    }
}

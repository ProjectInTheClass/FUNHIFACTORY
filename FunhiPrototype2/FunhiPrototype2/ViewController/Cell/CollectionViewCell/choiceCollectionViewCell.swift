//
//  choiceCollectionViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/10.
//

import UIKit

class choiceCollectionViewCell: UICollectionViewCell {
    @IBOutlet var choiceLabel: UILabel!
    
    @IBOutlet var choiceInCell: UIView!
    override func awakeFromNib() {
        choiceCellUIUpdate(target: choiceInCell)
        choiceInCell.bringSubviewToFront(choiceLabel)
    }
    
    func choiceUpdate(choiceText : String){
        choiceLabel.text = choiceText
    }
}

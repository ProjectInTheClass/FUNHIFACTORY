//
//  choiceCollectionViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/10.
//

import UIKit

class choiceCollectionViewCell: UICollectionViewCell {
    @IBOutlet var choiceLabel: UILabel!
    
    func choiceUpdate(choiceText : String){
        choiceLabel.text = choiceText
    }
}

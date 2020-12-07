//
//  choiceTableViewCell.swift
//  sevenDays
//
//  Created by 손영웅 on 2020/12/06.
//

import UIKit

class choiceTableViewCell: UITableViewCell {
    @IBOutlet var firstChoiceButton: UIButton!
    @IBOutlet var secondChoiceButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func choiceUpdate(first:Choice, second:Choice){
        firstChoiceButton.setTitle(first.text, for: .normal)
        secondChoiceButton.setTitle(second.text, for: .normal)
    }
}

//
//  choiceTableViewCell.swift
//  sevenDays
//
//  Created by 손영웅 on 2020/12/06.
//

import UIKit

protocol choiceCellDelegate:AnyObject{
    func firstChoice()
    func secondChoice()
}
class choiceTableViewCell: UITableViewCell {
    @IBOutlet var firstChoiceButton: UIButton!
    @IBOutlet var secondChoiceButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var cellDelegate:choiceCellDelegate?
    
    @IBAction func firstButtonTapped(_ sender: Any) {
        cellDelegate?.firstChoice()
    }
    @IBAction func secondButtonTapped(_ sender: Any) {
        cellDelegate?.secondChoice()
    }
}

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
    
    var cellDelegate:choiceCellDelegate?
    
    @IBAction func firstButtonTapped(_ sender: Any) {
        cellDelegate?.firstChoice()
    }
    @IBAction func secondButtonTapped(_ sender: Any) {
        cellDelegate?.secondChoice()
    }
    func update(){
        print("선택지창 on")
        firstChoiceButton.setTitle(currentBlockOfDay().choices[0].text, for: .normal)
        secondChoiceButton.setTitle(currentBlockOfDay().choices[1].text, for: .normal)
    }
    
}

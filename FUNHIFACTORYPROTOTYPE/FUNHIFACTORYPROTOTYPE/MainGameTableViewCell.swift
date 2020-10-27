//
//  MainGameTableViewCell.swift
//  FUNHIPROTOTYPE
//
//  Created by 최서연 on 2020/10/13.
//

import UIKit

class MainGameTableViewCell: UITableViewCell {

    @IBOutlet weak var StoryTableViewCellLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        fontSizeUpdate()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func storyLableUpdate(text: String) {
        
        let attrString = NSMutableAttributedString(string: StoryTableViewCellLable.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = CGFloat(Double(santa.setting.rowSpacing)-Double(santa.setting.fontSize)*1.4)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        StoryTableViewCellLable.attributedText = attrString
        
        StoryTableViewCellLable.text = "\(text) "
    }
    
    func storyLabelSizeUpdate(){
        StoryTableViewCellLable.font = UIFont(name: StoryTableViewCellLable.font.fontName, size: CGFloat(santa.setting.fontSize))
        StoryTableViewCellLable.setLineSpacing(lineSpacing: CGFloat(santa.setting.rowSpacing))
    }
    
    func fontSizeUpdate(){
        StoryTableViewCellLable.font.withSize(CGFloat(santa.setting.fontSize))
        StoryTableViewCellLable.setLineSpacing(lineSpacing: CGFloat(santa.setting.rowSpacing))
    }

}

class ChoiceTableViewCell: UITableViewCell {

    @IBOutlet weak var choiceTableViewCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fontRowUpdate()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func fontRowUpdate(){
        choiceTableViewCellLabel.font.withSize(CGFloat(santa.setting.fontSize))
    }
}

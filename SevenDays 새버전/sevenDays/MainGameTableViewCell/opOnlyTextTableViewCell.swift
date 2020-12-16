//
//  onlyTextTableViewCell.swift
//  sevenDays
//
//  Created by 손영웅 on 2020/12/03.
//

import UIKit

class opOnlyTextTableViewCell: UITableViewCell {

    @IBOutlet var opponentName: UILabel!
    @IBOutlet var opponentImage: UIImageView!
    @IBOutlet var opponentChat: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func opTextCellUpdate(name:String, chat:String, imageName:String, characterFace : Bool){
        guard imageName != "" else {return}
        opponentImage.image = UIImage(named: imageName)
        
        if characterFace == false{
            opponentImage.isHidden = true
            opponentName.text = ""
        } else{
            opponentImage.isHidden = false
            opponentName.text = name
        }
        opponentChat.text = chat
    }
}

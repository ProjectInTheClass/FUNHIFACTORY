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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func opProfileUpdate(imageName:String){
        opponentImage.image = UIImage(named: imageName)
    }
    func opChatUpdate(name:String,chat:String){
        opponentName.text = name
        opponentChat.text = chat
    }
}

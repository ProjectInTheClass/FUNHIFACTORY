//
//  myTextTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import UIKit

class myTextTableViewCell: UITableViewCell {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var profileNickname: UILabel!
    @IBOutlet var chatText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func myTextCellUpdate(name:String,chat:String,profile:String){
        profileImage.image = UIImage(named: profile)
        profileNickname.text = name
        chatText.text = chat
    }
}

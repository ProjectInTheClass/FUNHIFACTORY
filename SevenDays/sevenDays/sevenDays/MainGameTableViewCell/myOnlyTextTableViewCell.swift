//
//  myOnlyTextTableViewCell.swift
//  sevenDays
//
//  Created by 손영웅 on 2020/12/03.
//

import UIKit

class myOnlyTextTableViewCell: UITableViewCell {

    @IBOutlet var myName: UILabel!
    @IBOutlet var myProfile: UIImageView!
    @IBOutlet var myChatTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func myProfileUpdate(imageName:String){
        myProfile.image=UIImage(named: imageName)
    }
    func myChatUpdate(name:String,chat:String){
        myName.text = name
        myChatTextView.text = chat
    }
}

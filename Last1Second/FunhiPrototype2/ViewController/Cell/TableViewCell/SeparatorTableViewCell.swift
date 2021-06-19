//
//  SeparatorTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/06/19.
//

import UIKit

class SeparatorTableViewCell: UITableViewCell {

    @IBOutlet var separatorImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func separatorUpdate(chatType : ChatType)
    {
        switch chatType
        {
            case .startGodChat:
                separatorImage.image = UIImage(named: "startGodChat")
            case .endGodChat:
                separatorImage.image = UIImage(named: "endGodChat")
            default :
                separatorImage.isHidden = true
        }
    }
}

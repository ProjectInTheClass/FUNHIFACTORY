//
//  sectionTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import UIKit

class sectionTableViewCell: UITableViewCell {

    @IBOutlet var sectionText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        sectionText.font = UIFont(name: "NanumSquareEB", size: 15.5)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func sectionUpdate(text : String){
        sectionText.text = text
    }
}

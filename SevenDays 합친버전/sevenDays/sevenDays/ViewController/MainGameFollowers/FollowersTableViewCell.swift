//
//  FollowersTableViewCell.swift
//  sevenDays
//
//  Created by 최서연 on 2020/12/10.
//

import UIKit

class FollowersTableViewCell: UITableViewCell {

    @IBOutlet weak var followerImage: UIImageView!
    @IBOutlet weak var followerName: UILabel!
    @IBOutlet weak var likabilityGrayBox: UIView!
    @IBOutlet weak var likabilityConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var likabilityRedBox: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

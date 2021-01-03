//
//  NoteHistoryTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/02.
//

import UIKit

class NoteHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var caseNameLabel: UILabel!
    @IBOutlet weak var caseDescriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

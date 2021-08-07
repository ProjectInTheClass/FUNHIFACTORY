//
//  CheckPointCell.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/07.
//

import UIKit

class CheckPointTableViewCell: UITableViewCell {
    
  @IBOutlet weak var view: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet var lockedView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    designCell()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
      
  }
  func designCell() {
    titleLabel.font = UIFont(name: "NanumSquareEB", size: 14)
  }
}

class ClockTimelineTableViewCell: UITableViewCell {
    
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}

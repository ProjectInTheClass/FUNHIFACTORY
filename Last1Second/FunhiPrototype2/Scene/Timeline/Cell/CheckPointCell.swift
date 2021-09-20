//
//  CheckPointswift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/07.
//

import UIKit

class CheckPointTableViewCell: UITableViewCell {
    
  @IBOutlet weak var view: UIView!
  @IBOutlet weak var shadow: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet var lockedShadow: UIView!
  @IBOutlet var lockedview: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupStyle()
  }
 
  private func setupStyle() {
    titleLabel.font = UIFont(name: "NanumSquareEB", size: 14)
  }
  
  func configureCell(point: CheckPoint, section: Int) {
    titleLabel.text = point.name
    point.isLocked ? (lockedShadow.isHidden = false) : (lockedShadow.isHidden = true)
    
    if point.isLocked {
      switch section {
      case 0:
        lockedview.backgroundColor = .way0LockedBackground
        lockedShadow.backgroundColor = .way0LockedShadow
      case 1:
        lockedview.backgroundColor = .way1LockedBackground
        lockedShadow.backgroundColor = .way1LockedShadow
      case 2:
        lockedview.backgroundColor = .way2LockedBackground
        lockedShadow.backgroundColor = .way2LockedShadow
      default:
        view.backgroundColor = .black
        shadow.backgroundColor = .black
      }
    } else {
      switch section {
      case 0:
        view.backgroundColor = .checkWay0Background
        shadow.backgroundColor = .checkWay0Shadow
      case 1:
        view.backgroundColor = .checkWay1Background
        shadow.backgroundColor = .checkWay1Shadow
      case 2:
        view.backgroundColor = .checkWay2Background
        shadow.backgroundColor = .checkWay2Shadow
      default:
        view.backgroundColor = .black
        shadow.backgroundColor = .black
      }
    }
  }
}

class ClockCell: UITableViewCell {
    
  override func awakeFromNib() {
    super.awakeFromNib()
    setupStyle()
  }
  
  private func setupStyle() {
    selectionStyle = .none
  }
}

//
//  NoteInfoCell.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/19.
//

import UIKit

class GameCharacterSingleinfomationCell: UITableViewCell {
  
  @IBOutlet weak var smallCircle: UIView!
  @IBOutlet weak var informationLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    designCell()
  }

  func designCell() {
    informationLabel.setLineSpacing(lineSpacing: 7.0)
    informationLabel.font = UIFont(name: "NanumSquareR", size: 15)
    smallCircle.setBolder(color: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), width: 1.2)
    smallCircle.backgroundColor = UIColor(red: 0.588, green: 0.698, blue: 0.796, alpha: 1)
    smallCircle.layer.cornerRadius = smallCircle.frame.width/2
  }
}


class GameCharacterFirstinfomationCell: UITableViewCell {
  @IBOutlet weak var smallCircle: UIView!
  @IBOutlet weak var informationLabel: UILabel!
  @IBOutlet var line: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    designCell()
  }

  func designCell() {
    informationLabel.setLineSpacing(lineSpacing: 7.0)
    informationLabel.font = UIFont(name: "NanumSquareR", size: 15)
    smallCircle.setBolder(color: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), width: 1.2)
    smallCircle.backgroundColor = UIColor(red: 0.588, green: 0.698, blue: 0.796, alpha: 1)
    smallCircle.layer.cornerRadius = smallCircle.frame.width/2
    line.backgroundColor = UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1)
  }
}


class GameCharacterMiddleinfomationCell: UITableViewCell {
  
  @IBOutlet weak var smallCircle: UIView!
  @IBOutlet weak var informationLabel: UILabel!
  @IBOutlet var line: UIView!

  override func awakeFromNib() {
    super.awakeFromNib()
    designCell()
  }

  func designCell() {
    informationLabel.setLineSpacing(lineSpacing: 7.0)
    informationLabel.font = UIFont(name: "NanumSquareR", size: 15)
    smallCircle.setBolder(color: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), width: 1.2)
    smallCircle.backgroundColor = UIColor(red: 0.588, green: 0.698, blue: 0.796, alpha: 1)
    smallCircle.layer.cornerRadius = smallCircle.frame.width/2
    line.backgroundColor = UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1)
  }
}


class GameCharacterLastinfomationCell: UITableViewCell {
  
  @IBOutlet weak var smallCircle: UIView!
  @IBOutlet weak var informationLabel: UILabel!
  @IBOutlet var line: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    designCell()
  }

  func designCell() {
    informationLabel.setLineSpacing(lineSpacing: 7.0)
    informationLabel.font = UIFont(name: "NanumSquareR", size: 15)
    smallCircle.setBolder(color: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), width: 1.2)
    smallCircle.backgroundColor = UIColor(red: 0.588, green: 0.698, blue: 0.796, alpha: 1)
    smallCircle.layer.cornerRadius = smallCircle.frame.width/2
    line.backgroundColor = UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1)
  }
}

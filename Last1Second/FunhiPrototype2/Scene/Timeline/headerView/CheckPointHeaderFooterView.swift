//
//  SavepointHeaderFooterView.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/03/18.
//

import UIKit

class CheckPointHeaderFooterView: UITableViewHeaderFooterView {
  
  @IBOutlet var sectionImageView: UIImageView!
  @IBOutlet var sectionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupStyle()
  }
  
  private func setupStyle() {
    sectionLabel.text = "여기서부터 다시 시작"
  }
}

class CheckPointHeaderFooterView2: UITableViewHeaderFooterView {

  @IBOutlet var sectionIconView: UIView!
  @IBOutlet var sectionLabel: UILabel!
  @IBOutlet var sectionView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    sectionView.layer.borderWidth = 1
    sectionView.layer.borderColor = UIColor.white.cgColor
  }
  
  func configureHeader(section: Int) {
    sectionLabel.text = "\(section)번째 길"
    switch section {
    case 1:
      sectionIconView.backgroundColor = .checkWay1Section
      sectionLabel.textColor = .checkWay1Section
    case 2:
      sectionIconView.backgroundColor = .checkWay2Section
      sectionLabel.textColor = .checkWay2Section
    default:
      sectionIconView.backgroundColor = .way0TrackColor
      sectionLabel.textColor = .way0TrackColor
    }
  }
}

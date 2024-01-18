//
//  SectionTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
  @IBOutlet var sectionText: UILabel!

  func updateStyle(text: String, isGod: Bool) {
    sectionText.text = text
    switch isGod {
    case true:
      backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1)
    case false:
      backgroundColor = UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
    }
  }
}

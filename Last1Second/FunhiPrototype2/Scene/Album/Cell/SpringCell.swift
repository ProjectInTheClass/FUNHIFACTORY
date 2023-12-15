//
//  SpringCell.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2023/12/15.
//

import UIKit

class SpringCell: UITableViewCell {
  
  @IBOutlet weak var springImage: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupStyle()
  }
  
  private func setupStyle() {
    selectionStyle = .none
    springImage.image = UIImage(named: "note ring image")
  }
}

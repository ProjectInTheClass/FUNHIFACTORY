//
//  ARTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/13.
//

import UIKit

protocol ArDelegate: AnyObject {
  func goToAR(arid: ArId)
}

class ARTableViewCell: UITableViewCell {
  var currentAR: ArId?
  var delegate: ArDelegate?
  
  @IBOutlet weak var box: UIView!
  @IBOutlet weak var title: UILabel!
  
  override func awakeFromNib() {
    setupStyle()
  }
  
  private func setupStyle() {
    title.text = "AR로 이동하기"
    box.layer.cornerRadius = 10
    box.layer.borderWidth = 3
    box.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
  }

  @IBAction func goToARView(_ sender: Any) {
    if let currentAR = currentAR {
      delegate?.goToAR(arid: currentAR)
    } else {
      print("AR 셀 내부에 저장된 콘텐츠 없음")
    }
  }
}

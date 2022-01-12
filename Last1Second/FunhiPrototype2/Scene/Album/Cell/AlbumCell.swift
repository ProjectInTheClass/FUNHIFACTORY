//
//  AlbumCell.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/08.
//
import Foundation
import UIKit


class AlbumCell: UITableViewCell {
    
  @IBOutlet var albumImageViewBorderView: UIView!
  @IBOutlet weak var albumImageView: UIImageView!
  @IBOutlet weak var albumImageNameLabel: UILabel!
  @IBOutlet weak var lockedView: UIView!
  @IBOutlet weak var alarmIcon: UIImageView!
  
  enum State {
    case locked
    case normal
    case highlighted
  }
  
  var state: State = .normal {
    didSet {
      updateCell()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupStyle()
  }
  
  private func setupStyle() {
    albumImageNameLabel.font = UIFont(name: "NanumSquareEB", size: 15)
    albumImageView.layer.cornerRadius = 7
    lockedView.layer.cornerRadius = 7
  }
  
  func configureCell(data: AlbumImage) {
    albumImageNameLabel.text = data.title
    albumImageView.image = UIImage(named: data.image)
    if data.isLocked {
      state = .locked
    }
    if !data.isLocked && !data.isChecked {
      state = .highlighted
    }
    if !data.isLocked && data.isChecked {
      state = .normal
    }
  }
  
  private func updateCell() {
    switch state {
    case .locked:
      albumImageNameLabel.text = "???"
      lockedView.isHidden = false
      alarmIcon.isHidden = true
      albumImageViewBorderView.setShadow(color: UIColor(red: 0.196, green: 0.4, blue: 0.576, alpha: 1), x: 0, y: 0, opacity: 1, radius: 5)
      albumImageViewBorderView.setBolder(color: UIColor(red: 0.416, green: 0.569, blue: 0.698, alpha: 1), width: 4)
      
    case .normal:
      lockedView.isHidden = true
      alarmIcon.isHidden = true
      let shadowColor = UIColor(red: 0.882, green: 0.933, blue: 0.984, alpha: 1)
      let bolderColor = UIColor(red: 0.749, green: 0.824, blue: 0.894, alpha: 1)
      albumImageViewBorderView.setShadow(color: shadowColor, x: 0, y: 0, opacity: 1, radius: 5)
      albumImageViewBorderView.setBolder(color: bolderColor, width: 4)
      
    case .highlighted:
      lockedView.isHidden = true
      alarmIcon.isHidden = false
      albumImageViewBorderView.setShadow(color: .white, x: 0, y: 0, opacity: 1, radius: 5)
      albumImageViewBorderView.setBolder(color: .white, width: 4)
      
    }
  }
  
}

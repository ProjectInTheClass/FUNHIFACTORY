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
  
  var state: State = .locked {
    didSet {
      setState(state: state)
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    albumImageNameLabel.font = UIFont(name: "NanumSquareEB", size: 15)
    albumImageView.layer.cornerRadius = 7
    lockedView.layer.cornerRadius = 7
    setState(state: state)
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
     
  }
  
  func configureCell(data: AlbumImage) {
    data.isLocked ? (state = .locked) : (state = .unlocked)
    switch state {
    case .locked:
      albumImageNameLabel.text = "???"
    case .unlocked:
      albumImageNameLabel.text = data.title
    }
    albumImageView.image = UIImage(named: data.image)
  }
  
  enum State {
    case locked, unlocked
  }
  
  func setState(state: State) {
    switch state {
    case .locked:
      albumImageViewBorderView.setShadow(color: UIColor(red: 0.196, green: 0.4, blue: 0.576, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 5)
      albumImageViewBorderView.setBolder(color: UIColor(red: 0.416, green: 0.569, blue: 0.698, alpha: 1), width: 4)
      lockedView.isHidden = false
    case .unlocked:
      albumImageViewBorderView.setShadow(color: .white, offsetX: 0, offsetY: 0, opacity: 1, radius: 5)
      albumImageViewBorderView.setBolder(color: .white, width: 4)
      lockedView.isHidden = true
    }
  }
  
}

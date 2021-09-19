//
//  NoteHistoryCell.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/19.
//

import UIKit

class NoteHistoryCell: UITableViewCell {

  @IBOutlet weak var caseNameLabel: UILabel!
  @IBOutlet weak var noticeIcon: UIImageView!
  @IBOutlet weak var cellBackgroundView: UIView!
  @IBOutlet weak var lockedView: UIView!
  
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
    lockedView.layer.cornerRadius = 20
    cellBackgroundView.layer.cornerRadius = 20
    cellBackgroundView.layer.borderWidth = 4
    selectionStyle = .none
  }
  
  private func updateCell() {
    switch state {
    case .locked:
      lockedView.isHidden = false
      noticeIcon.isHidden = true
      changeShadowAndBorder(view: cellBackgroundView, shadowColor: UIColor(red: 0.314, green: 0.471, blue: 0.6, alpha: 1), borderColor: UIColor(red: 0.416, green: 0.569, blue: 0.698, alpha: 1))
      
    case .normal:
      lockedView.isHidden = true
      noticeIcon.isHidden = true
      cellBackgroundView.backgroundColor = UIColor(red: 0.725, green: 0.808, blue: 0.878, alpha: 1)
      changeShadowAndBorder(view: cellBackgroundView, shadowColor: UIColor(red: 0.749, green: 0.824, blue: 0.894, alpha: 1), borderColor: UIColor(red: 0.749, green: 0.824, blue: 0.894, alpha: 1))
    
    case .highlighted:
      lockedView.isHidden = true
      noticeIcon.isHidden = false
      cellBackgroundView.backgroundColor = UIColor(red: 0.831, green: 0.886, blue: 0.933, alpha: 1)
      changeShadowAndBorder(view: cellBackgroundView, shadowColor: UIColor.white, borderColor: UIColor.white)
    }
  }
  
  func changeShadowAndBorder(view: UIView, shadowColor: UIColor, borderColor: UIColor) {
    view.setShadow(color: shadowColor, offsetX: 0, offsetY: 0, opacity: 1, radius: 5)
    view.setBolder(color: borderColor, width: 4)
  }
  
  func configureCell(history: NoteCase) {
    caseNameLabel.text = history.title
    if history.isLocked {
      state = .locked
    }
    if !history.isLocked && !history.isChecked {
      state = .highlighted
    }
    if !history.isLocked && history.isChecked {
      state = .normal
    }
  }
}


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

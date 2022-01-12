//
//  NoteMainCharacterCell.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/19.
//

import UIKit

class NoteMainCharacterCell: UITableViewCell {

  @IBOutlet weak var cellBackgroundView: UIView!
  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var noticeIcon: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var lockedView: UIView!
  @IBOutlet var cellBorderAndShadowView: UIView!
  
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
    lockedView.layer.cornerRadius = 40
    cellBackgroundView.layer.cornerRadius = 40
    profileImage.layer.cornerRadius = profileImage.frame.width/2
    cellBorderAndShadowView.layer.cornerRadius = 40
    selectionStyle = .none
  }
  
  func changeShadowAndBorder(view: UIView, shadowColor: UIColor, borderColor: UIColor) {
    view.setShadow(color: shadowColor, x: 0, y: 0, opacity: 1, radius: 5)
    view.setBolder(color: borderColor, width: 4)
  }
  
  private func updateCell() {
    switch state {
    case .locked:
      lockedView.isHidden = false
      noticeIcon.isHidden = true
      changeShadowAndBorder(view: cellBorderAndShadowView, shadowColor: UIColor(red: 0.314, green: 0.471, blue: 0.6, alpha: 1), borderColor: UIColor(red: 0.416, green: 0.569, blue: 0.698, alpha: 1))
      
    case .normal:
      lockedView.isHidden = true
      noticeIcon.isHidden = true
      changeShadowAndBorder(view: cellBorderAndShadowView, shadowColor: UIColor(red: 0.749, green: 0.824, blue: 0.894, alpha: 1), borderColor: UIColor(red: 0.749, green: 0.824, blue: 0.894, alpha: 1))
      cellBorderAndShadowView.backgroundColor = UIColor(red: 0.725, green: 0.808, blue: 0.878, alpha: 1)
      
    case .highlighted:
      lockedView.isHidden = true
      noticeIcon.isHidden = false
      changeShadowAndBorder(view: cellBorderAndShadowView, shadowColor: UIColor.white, borderColor: UIColor.white)
      cellBorderAndShadowView.backgroundColor = UIColor(red: 0.831, green: 0.886, blue: 0.933, alpha: 1)
      
    }
  }
  
  func configureCell(character: GameCharacter) {
    nameLabel.text = character.name
    profileImage.image = UIImage(named: "\(character.profileImage)_noteLarge")
    if character.isLocked {
      state = .locked
    }
    if !character.isLocked && !character.isChecked {
      state = .highlighted
    }
    if !character.isLocked && character.isChecked {
      state = .normal
    }
  }
}

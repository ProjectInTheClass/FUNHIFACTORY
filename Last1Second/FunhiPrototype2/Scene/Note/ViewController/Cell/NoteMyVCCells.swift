//
//  NoteOthersVCCells.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/19.
//

import UIKit

class NoteCollectionViewReusableCell: UICollectionViewCell {
  
  @IBOutlet weak var gameCharacteBackgroundImageView: UIImageView!
  @IBOutlet weak var gameCharacterProfileImageView: UIImageView!
  @IBOutlet weak var gameCharacterDescriptionLabel: UILabel!
  @IBOutlet weak var achievementLabel: UILabel!
  @IBOutlet weak var achievementNumberLabel: UILabel!
 
  override func awakeFromNib() {
    super.awakeFromNib()
    setupStyle()
  }
 
  private func setupStyle() {
    gameCharacterDescriptionLabel.setLineSpacing(10)
    gameCharacterProfileImageView.layer.cornerRadius = gameCharacterProfileImageView.frame.width/2
  }
  
  func configureCell(character: GameCharacter) {
    gameCharacteBackgroundImageView.image = UIImage(named: character.backGroundImage)
    gameCharacterProfileImageView.image = UIImage(named: "\(character.profileImage)_noteLarge")
    gameCharacterDescriptionLabel.text = character.description
    achievementNumberLabel.text = "\(player.clearedAchievementCount)/\(player.currentAchievementInfo.count)"
    gameCharacterDescriptionLabel.font = UIFont(name: "GyeonggiBatangB", size: 17)
    gameCharacterDescriptionLabel.textAlignment = .center
    achievementLabel.font = UIFont(name: "NanumSquareEB", size: 21)
    achievementNumberLabel.font = UIFont(name: "NanumSquareB", size: 14)
  }
}


class NoteCollectionViewLeftCell: UICollectionViewCell {
  
  @IBOutlet weak var achievementImageView: UIImageView!
  @IBOutlet weak var lockedView: UIView!
  @IBOutlet weak var achievementTitleLabel: UILabel!
  @IBOutlet var cellBackground: UIView!

  override func awakeFromNib() {
    super.awakeFromNib()
    setupStyle()
  }

  private func setupStyle() {
    lockedView.layer.cornerRadius = 10
    achievementImageView.layer.cornerRadius = 7
    achievementImageView.layer.borderWidth = 3
    achievementImageView.layer.borderColor = UIColor(red: 0.587, green: 0.7, blue: 0.796, alpha: 1).cgColor
    cellBackground.layer.cornerRadius = 10
  }
  
  func changeShadowAndBorder(view: UIView, shadowColor: UIColor, borderColor: UIColor) {
    view.setShadow(color: shadowColor, offsetX: 0, offsetY: 0, opacity: 1, radius: 5)
    view.setBolder(color: borderColor, width: 4)
  }
  
  func configureCell(achievement: Achievement) {
    achievementImageView.image = UIImage(named: achievement.image)
    if achievement.isLocked {
      lockedView.isHidden = false
      achievementTitleLabel.text = "???"
    } else {
      lockedView.isHidden = true
      achievementTitleLabel.text = achievement.name
    }
    achievement.isLocked ? changeShadowAndBorder(view: cellBackground, shadowColor: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), borderColor: UIColor(red: 0.587, green: 0.7, blue: 0.796, alpha: 1)) : changeShadowAndBorder(view: cellBackground, shadowColor: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), borderColor: UIColor(red: 0.588, green: 0.698, blue: 0.796, alpha: 1))
  }
}


class NoteCollectionViewRightCell: UICollectionViewCell {

  @IBOutlet weak var achievementImageView: UIImageView!
  @IBOutlet weak var lockedView: UIView!
  @IBOutlet weak var achievementTitleLabel: UILabel!
  @IBOutlet var cellBackground: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupStyle()
  }

  private func setupStyle() {
    lockedView.layer.cornerRadius = 7
    achievementImageView.layer.cornerRadius = 7
    achievementImageView.layer.borderWidth = 3
    achievementImageView.layer.borderColor = UIColor(red: 0.587, green: 0.7, blue: 0.796, alpha: 1).cgColor
    cellBackground.layer.cornerRadius = 7
  }
  
  func changeShadowAndBorder(view: UIView, shadowColor: UIColor, borderColor: UIColor) {
    view.setShadow(color: shadowColor, offsetX: 0, offsetY: 0, opacity: 1, radius: 5)
    view.setBolder(color: borderColor, width: 4)
  }
  
  func configureCell(achievement: Achievement) {
    achievementImageView.image = UIImage(named: achievement.image)
    if achievement.isLocked {
      lockedView.isHidden = false
      achievementTitleLabel.text = "???"
    } else {
      lockedView.isHidden = true
      achievementTitleLabel.text = achievement.name
    }
    achievement.isLocked ? changeShadowAndBorder(view: cellBackground, shadowColor: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), borderColor: UIColor(red: 0.587, green: 0.7, blue: 0.796, alpha: 1)) : changeShadowAndBorder(view: cellBackground, shadowColor: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), borderColor: UIColor(red: 0.588, green: 0.698, blue: 0.796, alpha: 1))
  }
}

//
//  NoteUserViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/04.
//

import UIKit

class NoteUserViewController: UIViewController {

  @IBOutlet var nameLabel: UILabel!
  @IBOutlet weak var noteCollectionView: UICollectionView!

  var recievedGameCharacter: GameCharacter?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.noteCollectionView.delegate = self
    self.noteCollectionView.dataSource = self
    player.currentAchievementInfo.enumerated().forEach {
      if !$1.isChecked && !$1.isLocked { player.currentAchievementInfo[$0].isChecked = true }
    }
  }
    
  override func viewWillAppear(_ animated: Bool) {
    noteCollectionView.reloadData()
    if let receivedCharacter = recievedGameCharacter {
      updateView(gameCharacter: receivedCharacter)
    }
  }
  
  @IBAction func exitButton(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  
  func updateView(gameCharacter: GameCharacter) {
    nameLabel.text = gameCharacter.name
  }
}

extension NoteUserViewController: UICollectionViewDelegate,UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return player.currentAchievementInfo.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let achievement = player.currentAchievementInfo[indexPath.row]
    if Int(indexPath.row) % 2 == 0 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "achievementLeftCell", for: indexPath) as! NoteCollectionViewLeftCell
      cell.configureCell(achievement: achievement)
      return cell
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "achievementRightCell", for: indexPath) as! NoteCollectionViewRightCell
      cell.configureCell(achievement: achievement)
      return cell
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
      
    var headerCell = UICollectionReusableView()
    switch kind {
    case UICollectionView.elementKindSectionHeader:
    guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "userInfoCell", for: indexPath) as? NoteCollectionViewReusableCell else { fatalError("Invalid view type") }
    if let character = recievedGameCharacter { cell.configureCell(character: character) }
    headerCell = cell
      
    default: assert(false, "Invalid element type")
    }
    return headerCell
  }
}

extension NoteUserViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let collectionViewCellWidth = collectionView.frame.width/2
    return CGSize(width: collectionViewCellWidth, height: collectionViewCellWidth)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    let indexPath = IndexPath(row: 0, section: section)
    let headerView = self.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader, at: indexPath)
    return headerView.systemLayoutSizeFitting(CGSize(width: collectionView.frame.width, height: UIView.layoutFittingExpandedSize.height), withHorizontalFittingPriority: .required,
          verticalFittingPriority: .fittingSizeLevel)
  }
}

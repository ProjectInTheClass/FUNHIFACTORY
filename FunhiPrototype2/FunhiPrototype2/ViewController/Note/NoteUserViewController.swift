//
//  NoteUserViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/04.
//

import UIKit

class NoteCollectionViewReusableCell: UICollectionViewCell {
    @IBOutlet weak var gameCharacteBackgroundImageView: UIImageView!
    @IBOutlet weak var gameCharacterProfileImageView: UIImageView!
    @IBOutlet weak var gameCharacterDescriptionLabel: UILabel!
    @IBOutlet weak var achievementLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
    }
   
    func designCell() {
        
        gameCharacterProfileImageView.layer.cornerRadius = gameCharacterProfileImageView.frame.width/2
        gameCharacterProfileImageView.layer.borderWidth = 3
        gameCharacterProfileImageView.layer.backgroundColor = UIColor(red: 0.22, green: 0.325, blue: 0.404, alpha: 1).cgColor
    }
}
class NoteCollectionViewLeftCell: UICollectionViewCell {
    @IBOutlet weak var achievementImageView: UIImageView!
    @IBOutlet weak var lockedView: UIView!
    @IBOutlet weak var achievementTitleLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func designCell() {
        lockedView.layer.cornerRadius = 7
        achievementImageView.layer.cornerRadius = 7
        achievementImageView.layer.borderWidth = 3
        achievementImageView.layer.borderColor = UIColor(red: 0.255, green: 0.204, blue: 0.129, alpha: 1).cgColor
    }
}
class NoteCollectionViewRightCell: UICollectionViewCell {
  
    @IBOutlet weak var achievementImageView: UIImageView!
    @IBOutlet weak var lockedView: UIView!
    @IBOutlet weak var achievementTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
    }
    func designCell() {
        lockedView.layer.cornerRadius = 7
        achievementImageView.layer.cornerRadius = 7
        achievementImageView.layer.borderWidth = 3
        achievementImageView.layer.borderColor = UIColor(red: 0.255, green: 0.204, blue: 0.129, alpha: 1).cgColor
    }
}
class NoteUserViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    
    //--------------------콜렉션 뷰-----------------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return player.currentAchievementInfo.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if Int(indexPath.row) % 2 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "achievementLeftCell", for: indexPath) as! NoteCollectionViewLeftCell
            cell.achievementImageView.image = UIImage(named: player.currentAchievementInfo[indexPath.row].image)
            cell.achievementTitleLabel.text = player.currentAchievementInfo[indexPath.row].name
            if player.currentAchievementInfo[indexPath.row].isLocked {
                cell.lockedView.isHidden = false
            } else {
                cell.lockedView.isHidden = true
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "achievementRightCell", for: indexPath) as! NoteCollectionViewRightCell
            cell.achievementImageView.image = UIImage(named: player.currentAchievementInfo[indexPath.row].image)
            cell.achievementTitleLabel.text = player.currentAchievementInfo[indexPath.row].name
            if player.currentAchievementInfo[indexPath.row].isLocked {
                cell.lockedView.isHidden = false
            } else {
                cell.lockedView.isHidden = true
            }
            return cell
        }
           
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCellWidth = collectionView.frame.width/2
       
        return CGSize(width: collectionViewCellWidth, height: collectionViewCellWidth)
    }

    //가장 윗 셀 그리는 함수
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard
                let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "userInfoCell", for: indexPath) as? NoteCollectionViewReusableCell else {
                    fatalError("Invalid view type")
            }
            if let recievedGameCharacter = recievedGameCharacter {
                cell.gameCharacteBackgroundImageView.image = UIImage(named: recievedGameCharacter.backGroundImage)
                cell.gameCharacterProfileImageView.image = UIImage(named: recievedGameCharacter.profileImage)
                cell.gameCharacterDescriptionLabel.text = recievedGameCharacter.description
                cell.achievementLabel.text = "\(player.clearedAchievementCount)/\(player.currentAchievementInfo.count)"
            }
            
            return cell
        default:
            assert(false, "Invalid element type")
        }
    }
    
    //-------------------일반 아웃렛, 메소드------------
    var recievedGameCharacter: GameCharacter?
    @IBOutlet weak var noteCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.noteCollectionView.delegate = self
        self.noteCollectionView.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func exitButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func designObjectis() {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  NoteUserViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/04.
//

import UIKit
/*
나눔손글씨 할아버지의나눔
== NanumHarABeoJiEuiNaNum
 GyeonggiBatang
 == GyeonggiBatangR
 == GyeonggiBatangB
NanumSquare
== NanumSquareR
== NanumSquareB
== NanumSquareEB
NEXON Lv2 Gothic
== NEXONLv2GothicRegular
== NEXONLv2GothicLight
== NEXONLv2GothicMedium
== NEXONLv2GothicBold

 
*/
class NoteCollectionViewReusableCell: UICollectionViewCell {
    @IBOutlet weak var gameCharacteBackgroundImageView: UIImageView!
    @IBOutlet weak var gameCharacterProfileImageView: UIImageView!
    @IBOutlet weak var gameCharacterDescriptionLabel: UILabel!
    @IBOutlet weak var achievementLabel: UILabel!
    @IBOutlet weak var achievementNumberLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
    }
   
    func designCell() {
        gameCharacterDescriptionLabel.setLineSpacing(lineSpacing: 10)
        gameCharacterProfileImageView.layer.cornerRadius = gameCharacterProfileImageView.frame.width/2
        
    }
}
class NoteCollectionViewLeftCell: UICollectionViewCell {
    @IBOutlet weak var achievementImageView: UIImageView!
    @IBOutlet weak var lockedView: UIView!
    @IBOutlet weak var achievementTitleLabel: UILabel!
    @IBOutlet var cellBackground: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        designCell() 
    }
    func designCell() {
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
}
class NoteCollectionViewRightCell: UICollectionViewCell {
  
    @IBOutlet weak var achievementImageView: UIImageView!
    @IBOutlet weak var lockedView: UIView!
    @IBOutlet weak var achievementTitleLabel: UILabel!
    
    @IBOutlet var cellBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
    }
    func designCell() {
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
}
class NoteUserViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    
    //--------------------콜렉션 뷰-----------------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return player.currentAchievementInfo.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let currentAchievement = player.currentAchievementInfo[indexPath.row]
        if Int(indexPath.row) % 2 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "achievementLeftCell", for: indexPath) as! NoteCollectionViewLeftCell
            cell.achievementImageView.image = UIImage(named: player.currentAchievementInfo[indexPath.row].image)
            if player.currentAchievementInfo[indexPath.row].isLocked {
                cell.lockedView.isHidden = false
                cell.achievementTitleLabel.text = "???"
                
            } else {
                cell.lockedView.isHidden = true
                cell.achievementTitleLabel.text = player.currentAchievementInfo[indexPath.row].name
            }
            currentAchievement.isLocked ? cell.changeShadowAndBorder(view: cell.cellBackground, shadowColor: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), borderColor: UIColor(red: 0.587, green: 0.7, blue: 0.796, alpha: 1)) : cell.changeShadowAndBorder(view: cell.cellBackground, shadowColor: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), borderColor: UIColor(red: 0.588, green: 0.698, blue: 0.796, alpha: 1))
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "achievementRightCell", for: indexPath) as! NoteCollectionViewRightCell
            cell.achievementImageView.image = UIImage(named: player.currentAchievementInfo[indexPath.row].image)
            
            if player.currentAchievementInfo[indexPath.row].isLocked {
                cell.lockedView.isHidden = false
                cell.achievementTitleLabel.text = "???"
                
            } else {
                cell.lockedView.isHidden = true
                cell.achievementTitleLabel.text = player.currentAchievementInfo[indexPath.row].name
            }
            currentAchievement.isLocked ? cell.changeShadowAndBorder(view: cell.cellBackground, shadowColor: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), borderColor: UIColor(red: 0.587, green: 0.7, blue: 0.796, alpha: 1)) : cell.changeShadowAndBorder(view: cell.cellBackground, shadowColor: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), borderColor: UIColor(red: 0.588, green: 0.698, blue: 0.796, alpha: 1))
            return cell
        }
           
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCellWidth = collectionView.frame.width/2
       
        return CGSize(width: collectionViewCellWidth, height: collectionViewCellWidth)
    }

    //가장 윗 셀 그리는 함수
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var headerCell = UICollectionReusableView()
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard
                let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "userInfoCell", for: indexPath) as? NoteCollectionViewReusableCell else {
                    fatalError("Invalid view type")
            }
            if let recievedGameCharacter = recievedGameCharacter {
                cell.gameCharacteBackgroundImageView.image = UIImage(named: recievedGameCharacter.backGroundImage)
                cell.gameCharacterProfileImageView.image = UIImage(named: "\(recievedGameCharacter.profileImage)_noteLarge")
                
                cell.gameCharacterDescriptionLabel.text = recievedGameCharacter.description
                cell.achievementNumberLabel.text = "\(player.clearedAchievementCount)/\(player.currentAchievementInfo.count)"
                cell.gameCharacterDescriptionLabel.font = UIFont(name: "GyeonggiBatangB", size: 17)
                cell.gameCharacterDescriptionLabel.textAlignment = .center
                cell.achievementLabel.font = UIFont(name: "NanumSquareEB", size: 21)
                cell.achievementNumberLabel.font = UIFont(name: "NanumSquareB", size: 14)
            }
            headerCell = cell
           
        default:
            assert(false, "Invalid element type")
        }
        return headerCell
    }
    
    
    //-------------------일반 아웃렛, 메소드------------
    @IBOutlet var nameLabel: UILabel!
    var recievedGameCharacter: GameCharacter?
    @IBOutlet weak var noteCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.noteCollectionView.delegate = self
        self.noteCollectionView.dataSource = self
        designObjects()
        for index in player.currentAchievementInfo.indices {
            if !player.currentAchievementInfo[index].isChecked && !player.currentAchievementInfo[index].isLocked{
                player.currentAchievementInfo[index].isChecked = true
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        noteCollectionView.reloadData()
        if let receivedCharacter = recievedGameCharacter {
            updateView(gameCharacter: receivedCharacter)
        }
       
    }
    
    func updateView(gameCharacter: GameCharacter) {
        nameLabel.text = gameCharacter.name
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        // Get the view for the first header
        let indexPath = IndexPath(row: 0, section: section)
        let headerView = self.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader, at: indexPath)

        // Use this view to calculate the optimal size based on the collection view's width
        return headerView.systemLayoutSizeFitting(CGSize(width: collectionView.frame.width, height: UIView.layoutFittingExpandedSize.height), withHorizontalFittingPriority: .required, // Width is fixed
            verticalFittingPriority: .fittingSizeLevel) // Height can be as large as needed
    }
    
    @IBAction func exitButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func designObjects() {
//        nameLabel.font = UIFont(name: "NanumSquareEB", size: 29)

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

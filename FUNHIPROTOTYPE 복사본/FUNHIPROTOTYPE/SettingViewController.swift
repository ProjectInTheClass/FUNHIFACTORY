//
//  SettingViewController.swift
//  FUNHIPROTOTYPE
//
//  Created by 손영웅 on 2020/10/08.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var currentChapterLable: UILabel!
    @IBOutlet weak var questChapterLableBoxWidth: NSLayoutConstraint!
    
    @IBOutlet weak var questChapterLableBox: UIView!
    @IBOutlet weak var questLabel1: UILabel!
    @IBOutlet weak var quest1rewardLable: UILabel!
   
    @IBOutlet weak var questLabel2: UILabel!
    @IBOutlet weak var quest2rewardLable: UILabel!

    @IBOutlet weak var questLabel3: UILabel!
    @IBOutlet weak var quest3rewardLable: UILabel!
    
    @IBOutlet weak var totalGoldLabel: UILabel!
    
    @IBOutlet weak var textSizeLabel: UILabel!
    @IBOutlet weak var lineSpacingLabel: UILabel!
    @IBOutlet weak var textStyleSampleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        if santa.gameCharacter.currentChapterIndex == 0 {
            currentChapterLable.text = "프롤로그 퀘스트"
            self.questChapterLableBoxWidth.constant = CGFloat(109)
            
        } else if santa.gameCharacter.currentChapterIndex > 0 {
            currentChapterLable.text = "\(santa.gameCharacter.currentChapterIndex)장 퀘스트"
            self.questChapterLableBoxWidth.constant = CGFloat(84)
        }
        
        
        if santa.gameCharacter.currentChapter().quests.count == 3 {
        questLabel1.text = santa.gameCharacter.currentChapter().quests[0].questName
        questLabel2.text = santa.gameCharacter.currentChapter().quests[1].questName
        questLabel3.text = santa.gameCharacter.currentChapter().quests[2].questName
        
        quest1rewardLable.text = String(santa.gameCharacter.currentChapter().quests[0].reward)
        quest2rewardLable.text = String(santa.gameCharacter.currentChapter().quests[1].reward)
        quest3rewardLable.text = String(santa.gameCharacter.currentChapter().quests[2].reward)
        } else {
            questLabel1.text = ""
            questLabel2.text = ""
            questLabel3.text = ""
            
            quest1rewardLable.text = ""
            quest2rewardLable.text = ""
            quest3rewardLable.text = ""
        }
        //캐릭터 골드 양
            
            let totalGoldLabelValue = santa.gameCharacter.previousChapterGold + santa.gameCharacter.currentChapterGold
            totalGoldLabel.text = "\(totalGoldLabelValue)"
           
        // "n장 퀘스트" 레이블 텍스트 길이에 회색네모 가로 조정되게 하려 했으나.. 현재 실행 안 됨
        
        
        showFinishedQuest()
    }
    @IBAction func backToMainGameViewButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func showFinishedQuest() {
        for quest in santa.gameCharacter.currentChapter().quests.enumerated() {
            if quest.element.questClearJoGeun == [] {
                switch quest.offset {
                case 0:
                    questLabel1.textColor = .gray
                    quest1rewardLable.textColor = .gray
                case 1:
                    questLabel2.textColor = .gray
                    quest2rewardLable.textColor = .gray
                case 2:
                    questLabel3.textColor = .gray
                    quest3rewardLable.textColor = .gray
                   
                    
                default:
                    break
                }
            }
        }
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

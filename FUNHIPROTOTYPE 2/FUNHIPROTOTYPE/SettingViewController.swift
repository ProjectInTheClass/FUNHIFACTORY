//
//  SettingViewController.swift
//  FUNHIPROTOTYPE
//
//  Created by 손영웅 on 2020/10/08.
//

import UIKit
import MessageUI

class SettingViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var currentChapterLabel: UILabel!
    @IBOutlet weak var questChapterLabelBoxWidth: NSLayoutConstraint!
    
    @IBOutlet weak var questLabel1: UILabel!
    @IBOutlet weak var quest1rewardLabel: UILabel!
   
    @IBOutlet weak var questLabel2: UILabel!
    @IBOutlet weak var quest2rewardLabel: UILabel!

    @IBOutlet weak var questLabel3: UILabel!
    @IBOutlet weak var quest3rewardLabel: UILabel!
    
    @IBOutlet weak var totalGoldLabel: UILabel!
    
    @IBOutlet weak var textSizeLabel: UILabel!
    @IBOutlet weak var lineSpacingLabel: UILabel!
    @IBOutlet weak var textStyleSampleLabel: UILabel!
    @IBOutlet var bgmGauge: UISlider!

    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        if santa.gameCharacter.currentChapterIndex == 0 {
            currentChapterLabel.text = "프롤로그 퀘스트"
            self.questChapterLabelBoxWidth.constant = CGFloat(109)
            
        } else if santa.gameCharacter.currentChapterIndex > 0 {
            currentChapterLabel.text = "\(santa.gameCharacter.currentChapterIndex)장 퀘스트"
            self.questChapterLabelBoxWidth.constant = CGFloat(84)
        }
        
        
        if santa.gameCharacter.currentChapter().quests.count == 3 {
          

            


            
        questLabel1.text = santa.gameCharacter.currentChapter().quests[0].questName
        questLabel2.text = santa.gameCharacter.currentChapter().quests[1].questName
        questLabel3.text = santa.gameCharacter.currentChapter().quests[2].questName
        
        quest1rewardLabel.text = String(santa.gameCharacter.currentChapter().quests[0].reward)
        quest2rewardLabel.text = String(santa.gameCharacter.currentChapter().quests[1].reward)
        quest3rewardLabel.text = String(santa.gameCharacter.currentChapter().quests[2].reward)
        } else {
            questLabel1.text = ""
            questLabel2.text = ""
            questLabel3.text = ""
            
            quest1rewardLabel.text = ""
            quest2rewardLabel.text = ""
            quest3rewardLabel.text = ""
        }
        //캐릭터 골드 양
            
            let totalGoldLabelValue = santa.gameCharacter.previousChapterGold + santa.gameCharacter.currentChapterGold
            totalGoldLabel.text = "\(totalGoldLabelValue)"
           
        // "n장 퀘스트" 레이블 텍스트 길이에 회색네모 가로 조정되게 하려 했으나.. 현재 실행 안 됨
        
        
        showFinishedQuest()
        
        textSizeLabel.text = String(santa.setting.fontSize)
        lineSpacingLabel.text = String(santa.setting.rowSpacing)
        textStyleSampleLabel.font = textStyleSampleLabel.font.withSize(CGFloat(santa.setting.fontSize))
        
    }

    @IBAction func backToMainGameViewButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func decreaseText(_ sender: Any) {
        santa.setting.fontSize -= 1
        textStyleSampleLabel.font = textStyleSampleLabel.font.withSize(CGFloat(santa.setting.fontSize))
        textSizeLabel.text = String(santa.setting.fontSize)
    }
    @IBAction func increaseText(_ sender: Any) {
        santa.setting.fontSize += 1
        textStyleSampleLabel.font = textStyleSampleLabel.font.withSize(CGFloat(santa.setting.fontSize))
        textSizeLabel.text = String(santa.setting.fontSize)
    }
    @IBAction func decreaseRow(_ sender: Any) {
        if santa.setting.rowSpacing == 0 {
            print("최소 크기입니다.")
        } else{
            santa.setting.rowSpacing -= 1
        }
        textStyleSampleLabel.setLineSpacing(lineSpacing: CGFloat(santa.setting.rowSpacing))
        lineSpacingLabel.text = String(santa.setting.rowSpacing)
    }
    @IBAction func increaseRow(_ sender: Any) {
        santa.setting.rowSpacing += 1
        textStyleSampleLabel.setLineSpacing(lineSpacing: CGFloat(santa.setting.rowSpacing))
        lineSpacingLabel.text = String(santa.setting.rowSpacing)
    }
    
    @IBAction func settingMailButtonClicked(_ sender: Any) {
        if let mail = URL(string: "mailto: rlagofls7924@gmail.com"){
            if UIApplication.shared.canOpenURL(mail){
                UIApplication.shared.open(mail)
                } else {
                print("I can't open mail app.")
            }
        }
       
    }
    
    func showFinishedQuest() {
        for quest in santa.gameCharacter.currentChapter().quests.enumerated() {
            if quest.element.questClearJoGeun == [] {
                switch quest.offset {
                case 0:
                    questLabel1.textColor = .gray
                    quest1rewardLabel.textColor = .gray
                case 1:
                    questLabel2.textColor = .gray
                    quest2rewardLabel.textColor = .gray
                case 2:
                    questLabel3.textColor = .gray
                    quest3rewardLabel.textColor = .gray
                   
                    
                default:
                    break
                }
            }
        }
    }
}

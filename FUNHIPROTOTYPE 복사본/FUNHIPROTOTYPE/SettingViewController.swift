//
//  SettingViewController.swift
//  FUNHIPROTOTYPE
//
//  Created by 손영웅 on 2020/10/08.
//

import UIKit
import MessageUI

class SettingViewController: UIViewController, MFMailComposeViewControllerDelegate {

  
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
    @IBOutlet var bgmGauge: UISlider!

    
    override func viewWillAppear(_ animated: Bool) {
        textSizeLabel.text = String(santa.setting.fontSize)
        lineSpacingLabel.text = String(santa.setting.rowSpacing)
        textStyleSampleLabel.font = textStyleSampleLabel.font.withSize(CGFloat(santa.setting.fontSize))
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
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
}

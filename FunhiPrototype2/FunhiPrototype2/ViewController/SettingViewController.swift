//
//  SettingViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/03.
//

import UIKit
import MessageUI

class SettingViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet var bgmSlider: UISlider!
    @IBOutlet var effectMusicSlider: UISlider!
    @IBOutlet var textSpeedSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgmSlider.minimumValue = 0.0
        bgmSlider.maximumValue = 1.0
        effectMusicSlider.minimumValue = 0.0
        effectMusicSlider.maximumValue = 1.0
        textSpeedSlider.minimumValue = 0.85
        textSpeedSlider.maximumValue = 3.5
        bgmSlider.value = player.setting.bgmVolume
        effectMusicSlider.value = player.setting.effectVolume
        textSpeedSlider.value = Float(player.setting.textSpeed)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
   
        
    @IBOutlet weak var darkmodeSwitch: UISwitch!
    @IBAction func darkmodeSwitchTapped(_ sender: UISwitch) {
        player.setting.darkmode = darkmodeSwitch.isOn ? true : false
    }
    @IBAction func creditTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "credit")
        vc?.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func vibrateSwitchTapped(_ sender: Any) {
        if playerSetting.vibration == true{
            print("진동을 비활성화했습니다.")
            playerSetting.vibration = false
        }else{
            print("진동을 활성화시켰습니다.")
            playerSetting.vibration = true
        }
    }
    
    @IBAction func bgmSliderTapped(_ sender: Any) {
        player.setting.bgmVolume = bgmSlider.value
        bgmPlayer?.setVolume(bgmSlider.value, fadeDuration: 1)
        print(bgmSlider.value)
    }
    @IBAction func effectSliderTapped(_ sender: Any) {
        player.setting.effectVolume = effectMusicSlider.value
        effectPlayer?.setVolume(effectMusicSlider.value, fadeDuration: 1)
        print(bgmSlider.value)
    }
    @IBAction func textSpeedSliderTapped(_ sender: Any) {
        player.setting.textSpeed = Double(textSpeedSlider.value)
        print(textSpeedSlider.value)
    }
    
    
    
    @IBAction func bugReportTapped(_ sender: Any) {
        if !MFMailComposeViewController.canSendMail() {return}
                let emailVC = MFMailComposeViewController()
                emailVC.mailComposeDelegate = self
                emailVC.setToRecipients(["funfac@gmail.com"])
                //emailVC.setSubject("제목이 들어갈 자리입니다.")
                //emailVC.setMessageBody("내용이 들어갈 자리입니다", isHTML: false)
                present(emailVC, animated: true, completion: nil)
    }
}

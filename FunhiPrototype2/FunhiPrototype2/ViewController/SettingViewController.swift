//
//  SettingViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/03.
//

import UIKit
import MessageUI

class SettingViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    @IBOutlet var bgmSlider: UISlider!
    @IBOutlet var effectMusicSlider: UISlider!
    @IBOutlet var initializeAlert: UIView!
    @IBOutlet var textSpeedSlider: UISlider!
    let blackView = UIView()
    
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
        yesButton.layer.borderColor = UIColor(red: 0.396, green: 0.396, blue: 0.396, alpha: 1).cgColor
        noButton.layer.borderColor = UIColor(red: 0.396, green: 0.396, blue: 0.396, alpha: 1).cgColor
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
    @IBAction func initializeButtonTapped(_ sender: Any) {
        
        blackView.backgroundColor = UIColor.black
        blackView.bounds = self.view.bounds
        blackView.center = self.view.center
        blackView.alpha = 0.8
        self.view.addSubview(blackView)
        self.view.addSubview(initializeAlert)
        initializeAlert.layer.borderColor = UIColor(red: 0.862, green: 0.862, blue: 0.862, alpha: 1).cgColor
        initializeAlert.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 325).isActive = true
        initializeAlert.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 40).isActive = true
    }
    @IBAction func yesButtonTapped(_ sender: Any) {
        print("게임 데이터가 초기화되었습니다.")
        player.currentChatArray.removeAll()
        player.currentGodChatArray.removeAll()
        print(player)
        /*
         let pvc = self.presentingViewController
         self.dismiss(animated: false, completion: {
             pvc?.dismiss(animated: false, completion: nil)
         })
         */
        self.view.window?.rootViewController?.dismiss(animated: false, completion: {
            let homeVC = TitleCoverViewController()
            homeVC.modalPresentationStyle = .fullScreen
        })
    }
    @IBAction func noButtonTapped(_ sender: Any) {
        initializeAlert.removeFromSuperview()
        blackView.removeFromSuperview()
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
/*
private func initializeUser(){
    for var a in episodes{
        a.isCleared = false
        for b in a.currentCharacterNote{
            b.isLocked = true
        }
        for c in a.currentAlbumImages{
            c.isLocked = true
        }
    }
     for var a in achievements{
         a.isLocked = true
     }
    //player.currentEpisodes[0].currentCharacterNote[0].isLocked = false
}
*/

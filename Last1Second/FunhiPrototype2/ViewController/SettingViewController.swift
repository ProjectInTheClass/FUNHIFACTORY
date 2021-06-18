//
//  SettingViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/03.
//

import UIKit
import MessageUI

class SettingViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet var settingLabel: UILabel!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    @IBOutlet var bgmSlider: UISlider!
    @IBOutlet var effectMusicSlider: UISlider!
    @IBOutlet var initializeAlert: UIView!
    @IBOutlet var textSpeedSlider: UISlider!
    @IBOutlet var initializeAlertButtons: [UIButton]!
    @IBOutlet var initConfirmView: UIView!
    @IBOutlet var settingPropertyLabels: [UILabel]!
    
    let blackView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVc();
        self.transitioningDelegate = self
    }
    
    func initializeVc()
    {
        initConfirmView.frame = initConfirmView.frame.insetBy(dx: -6, dy: -6);
        initializeAlert.frame = initializeAlert.frame.insetBy(dx: -6, dy: -6);
        initConfirmView.layer.borderWidth = 6;
        initConfirmView.layer.borderColor = CGColor(red: 0.65, green: 0.74, blue: 0.81, alpha: 1.0)
        initializeAlert.layer.borderWidth = 6;
        initializeAlert.layer.borderColor = CGColor(red: 0.65, green: 0.74, blue: 0.81, alpha: 1.0)
        bgmSlider.minimumValue = 0.0
        bgmSlider.maximumValue = 1.0
        effectMusicSlider.minimumValue = 0.0
        effectMusicSlider.maximumValue = 1.0
//        textSpeedSlider.minimumValue = 0.8
//        textSpeedSlider.maximumValue = 3.5
        bgmSlider.value = player.setting.bgmVolume
        effectMusicSlider.value = player.setting.effectVolume
        textSpeedSlider.value = Float(3.5 - player.setting.textSpeed + 0.8)
        // Do any additional setup after loading the view.
        yesButton.layer.borderColor = UIColor(red: 0.396, green: 0.396, blue: 0.396, alpha: 1).cgColor
        noButton.layer.borderColor = UIColor(red: 0.396, green: 0.396, blue: 0.396, alpha: 1).cgColor
        for button in initializeAlertButtons {
            button.layer.shadowColor = UIColor(red: 0.38, green: 0.457, blue: 0.521, alpha: 1).cgColor
            button.layer.shadowOpacity = 1
            button.layer.shadowRadius = 0
            button.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
        settingLabel.font = UIFont(name: "NanumSquareEB", size: 29)
        
        for label in settingPropertyLabels
        {
            label.font = UIFont(name: "NanumSquareEB", size: 20)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    
    }
   

    @IBAction func creditTapped(_ sender: Any) {
        performSegue(withIdentifier: "o", sender: nil)
//        let vc = storyboard?.instantiateViewController(identifier: "o")
//        vc?.modalPresentationStyle = .fullScreen
//        present(vc!, animated: true, completion: nil)
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
        player.setting.textSpeed = (3.5 - Double(textSpeedSlider.value) + 0.8)
    }
    @IBAction func initializeButtonTapped(_ sender: Any) {
        
        blackView.backgroundColor = UIColor.black
        blackView.bounds = self.view.bounds
        blackView.center = self.view.center
        blackView.alpha = 0.8
        self.view.addSubview(blackView)
        self.view.addSubview(initializeAlert)
// 아웃렛 디자인 접근하기 편하게 스토리보드에 몰아놓느라 주석처리 해놓았어요 색상 스토리보드에서 확인하심 됩니당
//        initializeAlert.layer.borderColor = UIColor(red: 0.862, green: 0.862, blue: 0.862, alpha: 1).cgColor
        initializeAlert.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 325).isActive = true
        initializeAlert.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 40).isActive = true
    }
    @IBAction func initConfirmButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "gotoCover", sender: nil)
    }

    @IBAction func yesButtonTapped(_ sender: Any) {
        print("게임 데이터가 초기화되었습니다.")
        initializePlayer(paraPlayer: &player)
        self.view.bringSubviewToFront(blackView)
        self.view.addSubview(initConfirmView)
        initConfirmView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 314).isActive = true
        initConfirmView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
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

extension SettingViewController : UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 0.4, animationType: .present)
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 0.4, animationType: .dismiss)
    }
}

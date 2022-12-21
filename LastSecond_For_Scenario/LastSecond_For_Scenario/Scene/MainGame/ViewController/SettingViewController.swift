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
    @IBOutlet var yesButton: SoundButton!
    @IBOutlet var noButton: SoundButton!
    @IBOutlet var bgmSlider: UISlider!
    @IBOutlet var effectMusicSlider: UISlider!
    @IBOutlet var initializeAlert: UIView!
    @IBOutlet var textSpeedSlider: UISlider!
    @IBOutlet var initializeAlertButtons: [SoundButton]!
    @IBOutlet var initConfirmView: UIView!
    @IBOutlet var settingPropertyLabels: [UILabel]!
    
    let blackView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVc();
        bgmSlider.setThumbImage(UIImage(named: "handle2"), for: .normal)
        textSpeedSlider.setThumbImage(UIImage(named: "handle2"), for: .normal)
        effectMusicSlider.setThumbImage(UIImage(named: "handle2"), for: .normal)
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
        settingLabel.font = UIFont(name: "NanumSquareEB", size: 29)
        
        for label in settingPropertyLabels
        {
            label.font = UIFont(name: "NanumSquareEB", size: 20)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    
    }
   

    @IBAction func creditTapped(_ sender: Any) {
        guard let VC = storyboard?.instantiateViewController(identifier: "credit") else {return}
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true, completion: nil)

    }
    
    @IBAction func vibrateSwitchTapped(_ sender: Any) {
        if player.setting.vibration == true{
            print("진동을 비활성화했습니다.")
            player.setting.vibration = false
        }else{
            print("진동을 활성화시켰습니다.")
            player.setting.vibration = true
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
        initializeAlert.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        initializeAlert.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
//    @IBAction func initConfirmButtonTapped(_ sender: Any) {
//        performSegue(withIdentifier: "gotoCover", sender: nil)
//    }

    @IBAction func yesButtonTapped(_ sender: Any) {
      player.userStore.isGameRestarted = true
        print("게임 데이터가 초기화되었습니다.")
        initializePlayer(paraPlayer: &player)
        self.view.bringSubviewToFront(blackView)
        self.view.addSubview(initConfirmView)
        initConfirmView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
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
                emailVC.setToRecipients(["funhifactory@gmail.com"])
                //emailVC.setSubject("제목이 들어갈 자리입니다.")
                //emailVC.setMessageBody("내용이 들어갈 자리입니다", isHTML: false)
                present(emailVC, animated: true, completion: nil)
    }
}
class CustomSlider : UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.trackRect(forBounds: bounds)
        rect.size.height = 3
        return rect
    }
}

extension SettingViewController : UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 0.3, animationType: .GoDownPresent)
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 0.35, animationType: .GoUpDismiss)
    }
}
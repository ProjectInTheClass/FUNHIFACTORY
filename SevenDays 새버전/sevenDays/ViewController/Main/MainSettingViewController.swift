//
//  MainSettingViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/27.
//

import UIKit


class SettingContainerViewController: UIViewController {

    @IBOutlet weak var bgmSlider: UISlider!
    @IBOutlet weak var effectSoundSlider: UISlider!
    @IBOutlet weak var textSpeedSlider: UISlider!
    
    var mainSettingViewCon: MainSettingViewController!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let audioPlayer = audioPlayer {
            bgmSlider.value = audioPlayer.volume
        }
        
    }
    @IBAction func goToCreditARViewAction(_ sender: Any) {
        if let mainSettingViewCon = self.parent as? MainSettingViewController {
            mainSettingViewCon.performSegue(withIdentifier: "goToARViewSegue", sender: nil)
        }
    }
    
    @IBAction func bgmVolume(_ sender: Any) {
        if let audioPlayer = audioPlayer {
            player.setting.bgmVolume = bgmSlider.value
            audioPlayer.volume = player.setting.bgmVolume
        }
    }
    @IBAction func textSpeedSliderAction(_ sender: Any) {
        // 마지막 0.5 :
        player.setting.textSpeed = Double(2.0-textSpeedSlider.value+0.5)
    }
}
class MainSettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backToMainView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
   
}
  


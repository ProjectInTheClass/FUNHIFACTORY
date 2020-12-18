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
    
    @IBAction func goToCreditARViewAction(_ sender: Any) {
        if let mainSettingViewCon = self.parent as? MainSettingViewController {
            mainSettingViewCon.performSegue(withIdentifier: "goToARViewSegue", sender: nil)
        }
    }
    
    @IBAction func bgmVolume(_ sender: Any) {
        if let audioPlayer = audioPlayer {
            audioPlayer.volume = bgmSlider.value/2
        }
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
  


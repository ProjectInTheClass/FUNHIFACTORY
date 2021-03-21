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

    @IBAction func goToPalaceARVIew(_ sender: Any) {
        if let mainSettingViewCon = self.parent as? MainSettingViewController {
            mainSettingViewCon.performSegue(withIdentifier: "palaceSegue", sender: nil)
        }
    }
    
    @IBAction func bgmVolume(_ sender: Any) {
        if let audioPlayer = audioPlayer {
            player.setting.bgmVolume = bgmSlider.value
            audioPlayer.volume = player.setting.bgmVolume
        }
    }
    
    //텍스트스피드값 변경은 userInstance파일 상단의 변수에서 하기
    @IBAction func textSpeedSliderAction(_ sender: Any) {
        player.setting.textSpeed = setTextSpeed(minimum: minimumTextSpeed, maximum: maximumTextSpeed)
    }
    
    
    //n초에 1개의 chat이 나온다 했을 때의 n값을 넣어야 함.
    //(ex)최소 속도는 3초에 1개의 chat이 나오는 정도이다-> minimum: 3
    func setTextSpeed(minimum: Double, maximum: Double) -> Double{
        return minimum-(minimum-maximum)*Double(textSpeedSlider.value)
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
  


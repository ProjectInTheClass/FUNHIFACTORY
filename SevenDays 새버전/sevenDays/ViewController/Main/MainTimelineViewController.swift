//
//  MainTimelineViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/27.
//

import UIKit
import AVFoundation
//뷰컨
class MainTimelineViewController: UIViewController {

 
    @IBOutlet weak var timelinePopupView: UIView!
   
    var timelineViewCon: MainTimelinePopupViewController!
    
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("타임라인 뷰의 childView:\(self.children)")
        for i in self.children {
            if let i = i as? MainTimelinePopupViewController {
                    timelineViewCon = i
            }
        }
        timelinePopupView.isHidden = true
        
        
        
        
    }
    
    
    @IBAction func backToMainView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    }


//팝업 컨테이너뷰
class MainTimelinePopupViewController: UIViewController {
    
    
    @IBOutlet weak var seeHistoryButton: UIButton!
    @IBOutlet var startFromCheckpointButtons: [UIButton]!
    @IBOutlet weak var popupView: UIView!
    
    var mainTimelineViewCon: MainTimelineViewController!
    var mainGameTimelineViewCon: MainGameTimelineViewController!
    
    override func viewDidLoad() {
        self.view.isHidden = false
        
    }

    override func viewDidAppear(_ animated: Bool) {
        print("팝업뷰의 패런트뷰:\(String(describing: self.parent))")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        seeHistoryButtonDesign()
        startFromCheckpointButtonDesign()
        popupView.layer.borderColor = CGColor(red: 213/255, green: 200/255, blue: 167/255, alpha: 1)
        popupView.layer.borderWidth = 2
    }
    
    func changeHidden(hidden: Bool) {
        if hidden {
            self.view.isHidden = true
        } else {
            self.view.isHidden = false
        }
    }
    @IBAction func exitButton(_ sender: Any) {
        if let mainTimelineViewCon = self.parent as?
            MainTimelineViewController {
            mainTimelineViewCon.timelinePopupView.isHidden = true
        }
        if let mainGameTimelineViewCon = self.parent as?
            MainGameTimelineViewController {
            mainGameTimelineViewCon.timelinePopupView.isHidden = true
        }
    }
    
    func seeHistoryButtonDesign() {
        seeHistoryButton.layer.backgroundColor = CGColor(red: 51/255, green: 59/255, blue: 59/255, alpha: 2)
        seeHistoryButton.layer.cornerRadius = 6
        seeHistoryButton.setTitle("첫 만남 - 아르고", for:.normal)
    }
    
    func startFromCheckpointButtonDesign() {
        for button in startFromCheckpointButtons {
            button.layer.backgroundColor = CGColor(red: 49/255, green: 64/255, blue: 68/255, alpha: 2)
            button.layer.cornerRadius = 6
            button.setTitle("체크포인트 텍스트가 들어갑니다.", for:.normal)
            button.layer.borderColor = CGColor(red: 51/255, green: 59/255, blue: 59/255, alpha: 2)
                button.layer.borderWidth = 2
        }
    }
  
}







// 배경 컨테이너뷰
class TimelineContainerViewController: UIViewController {

    @IBOutlet var dayEpisodeButtons: [UIButton]!
 
    
    var mainTimelineViewCon: MainTimelineViewController!
    var mainGameTimelineViewCon: MainGameTimelineViewController!
    
    override func viewDidAppear(_ animated: Bool) {
        print("타임라인 컨테이너뷰의 패런트뷰:\(String(describing: self.parent))")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    override func viewWillAppear(_ animated: Bool) {
        clearDayEpisodeButtonsDesign(buttons: dayEpisodeButtons)
    }
    @IBAction func openPopupViewC(_ sender: Any) {
        if let mainTimelineViewCon = self.parent as? MainTimelineViewController {
            mainTimelineViewCon.timelinePopupView.isHidden = false
        }
        if let mainGameTimelineViewCon = self.parent as? MainGameTimelineViewController {
            mainGameTimelineViewCon.timelinePopupView.isHidden = false
        }
    }
    
    
    func clearDayEpisodeButtonsDesign(buttons: [UIButton]!) {
        for button in buttons {
            button.layer.borderColor = CGColor(red: 76/255, green: 146/255, blue: 164/255, alpha: 1)
            button.layer.backgroundColor = CGColor(red: 63/255, green: 122/255, blue: 137/255, alpha: 1)
            button.layer.cornerRadius = 7
            button.layer.borderWidth = 3
            
        }
    }
    
    
   
}



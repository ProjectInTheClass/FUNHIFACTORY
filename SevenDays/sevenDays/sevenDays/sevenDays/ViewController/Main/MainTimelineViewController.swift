//
//  MainTimelineViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/27.
//

import UIKit

class MainTimelineViewController: UIViewController {

 
    @IBOutlet weak var timelinePopupView: UIView!
    var timelineViewCon: MainTimelinePopupViewController!
    
    override func viewDidAppear(_ animated: Bool) {
       
        timelineViewCon.changeHidden(hidden: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("타임라인 뷰의 childView:\(self.children)")
        for i in self.children {
            if let i = i as? MainTimelinePopupViewController {
                    timelineViewCon = i
            }
        }
        timelinePopupView.isHidden = false
    }
    
    
    @IBAction func backToMainView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

class MainTimelinePopupViewController: UIViewController {
    
    var timelineViewCon: MainTimelineViewController!
    
    override func viewDidLoad() {
        self.view.isHidden = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("팝업뷰의 패런트뷰:\(self.parent)")
    }
    
    func changeHidden(hidden: Bool) {
        if hidden {
            self.view.isHidden = true
        } else {
            self.view.isHidden = false
        }
    }
    @IBAction func exitButton(_ sender: Any) {
        if let timelineViewCon = self.parent as?
            MainTimelineViewController {
            timelineViewCon.timelinePopupView.isHidden = true
        }
        
        
    }
    
}

class TimelineContainerViewController: UIViewController {

    var timelineViewCon: MainTimelineViewController!
    
    override func viewDidAppear(_ animated: Bool) {
        print("타임라인 컨테이너뷰의 패런트뷰:\(self.parent)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    @IBAction func openPopupViewC(_ sender: Any) {
        if let timelineViewCon = self.parent as? MainTimelineViewController {
            timelineViewCon.timelinePopupView.isHidden = false
        }
    }
}



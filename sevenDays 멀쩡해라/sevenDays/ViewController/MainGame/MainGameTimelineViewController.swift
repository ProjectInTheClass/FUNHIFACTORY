//
//  MainGameTimelineViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/12/16.
//

import UIKit

class MainGameTimelineViewController: UIViewController {
    
    
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
    

}

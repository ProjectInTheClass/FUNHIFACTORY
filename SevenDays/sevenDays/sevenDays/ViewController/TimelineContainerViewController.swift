//
//  TimeLineContainerViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/12/08.
//

import UIKit

class TimelineContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

class MainTimelinePopupViewController: UIViewController {
    
    
    override func viewDidLoad() {
        self.view.isHidden = true
    }
    func changeHidden() {
        self.view.isHidden = false
    }
    
}

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
       
        timelineViewCon.changeHidden()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.children
        for i in self.children {
            if let i = i as? MainTimelinePopupViewController {
                    timelineViewCon = i
            }
        }
//
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backToMainView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



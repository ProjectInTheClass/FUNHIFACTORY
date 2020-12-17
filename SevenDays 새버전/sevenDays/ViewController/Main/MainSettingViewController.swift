//
//  MainSettingViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/27.
//

import UIKit


class SettingContainerViewController: UIViewController {

    var mainSettingViewCon: MainSettingViewController!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func goToCreditARViewAction(_ sender: Any) {
        if let mainSettingViewCon = self.parent as? MainSettingViewController {
            mainSettingViewCon.performSegue(withIdentifier: "goToARViewSegue", sender: nil)
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
  

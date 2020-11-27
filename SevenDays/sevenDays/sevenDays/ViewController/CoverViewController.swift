//
//  CoverViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/27.
//

import UIKit

class CoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goToNextView(_ sender: Any) {
       performSegue(withIdentifier: "goToHomeSegue", sender: nil)
    }
    
}

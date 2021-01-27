//
//  endingViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/27.
//

import UIKit

class endingViewController: UIViewController {

    @IBOutlet var endingType: UILabel!
    @IBOutlet var endingInformation: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func restartButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

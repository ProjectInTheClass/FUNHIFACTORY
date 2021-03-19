//
//  CreditViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/03.
//

import UIKit

class CreditViewController: UIViewController {
    @IBOutlet var creditLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creditLabel.font = UIFont(name: "NanumSquareEB", size: 29)

    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

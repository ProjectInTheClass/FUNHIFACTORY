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
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func instaButtonTapped(_ sender: Any) {
        if let url = URL(string: "https://www.instagram.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    @IBAction func pageButtonTapped(_ sender: Any) {
        if let url = URL(string: "https://funhifactory.herokuapp.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
}

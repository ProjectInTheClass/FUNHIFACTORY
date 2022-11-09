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
        transitioningDelegate = self
        creditLabel.font = UIFont(name: "NanumSquareEB", size: 29)
    }
    
    @IBAction func back(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func instaButtonTapped(_ sender: Any) {
        if let url = URL(string: "https://www.instagram.com/funhifactory/") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    @IBAction func pageButtonTapped(_ sender: Any) {
        if let url = URL(string: "https://funhifactory.herokuapp.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
}

extension CreditViewController : UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 0.4, animationType: .GoRightPresent)
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 0.4, animationType: .GoLeftDismiss)
    }
}


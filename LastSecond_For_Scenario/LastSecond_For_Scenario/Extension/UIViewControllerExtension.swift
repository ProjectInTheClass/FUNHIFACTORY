//
//  UIViewControllerExtension.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/16.
//

import UIKit

extension UIViewController {

  func pushWithAnimation(segue: String) {
    let transition:CATransition = CATransition()
    transition.duration = 0.3
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
    transition.type = CATransitionType.moveIn
    transition.subtype = CATransitionSubtype.fromBottom
    self.navigationController!.view.layer.add(transition, forKey: kCATransition)
    performSegue(withIdentifier: segue, sender: nil)
  }
  
  func pushWithAnimationFromLeft(segue: String) {
    let transition:CATransition = CATransition()
    transition.duration = 0.3
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
    transition.type = CATransitionType.moveIn
    transition.subtype = CATransitionSubtype.fromLeft
    self.navigationController!.view.layer.add(transition, forKey: kCATransition)
    performSegue(withIdentifier: segue, sender: nil)
  }
  
  func popWithAnimation() {
    let transition:CATransition = CATransition()
    transition.duration = 0.4
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    transition.type = CATransitionType.reveal
    transition.subtype = CATransitionSubtype.fromTop
    self.navigationController!.view.layer.add(transition, forKey: kCATransition)
    self.navigationController?.popViewController(animated: false)
  }
  
  func popWithAnimationFromLeft() {
    let transition:CATransition = CATransition()
    transition.duration = 0.4
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    transition.type = CATransitionType.reveal
    transition.subtype = CATransitionSubtype.fromRight
    self.navigationController!.view.layer.add(transition, forKey: kCATransition)
    self.navigationController?.popViewController(animated: false)
  }
}

//extension UIViewController {
//
//  public func pushViewController(viewController: UIViewController,
//                                 animated: Bool,
//                                 completion: @escaping (() -> Void)?) {
//    CATransaction.begin()
//    CATransaction.setCompletionBlock(completion)
//    pushViewController(viewController, animated: animated)
//    CATransaction.commit()
//  }
//
//}
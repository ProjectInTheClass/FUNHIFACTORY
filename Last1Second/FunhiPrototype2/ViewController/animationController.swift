//
//  animationController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/28.
//

import UIKit

class AnimationController: NSObject{
    private let animationDuration: Double
    private let animationType: AnimationType
    
    enum AnimationType{
        case present, dismiss
    }
    init(animationDuration : Double, animationType : AnimationType){
        self.animationType = animationType
        self.animationDuration = animationDuration
    }
}
extension AnimationController : UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: animationDuration) ?? 0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
              let fromViewController = transitionContext.viewController(forKey: .from) else {
            //화면전환이 실패했을 경우
            transitionContext.completeTransition(false)
            return
        }
        switch animationType {
        case .present:
            presentAnimation(with: transitionContext, viewToAnimate: toViewController.view)
        case .dismiss:
            print("Implement this")
        }
    }
    func presentAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView){
        viewToAnimate.clipsToBounds = true
        
    }
}

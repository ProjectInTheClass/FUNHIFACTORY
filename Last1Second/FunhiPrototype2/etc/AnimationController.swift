//
//  AnimationController.swift
//  justlike
//
//  Created by 손영웅 on 2021/02/08.
//  Copyright © 2021 손영웅. All rights reserved.
//

import UIKit
class AnimationController : NSObject{
    private let animatonDuration : Double
    private let animationType : AnimationType
    var animator : UIViewPropertyAnimator?
    
    enum AnimationType {
        case GoDownPresent, GoUpDismiss, GoRightPresent, GoLeftDismiss, MiddleScaleUp, fadeOut, GoLeftPresent, GoRightDismiss
    }
    init(animationDuration : Double, animationType : AnimationType) {
        self.animatonDuration = animationDuration
        self.animationType = animationType
    }
}

extension AnimationController : UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: animatonDuration) ?? 0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //출발하는 뷰컨트롤러와 도착하는 뷰컨트롤러를 정의한다
        guard let toViewController = transitionContext.viewController(forKey: .to),
              let fromViewController = transitionContext.viewController(forKey: .from) else {
            transitionContext.completeTransition(false)
            //뷰컨 간의 이동이 실패했을 때, return한다.
            return
        }
        switch animationType{
        case .GoDownPresent:
            //transitionContext의 컨테이너뷰는 발신 뷰를 말한다. 여기서 addSubview로 도착할 뷰를 미리 보여주고, 여기서 애니메이션을 시킨 뒤, 그 후 넘어가는 것.
            //여기서는 도착 뷰를 미리 더해준다.
            transitionContext.containerView.addSubview(toViewController.view)
            presentAnimation(with: transitionContext, viewToAnimate: toViewController.view)
        case .GoUpDismiss:
            //dismiss를 하는데, 도착할 뷰컨의 뷰를 왜 추가하냐면, 이걸 설정하지 않으면, 도착할 뷰가 까맣게 보인다. 그래서 부자연스럽게 보일 수 있음.
            transitionContext.containerView.addSubview(toViewController.view) //1
            transitionContext.containerView.addSubview(fromViewController.view) //2
            dismissAnimation(with: transitionContext, viewToAnimate: fromViewController.view)
        case .GoRightPresent:
            transitionContext.containerView.addSubview(toViewController.view)
            goRightAnimation(with: transitionContext, viewToAnimate: toViewController.view)
        case .GoLeftDismiss:
            transitionContext.containerView.addSubview(toViewController.view)
            transitionContext.containerView.addSubview(fromViewController.view)
            goLeftAnimation(with: transitionContext, viewToAnimate: fromViewController.view)
        case .MiddleScaleUp:
            transitionContext.containerView.addSubview(toViewController.view)
            scaleUpPresent(with: transitionContext, viewToAnimate: toViewController.view)
        case .fadeOut:
            transitionContext.containerView.addSubview(toViewController.view)
            transitionContext.containerView.addSubview(fromViewController.view)
            fadeOutDismiss(with: transitionContext, viewToAnimate: fromViewController.view)
        case .GoLeftPresent:
            transitionContext.containerView.addSubview(toViewController.view)
            goLeftPresent(with: transitionContext, viewToAnimate: toViewController.view)
        case .GoRightDismiss:
            transitionContext.containerView.addSubview(toViewController.view)
            transitionContext.containerView.addSubview(fromViewController.view)
            goRightDismiss(with: transitionContext, viewToAnimate: fromViewController.view)
        }
    }
    
    func goLeftPresent(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView)
    {
        let duration = transitionDuration(using: transitionContext)
        let size = viewToAnimate.bounds.size
        
        viewToAnimate.clipsToBounds = true
        viewToAnimate.frame = CGRect(x: -size.width, y: 0, width: size.width, height: size.height)
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: [], animations:
        {
            viewToAnimate.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        }, completion:
            { _ in
                transitionContext.completeTransition(true)
            })
    }
    func goRightDismiss(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView)
    {
        let duration = transitionDuration(using: transitionContext)
        let size = viewToAnimate.bounds.size
        
        viewToAnimate.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: [], animations:
            {
                viewToAnimate.frame = CGRect(x: -size.width, y: 0, width: size.width, height: size.height)
            }, completion:
                { _ in
                    transitionContext.completeTransition(true)
                }
        )
        
    }
    func goRightAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView)
    {
        let duration = transitionDuration(using: transitionContext)
        let size = viewToAnimate.bounds.size
        
        viewToAnimate.clipsToBounds = true
        viewToAnimate.frame = CGRect(x: size.width, y: 0, width: size.width, height: size.height)
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: [], animations:
        {
            viewToAnimate.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        }, completion:
            { _ in
                transitionContext.completeTransition(true)
            })
    }
    
    func goLeftAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView)
    {
        let duration = transitionDuration(using: transitionContext)
        let size = viewToAnimate.bounds.size
        
        viewToAnimate.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: [], animations:
            {
                viewToAnimate.frame = CGRect(x: size.width, y: 0, width: size.width, height: size.height)
            }, completion:
                { _ in
                    transitionContext.completeTransition(true)
                }
        )
        
    }
    
    func dismissAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView){
        let duration = transitionDuration(using: transitionContext)
        let size = viewToAnimate.bounds.size
        
        viewToAnimate.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        //animateKeyframes의 option이 어떤 종류가 있는지 찾아보기.
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: [], animations:
            {
                viewToAnimate.frame = CGRect(x: 0, y: -size.height, width: size.width, height: size.height)
            }, completion:
                { _ in
                    transitionContext.completeTransition(true)
                }
        )
        
    }
    func presentAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView){
        //원하는 애니메이션의 효과를 정리하는 곳. 지금은 present라는 애니메이션의 기본 효과를 정리
        let size = viewToAnimate.bounds.size
        viewToAnimate.clipsToBounds = true
        
        let duration = transitionDuration(using: transitionContext)
        
        viewToAnimate.frame = CGRect(x: 0, y: -size.height, width: size.width, height: size.height)
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: [], animations:
        {
            viewToAnimate.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        }, completion:
            { _ in
                transitionContext.completeTransition(true)
            }
                                                                  )
    }
    func scaleUpPresent(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView){
        viewToAnimate.clipsToBounds = true
        
        let duration = transitionDuration(using: transitionContext)
        viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: [], animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
    func	fadeOutDismiss(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView){
        viewToAnimate.clipsToBounds = true
        
        let duration = transitionDuration(using: transitionContext)
        viewToAnimate.alpha = 1
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: [], animations: {
            viewToAnimate.alpha = 0
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
}

//
//  UIViewExtension.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/19.
//

import UIKit

extension UIView {
  func showTutorial(items: [TutorialStyle]) {
    viewWithTag(728)?.removeFromSuperview()
    let tutorialView = TutorialView()
    tutorialView.tag = 728
    tutorialView.items = items
    self.addSubview(tutorialView)
    tutorialView.translatesAutoresizingMaskIntoConstraints = false
    tutorialView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    tutorialView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    tutorialView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    tutorialView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
  }
}

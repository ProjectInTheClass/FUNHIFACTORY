//
//  UIViewControllerExtension.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/16.
//

import UIKit

extension UIView {
  
  func showTutorial(items: [TutorialStyle]) {
    let tutorialView = TutorialView()
    tutorialView.items = items
    self.addSubview(tutorialView)
    tutorialView.translatesAutoresizingMaskIntoConstraints = false
    tutorialView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    tutorialView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    tutorialView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    
  }
  
}


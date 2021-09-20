//
//  ScrollViewExtension.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/16.
//

import UIKit

extension TutorialView : UIScrollViewDelegate {
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let page = Int(targetContentOffset.pointee.x / self.frame.width)
    pageView.currentPage = page
  }
}


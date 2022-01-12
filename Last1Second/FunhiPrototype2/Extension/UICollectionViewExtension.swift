//
//  UICollectionViewExtension.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2022/01/12.
//

import UIKit

extension UICollectionView {
  
  func scrollToNextCell(toRow row: Int, section: Int) {
    let rect = layoutAttributesForItem(at: IndexPath(item: row, section: section))?.frame
    
    if let rect = rect {
      scrollRectToVisible(rect, animated: true)
    } else {
      print("== paging하려는 collectionView의 IndexPath값이 유효하지 않습니다.")
    }
 
  }
}

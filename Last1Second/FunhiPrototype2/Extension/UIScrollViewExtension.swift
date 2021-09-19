//
//  ScrollViewExtension.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/16.
//

import UIKit

extension TutorialView : UIScrollViewDelegate {
    
  
  
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
//    {
//        // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
//        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
//
//        // targetContentOff을 이용하여 x좌표가 얼마나 이동했는지 확인
//        // 이동한 x좌표 값과 item의 크기를 비교하여 몇 페이징이 될 것인지 값 설정
//        var offset = targetContentOffset.pointee
//      currentIndex = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
//        var roundedIndex = round(currentIndex)
//
//        // scrollView, targetContentOffset의 좌표 값으로 스크롤 방향을 알 수 있다.
//        // index를 반올림하여 사용하면 item의 절반 사이즈만큼 스크롤을 해야 페이징이 된다.
//        // 스크로로 방향을 체크하여 올림,내림을 사용하면 좀 더 자연스러운 페이징 효과를 낼 수 있다.
//      if scrollView.contentOffset.x > targetContentOffset.pointee.x { roundedIndex = floor(currentIndex) } else { roundedIndex = ceil(currentIndex) }
//
//
//
//        // 위 코드를 통해 페이징 될 좌표값을 targetContentOffset에 대입하면 된다.
//        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
//        targetContentOffset.pointee = offset
//    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / self.frame.width)
        pageView.currentPage = page
      }
}


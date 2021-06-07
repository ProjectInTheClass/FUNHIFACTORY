//
//  scrollingEffect.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/02/04.
//

import UIKit

extension mainGameViewController{
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureCollectionViewLayoutItemSize(layout: normalChoiceCollectionViewLayout)
    }
    
    private func calculateSectionInset(layout : UICollectionViewFlowLayout) -> CGFloat {
        let cellBodyWidth: CGFloat = layout.itemSize.width
        
        //let inset = (layout.collectionView!.frame.width - cellBodyWidth + buttonWidth) / 4
        let inset = layout.collectionView!.frame.width - cellBodyWidth / 2
        return inset
    }
    
    private func configureCollectionViewLayoutItemSize(layout : UICollectionViewFlowLayout) {
        let inset: CGFloat = calculateSectionInset(layout: layout) // This inset calculation is some magic so the next and the previous cells will peek from the sides. Don't worry about it
        /*
         //width에 layout.collectionView!.frame.size.width + layout.minimumLineSpacing - 100 도 낫배드
         layout.itemSize = CGSize(width: layout.collectionView!.frame.size.width - inset * 2, height: layout.collectionView!.frame.size.height)
         //left는 0을 넣는 게 좋아보임.
         layout.sectionInset = UIEdgeInsets(top: 0, left: 0 bottom: 0, right: inset)
         */
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: inset)
        layout.itemSize = CGSize(width: layout.collectionView!.frame.size.width + layout.minimumLineSpacing - 100, height: layout.collectionView!.frame.size.height)
    }
    
    func indexOfMajorCell(layout : UICollectionViewFlowLayout) -> Int {
        let itemWidth = layout.itemSize.width
        let proportionalOffset = layout.collectionView!.contentOffset.x / itemWidth
        let index = Int(round(proportionalOffset))
        let safeIndex = max(0, min(dummyData.stories[player.dayId]!.storyBlocks[player.currentChatId]!.choices.count - 1, index))
        if layout == normalChoiceCollectionViewLayout{
            pageControl.currentPage = safeIndex
        }
        return safeIndex
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView == choiceCollectionView{
            indexOfCellBeforeDragging = indexOfMajorCell(layout: normalChoiceCollectionViewLayout)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // Stop scrollView sliding:
        targetContentOffset.pointee = scrollView.contentOffset
        
        // calculate where scrollView should snap to:
        var indexOfMajorCell : Int = 0
        if scrollView == choiceCollectionView{
            indexOfMajorCell = self.indexOfMajorCell(layout: normalChoiceCollectionViewLayout)
        }
        
        // calculate conditions:
        let swipeVelocityThreshold: CGFloat = 0.5 // after some trail and error
        let hasEnoughVelocityToSlideToTheNextCell = indexOfCellBeforeDragging + 1 < dummyData.stories[player.dayId]!.storyBlocks[player.currentChatId]!.choices.count && velocity.x > swipeVelocityThreshold
        let hasEnoughVelocityToSlideToThePreviousCell = indexOfCellBeforeDragging - 1 >= 0 && velocity.x < -swipeVelocityThreshold
        let majorCellIsTheCellBeforeDragging = indexOfMajorCell == indexOfCellBeforeDragging
        let didUseSwipeToSkipCell = majorCellIsTheCellBeforeDragging && (hasEnoughVelocityToSlideToTheNextCell || hasEnoughVelocityToSlideToThePreviousCell)
        
        if didUseSwipeToSkipCell {
            
            let snapToIndex = indexOfCellBeforeDragging + (hasEnoughVelocityToSlideToTheNextCell ? 1 : -1)
            var toValue : CGFloat = 0
            if scrollView == choiceCollectionView{
                toValue = normalChoiceCollectionViewLayout.itemSize.width * CGFloat(snapToIndex)
            }
            
            
            // Damping equal 1 => no oscillations => decay animation:
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: velocity.x, options: .allowUserInteraction, animations: {
                scrollView.contentOffset = CGPoint(x: toValue, y: 0)
                scrollView.layoutIfNeeded()
            }, completion: nil)
            
        } else {
            // This is a much better way to scroll to a cell:
            let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
            if scrollView == choiceCollectionView{
                normalChoiceCollectionViewLayout.collectionView!.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }
    }
}

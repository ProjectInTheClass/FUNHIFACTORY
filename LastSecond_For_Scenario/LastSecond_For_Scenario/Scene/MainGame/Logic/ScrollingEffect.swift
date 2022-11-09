//
//  scrollingEffect.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/02/04.
//

import UIKit

extension MainGameViewController {
    
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
        let safeIndex = max(0, min(player.currentEpisodes[strToIndex(str: player.dayId)].storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices.count - 1, index))
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
        let page = Int(targetContentOffset.pointee.x / self.view.frame.width)
        self.pageControl.currentPage = page
      }
    }

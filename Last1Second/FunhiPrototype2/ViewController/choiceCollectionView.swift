//
//  choiceCollectionView.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/10.
//

import Foundation
import UIKit
/*
 extension mainGameViewController : UICollectionViewDelegate, UICollectionViewDataSource{
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         dummyData.stories[player.dayId]!.storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "choiceCell", for: indexPath) as! choiceCollectionViewCell
         cell.choiceUpdate(choiceText : dummyData.stories[player.dayId]!.storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices[indexPath.row].text)
         return cell
     }
     func initializePageControl(collectionView : UICollectionView, choiceBar : UIView, numberOfPages: Int){
         //
         pageControl.hidesForSinglePage = true
         pageControl.numberOfPages = numberOfPages
         pageControl.pageIndicatorTintColor = UIColor(cgColor: CGColor(red: 0.742, green: 0.742, blue: 0.742, alpha: 1))
         pageControl.frame = CGRect(x: 0, y: 0, width: 414, height: 42)
         pageControl.widthAnchor.constraint(equalToConstant: 414).isActive = true
         pageControl.heightAnchor.constraint(equalToConstant: 42).isActive = true
         choiceBar.addSubview(pageControl)
         pageControl.topAnchor.constraint(equalTo: choiceBar.topAnchor, constant: 0).isActive = true
         pageControl.backgroundColor = UIColor.clear
         pageControl.currentPage = 2
         collectionView.showsVerticalScrollIndicator = false
         collectionView.showsHorizontalScrollIndicator = false
         scrollViewDidEndDecelerating(collectionView)
         collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
         pageControl.currentPageIndicatorTintColor = UIColor.black
         
     }
     
 }



 */


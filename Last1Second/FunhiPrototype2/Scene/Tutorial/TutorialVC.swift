//
//  TutorialVC.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/08.
//

import UIKit

class TutorialVC: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var pageView: UIPageControl!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  private func setupXib() {
    collectionView.register(UINib(nibName: "TutorialCell1", bundle: nil), forCellWithReuseIdentifier: "TutorialCell1")
    collectionView.register(UINib(nibName: "TutorialCell2", bundle: nil), forCellWithReuseIdentifier: "TutorialCell2")
    collectionView.register(UINib(nibName: "TutorialCell3", bundle: nil), forCellWithReuseIdentifier: "TutorialCell3")
  }
  
  @IBAction func back(_ sender: Any) {
    
  }
}

//extension TutorialVC: UICollectionViewDelegate, UICollectionViewDataSource {
//  
//  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    <#code#>
//  }
//  
//  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    <#code#>
//  }
//  
//  
//  
//}

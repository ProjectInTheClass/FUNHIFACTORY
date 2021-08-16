//
//  TutorialVC.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/08.
//

import UIKit

class TutorialView: UIView {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var pageView: UIPageControl!
  
  var items: [TutorialStyle] = [.doubleImages(image1: "", image2: "", desc: "")] {
    didSet {
   //   collectionView.reloadData()
    }
  }
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    setupLayout()
    setupStyle()
  }
  
  private func setupLayout() {
    setupXib()
    setupCollectionView()
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  private func setupStyle() {
    
  }
 
  private func setupCollectionView() {
    collectionView.isPagingEnabled = true
  }
  
  private func setupXib() {
    if let view = Bundle.main.loadNibNamed("TutorialView", owner: self, options: nil)?.first as? UIView {
      addSubview(view)
      view.pinToEdges(inView: self)
    
    }
    collectionView.register(UINib(nibName: "TutorialCell1", bundle: nil), forCellWithReuseIdentifier: "TutorialCell1")
    collectionView.register(UINib(nibName: "TutorialCell2", bundle: nil), forCellWithReuseIdentifier: "TutorialCell2")
    collectionView.register(UINib(nibName: "TutorialCell3", bundle: nil), forCellWithReuseIdentifier: "TutorialCell3")

   
  }
  
  @IBAction func back(_ sender: Any) {
    removeFromSuperview()
  }
}

extension TutorialView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TutorialCell1", for: indexPath) as! TutorialCell1
    cell.fillImage.image = UIImage(named: "cover image")
    cell.desc.text = "테스트"
    return cell
  }
  

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.bounds.width, height: collectionView.bounds.height)
  }
  
}

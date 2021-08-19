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
  var currentIndex: CGFloat = 0 {
    didSet {
      setupPageControl()
    }
  }
  var isOneStepPaging = true
  
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
  
  private func setupPageControl() {
    pageView.numberOfPages = items.count
    pageView.currentPage = Int(currentIndex)
  }
  
  @IBAction func back(_ sender: Any) {
    removeFromSuperview()
  }
}

extension TutorialView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return sampleData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    var cell = UICollectionViewCell()
    switch sampleData[indexPath.row] {
    case .singleFillImage(let image, let desc):
      let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "TutorialCell1", for: indexPath) as! TutorialCell1
      cell1.fillImage.image = UIImage(named: image)
      cell1.desc.text = desc
      cell = cell1
    case .doubleImages(let image1, let image2, let desc):
      let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "TutorialCell2", for: indexPath) as! TutorialCell2
      cell2.image1.image = UIImage(named: image1)
      cell2.image2.image = UIImage(named: image2)
      cell2.desc.text = desc
      cell = cell2
    case .singleImage(let image, let desc):
      let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "TutorialCell3", for: indexPath) as! TutorialCell3
      cell3.image.image = UIImage(named: image)
      cell3.desc.text = desc
      cell = cell3
    }
    
    return cell
  }
  

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.bounds.width, height: collectionView.bounds.height)
  }
  
}

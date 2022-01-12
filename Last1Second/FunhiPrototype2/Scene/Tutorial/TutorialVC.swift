//
//  TutorialVC.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/08.
//

import UIKit

class TutorialView: UIView {
  
  
  static func showTutorial(inView: UIView, items: [TutorialStyle], type: TutorialView.TutorialType) {
    
    switch type {
    case .home:
      guard !player.tutorialManager.homeOpen else { return }
    case .maingame:
      guard !player.tutorialManager.mainGameOpen else { return }
    case .note:
      guard !player.tutorialManager.noteOpen else { return }
    case .album:
      guard !player.tutorialManager.albumOpen else { return }
    case .timeline:
      guard !player.tutorialManager.timelineOpen else { return }
    case .map:
      guard !player.tutorialManager.mapOpen else { return }
    }
    
    let tutoView = TutorialView(items: items)
    
    tutoView.alpha = 0
    inView.addSubview(tutoView)
    tutoView.pinToEdges(inView: inView)
    
    UIView.animate(withDuration: 0.2) {
      tutoView.alpha = 1
    }
  }
  
  enum TutorialType {
    case home
    case maingame
    case note
    case album
    case timeline
    case map
  }
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var pageView: UIPageControl!
  
  var items: [TutorialStyle] = [.doubleImages(image1: "", image2: "", desc: "")] {
    didSet {
      pageView.numberOfPages = items.count
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
  
  convenience init(items: [TutorialStyle]) {
    self.init()
    self.items = items
    self.pageView.numberOfPages = items.count
  }
  
  private func commonInit() {
    setupLayout()
    setupStyle()
    setupPageControl()
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
  
  @IBAction func touchPageControl(_ sender: Any) {
    let rect = collectionView.layoutAttributesForItem(at: IndexPath(item: pageView.currentPage, section: 0))?.frame
    collectionView.scrollRectToVisible(rect!, animated: true)
  }
  
  @IBAction func moveNext(_ sender: Any) {
    guard pageView.currentPage < items.count else { return }
    pageView.currentPage += 1
    collectionView.scrollToNextCell(row: pageView.currentPage, section: 0)
  }
  
  @IBAction func movePrev(_ sender: Any) {
    guard pageView.currentPage > 0 else { return }
    pageView.currentPage -= 1
    collectionView.scrollToNextCell(row: pageView.currentPage, section: 0)
  }
  
  @IBAction func back(_ sender: Any) {
    UIView.animate(withDuration: 0.2) { [weak self] in
      self?.alpha = 0
    } completion: { [weak self] _ in
      self?.removeFromSuperview()
    }
  }
}

extension TutorialView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch items[indexPath.row] {
    case .singleFillImage(let image, let desc):
      let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "TutorialCell1", for: indexPath) as! TutorialCell1
      cell1.configureCell(image: image, desc: desc)
      return cell1
      
    case .doubleImages(let image1, let image2, let desc):
      let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "TutorialCell2", for: indexPath) as! TutorialCell2
      cell2.configureCell(image: image1, image2: image2, desc: desc)
      return cell2
      
    case .singleImage(let image, let desc):
      let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "TutorialCell3", for: indexPath) as! TutorialCell3
      cell3.configureCell(image: image, desc: desc)
      return cell3
    }
    
    
    
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.bounds.width, height: collectionView.bounds.height)
  }
}

extension UICollectionView {
  
  func scrollToNextCell(row: Int, section: Int) {
    
    let rect = layoutAttributesForItem(at: IndexPath(item: row, section: section))?.frame
    
    if let rect = rect {
      scrollRectToVisible(rect, animated: true)
    } else {
      print("== paging하려는 collectionView의 IndexPath값이 유효하지 않습니다.")
    }
 
  }
}

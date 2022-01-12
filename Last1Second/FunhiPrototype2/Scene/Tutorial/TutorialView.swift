//
//  TutorialVC.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/08.
//

import UIKit

class TutorialView: UIView {
  
  // MARK: Enum
  
  enum TutorialType {
    case home
    case maingame
    case note
    case album
    case timeline
    case map
  }
  
  // MARK: @IBOutlet var
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet var pageView: UIPageControl!
  @IBOutlet var nextButton: UIButton!
  @IBOutlet var prevButton: UIButton!
  
  // MARK: Varibles
  
  var items: [TutorialStyle] = [] {
    didSet {
      pageView.numberOfPages = items.count
    }
  }
  
  var closeHandler: (() -> Void)?
  
  // MARK: Inintializer
  
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
    updateArrowButton()
    setupPageControl()
  }
  
  // MARK: Initialize Function
  
  private func commonInit() {
    setupXib()
    setupLayout()
    setupPageControl()
  }
  
  private func setupLayout() {
    setupCollectionView()
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
    pageView.currentPage = 0
    pageView.numberOfPages = items.count
  }
  
  private func setupCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.isPagingEnabled = true
  }
  
  // MARK: Function
  
  func updateArrowButton() {
    prevButton.isHidden = false
    nextButton.isHidden = false
    
    if pageView.currentPage == 0 {
      prevButton.isHidden = true
    }
    if pageView.currentPage == pageView.numberOfPages - 1 {
      nextButton.isHidden = true
    }
  }
  
  // MARK: @IBAction func
  
  @IBAction func touchPageControl(_ sender: Any) {
    collectionView.scrollToNextCell(toRow: pageView.currentPage, section: 0)
    updateArrowButton()
  }
  
  @IBAction func moveNext(_ sender: Any) {
    guard pageView.currentPage < items.count else { return }
    pageView.currentPage += 1
    collectionView.scrollToNextCell(toRow: pageView.currentPage, section: 0)
    updateArrowButton()
  }
  
  @IBAction func movePrev(_ sender: Any) {
    guard pageView.currentPage > 0 else { return }
    pageView.currentPage -= 1
    collectionView.scrollToNextCell(toRow: pageView.currentPage, section: 0)
    updateArrowButton()
  }
  
  @IBAction func back(_ sender: Any) {
    UIView.animate(withDuration: 0.2) { [weak self] in
      self?.alpha = 0
    } completion: { [weak self] _ in
      self?.removeFromSuperview()
      self?.closeHandler?()
    }
  }
  
  // MARK: Static Function
  
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
  
  static func showTutorial(inView: UIView, items: [TutorialStyle], type: TutorialView.TutorialType, closeHandler: @escaping (() -> Void)) {
    
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
    tutoView.closeHandler = closeHandler
    tutoView.alpha = 0
    inView.addSubview(tutoView)
    tutoView.pinToEdges(inView: inView)
    
    UIView.animate(withDuration: 0.2) {
      tutoView.alpha = 1
    }
  }
  
}

// MARK: UICollectionView Extension

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

// MARK: UICollectionView Extension


extension TutorialView : UIScrollViewDelegate {
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let page = Int(targetContentOffset.pointee.x / self.frame.width)
    pageView.currentPage = page
    updateArrowButton()
  }
}




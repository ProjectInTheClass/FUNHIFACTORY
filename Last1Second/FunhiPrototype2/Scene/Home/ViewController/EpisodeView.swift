//
//  EpisodeView.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/07/27.

import UIKit

// 위치 정리 필요
class EpisodeView: UIView {
  

  @IBOutlet weak var episodeYear: UILabel!
  @IBOutlet weak var episodePlace: UILabel!
  @IBOutlet weak var episodePlaceImage: UIImageView!
  @IBOutlet weak var leftBox: UIView!
  @IBOutlet weak var lockedView: UIView!
  @IBOutlet var progressBackgroundView: UIView!
  @IBOutlet var progressView: CircularProgressView!
  
  
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
    
  }
  
  private func setupStyle() {
    dropShadow()
    
  }
  
  private func dropShadow() {
    
  }
  

  
}

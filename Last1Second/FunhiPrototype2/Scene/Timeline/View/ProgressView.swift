//
//  ProgressView.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/14.
//

import UIKit

class ProgressView: UIView {
  
  @IBOutlet var background: UIView!
  
  var state: State  = .normal {
    didSet {
      updateStyle()
    }
  }
  
  func setState(index: Int) {
    switch index {
    case 0:
      state = .normal
    case 1:
      state = .way1
    case 2:
      state = .way2
    default:
      state = .normal
    }
  }
  enum State {
    case normal, way1, way2
  }
  
  @IBOutlet var circular: CircularProgressView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    setupStyle()
    setupXib()
    circular.createCircularPath()
  }
  
  private func setupStyle() {
    circular.progressNumberString.font = UIFont(name: "NanumSquareEB", size: 10)
    updateStyle()
  }
  
  private func setupProgressColor() {
    
    circular.trackColor = UIColor(red: 0.333, green: 0.429, blue: 0.529, alpha: 1)
    circular.progressColor = UIColor(red: 0.78, green: 0.89, blue: 1, alpha: 1)
    circular.centerCircleColor = UIColor(red: 0.521, green: 0.646, blue: 0.771, alpha: 1)
  }
  
  private func setupFinish() {
    circular.finishImageView.layer.cornerRadius = 3
    circular.finishImageView.setShadow(color: UIColor(red: 1, green: 1, blue: 1, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 5)
  }
  
  private func updateStyle() {
    switch state {
    case .normal:
      background.backgroundColor = .way0TrackColor
      circular.trackColor = .way0TrackColor
      circular.progressColor = .way0ProgressColor
      circular.centerCircleColor = .way0CircleColor
    case .way1:
      background.backgroundColor = .way1TrackColor
      circular.trackColor = .way1TrackColor
      circular.progressColor = .way1ProgressColor
      circular.centerCircleColor = .way1CircleColor
    case .way2:
      background.backgroundColor = .way2TrackColor
      circular.trackColor = .way2TrackColor
      circular.progressColor = .way2ProgressColor
      circular.centerCircleColor = .way2CircleColor
    }
  }
  
  private func setupXib() {
    if let view = Bundle.main.loadNibNamed("ProgressView", owner: self, options: nil)?.first as? UIView {
      addSubview(view)
      view.pinToEdges(inView: self)
    }
  }
}

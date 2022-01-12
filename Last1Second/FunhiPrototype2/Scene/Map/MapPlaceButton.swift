//
//  MapPlaceButton.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/24.
//

import UIKit

class MapButton: SoundButton {
  var index: Int?
}

class MapPlaceButton: UIView {
  
  @IBOutlet weak var place: UIImageView!
  @IBOutlet weak var button: MapButton!
  
  
  
  // 이 변수 값 VC에서 바꾸기.
  var isSelected: Bool = false {
    didSet {
      updateStyle()
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
    setupXib()
    setupLayout()
    setupStyle()
  }
  
  private func setupLayout() {
    button.titleLabel?.minimumScaleFactor = 0.3
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.layer.cornerRadius = 15
  }
  
  
  private func setupStyle() {
    backgroundColor = .clear
    updateStyle()
    
  }
  
  private func updateStyle() {
    if isSelected {
      button.setBolder(color: UIColor(red: 0.6, green: 0.704, blue: 0.797, alpha: 1), width: 2)
      button.setShadow(color: UIColor(red: 0.6, green: 0.704, blue: 0.797, alpha: 1), x: 0, y: 0, opacity: 1, radius: 16)
      button.setTitleColor(UIColor(red: 0.039, green: 0.22, blue: 0.357, alpha: 1), for: .normal)
      button.backgroundColor = UIColor(red: 0.791, green: 0.857, blue: 0.912, alpha: 1)
      place.isHidden = false
    } else {
      button.setBolder(color: UIColor(red: 0.348, green: 0.499, blue: 0.625, alpha: 1), width: 2)
      button.setShadow(color: UIColor(red: 0.478, green: 0.62, blue: 0.741, alpha: 1), x: 0, y: 0, opacity: 1, radius: 5)
      button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
      button.backgroundColor = UIColor(red: 0.268, green: 0.409, blue: 0.53, alpha: 1)
      place.isHidden = true
    }
    
  }
  
  private func setupXib() {
    if let view = Bundle.main.loadNibNamed("MapPlaceButton", owner: self, options: nil)?.first as? UIView {
      addSubview(view)
      view.pinToEdges(inView: self)
    }
  }
}

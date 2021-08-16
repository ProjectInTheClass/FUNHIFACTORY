//
//  FloatingButton.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/16.
//

import UIKit

class FloatingButton: UIButton {
 
  lazy var bangImage: UIImageView = {
    let icon = UIImageView(image: UIImage(named: "red notice icon")!)
    icon.translatesAutoresizingMaskIntoConstraints = false
    return icon
  }()
  
  private var normalImage = UIImage()
  private var newThingImage = UIImage()
  
  // 이 변수 값 VC에서 바꾸기.
  var isNormal: Bool = true {
    didSet {
      isNormal ? (style = .normal) : (style = .newThing)
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
    translatesAutoresizingMaskIntoConstraints = false
    addSubview(bangImage)
    bangImage.translatesAutoresizingMaskIntoConstraints = false
    bangImage.heightAnchor.constraint(equalToConstant: 19) .isActive = true
    bangImage.widthAnchor.constraint(equalToConstant: 11).isActive = true
    bangImage.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    bangImage.topAnchor.constraint(equalTo: topAnchor, constant: -3).isActive = true
  }
  
  private func setupStyle() {
    updateStyle()
    setTitle("", for: .normal)
  }
  
  private var style: State = .normal {
    didSet {
      updateStyle()
    }
  }
  
  // 이 함수 꼭 버튼 viewDidload할 때 넣을 것! 이미지 등록하는 함수.
  func setImages(nor: String, not: String) {
    normalImage = UIImage(named: nor)!
    newThingImage = UIImage(named: not)!
    updateStyle()
  }
  
  enum State {
    case normal, newThing
  }
  
  private func updateStyle() {
    switch style {
    case .normal:
      bangImage.isHidden = true
      setImage(normalImage, for: .normal)
    case .newThing:
      bangImage.isHidden = false
      setImage(newThingImage, for: .normal)
    }
  }
}

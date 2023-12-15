//
//  AlbumAlertView.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2023/12/15.
//

import UIKit

class AlbumAlertView: UIView {
  
  @IBOutlet var boxView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var descLabel: UILabel!
  
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
    setupStyle()
  }
  
  private func setupXib() {
    if let view = Bundle.main.loadNibNamed("AlbumAlertView", owner: self, options: nil)?.first as? UIView {
      insertSubview(view, at: 0)
      view.translatesAutoresizingMaskIntoConstraints = false
      view.pinToEdges(inView: self)
    }
  }
  
  private func setupStyle() {
    titleLabel.font = UIFont(name: "NanumSquareEB", size: 23)
    descLabel.setLineSpacing(6)
    boxView.layer.cornerRadius = 16
    boxView.setBolder(color: UIColor(red: 0.616, green: 0.71, blue: 0.796, alpha: 1), width: 4)
  }
  
  func configure(image: AlbumImage) {
    titleLabel.text = image.title
    imageView.image = UIImage(named: image.image)
    descLabel.text = image.description
    
    alpha = 1
    boxView.isHidden = false
    boxView.alpha = 0
    boxView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
   
    UIView.animate(withDuration: 0.2) {
      self.boxView.transform = CGAffineTransform(scaleX: 1, y: 1)
      self.boxView.alpha = 1
    }
  }
  
  @IBAction func closeTapped(_ sender: Any) {
    close()
  }
  
  private func close() {
    boxView.transform = CGAffineTransform(scaleX: 1, y: 1)
    
    UIView.animate(withDuration: 0.2) {
      self.boxView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
      self.boxView.alpha = 0
    } completion: { _ in
      UIView.animate(withDuration: 0.1) {
        self.alpha = 0
      } completion: { [weak self] _ in
        self?.removeFromSuperview()
      }
    }
  }
}

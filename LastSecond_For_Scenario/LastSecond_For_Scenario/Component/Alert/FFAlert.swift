////
////  FFAlert.swift
////  LastSecond_For_Scenario
////
////  Created by 최서연 on 2022/11/10.
////
//
//import UIKit
//
//let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//class FFAlert: UIView {
//  private static var instance = FFAlert()
//  private let nibName = "FFAlert"
//  var okHandler: (() -> Void)?
//  var cancelHandler: (() -> Void)?
//  
//  @IBOutlet var backView: UIView!
//  @IBOutlet weak var alertView: UIStackView!
//  
//  @IBOutlet weak var iconView: UIImageView!
//  @IBOutlet weak var titleLabel: UILabel!
//  @IBOutlet weak var descLabel: UILabel!
//  @IBOutlet weak var containerView: UIView!
//  
//  @IBOutlet weak var okBtn: UIButton!
//  @IBOutlet weak var cancelBtn: UIButton!
//  
//  required init?(coder aDecoder: NSCoder) {
//    super.init(coder: aDecoder)
//    xibSetUp()
//  }
//
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    xibSetUp()
//  }
//  
//  func xibSetUp() {
//    Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
//    backView.frame = UIScreen.main.bounds
//  }
//  
//  
//  convenience init(title: String? = nil, body: String? = nil, button: ButtonComposition, okHandler: (() -> Void)? = nil, cancelHandler: (() -> Void)? = nil, hideIcon: Bool = false, align: NSTextAlignment = .center) {
//    self.init(frame: .zero)
//    FFAlert.instance = self
//
//    titleLabel.textAlignment = align
//    titleLabel.text = title
//    descLabel.textAlignment = align
//    descLabel.text = body
//    titleLabel.isHidden = (title == nil)
//    descLabel.isHidden = (body == nil)
//    containerView.isHidden = true
//    
//    self.okHandler = okHandler
//    self.cancelHandler = cancelHandler
//    iconView.isHidden = hideIcon
//    
//    switch button {
//    case let .ok(title: title):
//      okBtn.setTitle(title, for: .normal)
//      cancelBtn.isHidden = true
//      okBtn.isHidden = false
//      
//    case let .cancel(title: title):
//      cancelBtn.setTitle(title, for: .normal)
//      cancelBtn.isHidden = false
//      okBtn.isHidden = true
//      
//    case let .both(ok: ok, cancel: cancel):
//      okBtn.setTitle(ok, for: .normal)
//      cancelBtn.setTitle(cancel, for: .normal)
//      cancelBtn.isHidden = false
//      okBtn.isHidden = false
//    }
//  }
//  
//  func show() {
//    appDelegate.window?.subviews.filter({ $0 == self.backView}).forEach({$0.removeFromSuperview()})
//
//    okBtn.addTarget(self, action: #selector(performOkHandler), for: .touchUpInside)
//    cancelBtn.addTarget(self, action: #selector(performCancelHandler), for: .touchUpInside)
//    
//    appDelegate.window?.addSubview(backView)
//  }
//
//  func hide() {
//    self.backView.removeFromSuperview()
//    Self.instance = FFAlert()
//  }
//
//  @objc func performOkHandler() {
//    hide()
//    okHandler?()
//  }
//
//  @objc func performCancelHandler() {
//    hide()
//    cancelHandler?()
//  }
//  
//  enum ButtonComposition {
//    case ok(title: String)
//    case cancel(title: String)
//    case both(ok: String, cancel: String)
//  }
//}

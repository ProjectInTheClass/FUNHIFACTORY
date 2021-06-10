//
//  CircularProgressView.swift
//  CircleProgressSAMPLE
//
//  Created by 최서연 on 2021/05/26.
//

import UIKit

class CircularProgressView: UIView {

    fileprivate var circleView = UIView()
    fileprivate var progressLayer = CAShapeLayer()
    fileprivate var trackLayer = CAShapeLayer()
    fileprivate var centerCircleLayer = CAShapeLayer()
    
    fileprivate var finishView = UIImageView()
    open var progressNumberString = UILabel()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createCircularPath()
    }
    
    var progressColor = UIColor.white {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    
    var trackColor = UIColor.white {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    
    var centerCircleColor = UIColor.white {
        didSet {
            centerCircleLayer.fillColor = centerCircleColor.cgColor
        }
    }
    
    var finishImage = String() {
        didSet {
            finishView.image = UIImage(named: finishImage)
        }
    }
    
    
    func checkProgressHidden() {
        progressLayer.strokeEnd == 1.0 ? (circleView.isHidden = true) : (circleView.isHidden = false)
        progressLayer.strokeEnd == 1.0 ? (finishView.isHidden = false) : (finishView.isHidden = true)
       
    }
    
    func updateProgressNumber() {
        progressNumberString.text = "\(Int(round(progressLayer.strokeEnd*100)))"
    }

    func updateProgressGage(value: CGFloat) {
        progressLayer.strokeEnd = value
    }
    
    func updateProgress(value: CGFloat) {
        updateProgressGage(value: value)
        checkProgressHidden()
        updateProgressNumber()
    }
    
    
    fileprivate func createCircularPath() {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.size.width/2
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
        
        centerCircleLayer.path = circlePath.cgPath
        centerCircleLayer.fillColor = centerCircleColor.cgColor
        centerCircleLayer.strokeColor = UIColor.clear.cgColor
        centerCircleLayer.lineWidth = 3.18
        centerCircleLayer.strokeEnd = 0.0
        circleView.layer.addSublayer(centerCircleLayer)
        
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = 3.18
        trackLayer.strokeEnd = 1.0
        circleView.layer.addSublayer(trackLayer)
        
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = 3.18
        progressLayer.strokeEnd = 0.0
        circleView.layer.addSublayer(progressLayer)
        
        self.addSubview(circleView)
        
        
        finishView.frame.size = CGSize(width: self.layer.frame.width*2, height: self.layer.frame.width)
        finishView.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        finishView.image = UIImage(named: finishImage)
        finishView.contentMode = .scaleAspectFit
        finishView.isHidden = true
        
        self.addSubview(finishView)
        
        circleView.addSubview(progressNumberString)
        let xConstraint = progressNumberString.centerXAnchor.constraint(equalTo: finishView.centerXAnchor)
        let yConstraint = progressNumberString.centerYAnchor.constraint(equalTo: finishView.centerYAnchor)
        xConstraint.isActive = true
        yConstraint.isActive = true
        
        
        progressNumberString.translatesAutoresizingMaskIntoConstraints = false
        progressNumberString.lineBreakMode = .byWordWrapping
        progressNumberString.text = "\(Int(round(progressLayer.strokeEnd*100)))"
        print ("\(Int(round(progressLayer.strokeEnd*100)))")
        progressNumberString.textColor = .black
        progressNumberString.font = UIFont(name: .init(), size: 15)
        
        
        
        
        
    }
}

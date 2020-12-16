//
//  ViewController.swift
//  animationPractice
//
//  Created by 최서연 on 2020/11/27.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var imageView: UIImageView!
  
    @IBOutlet weak var label: UIImageView!
    
    
    let images = ["coverImage1", "coverImage2", "coverImage3", "coverImage4"]
    var index = 0
    var buttonIsOn = false {
        didSet {
            rain()
            rotateButton()
//            if buttonIsOn {
//                rotateButton()
//            } else {
//                button.layer.removeAllAnimations()
//            }
        }
    }
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
}
    
    @IBAction func buttonTouched(_ sender: Any) {
        buttonIsOn = !buttonIsOn
        
    }
    
    func rain() {
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true)
            { [self](timer) in
            
            if buttonIsOn {
                imageView.image = UIImage(named: images[index])
                if index > 2 {
                    index = 0
                } else {
                    index += 1
                }
            } else {
                timer.invalidate()
            }
        }
    }
    
    func rotateButton() {
        if buttonIsOn {
            UIImageView.animate(withDuration: 0.8, delay: 0.5, options: [.repeat], animations: {[self]  in
                label.transform = CGAffineTransform(rotationAngle: .pi)

            }, completion: nil)
        } else {
            label.layer.removeAnimation(forKey: "")
        }
      
        
    }
    
    func light() {
        if buttonIsOn {
            UIImageView.animate(withDuration: 0.8, delay: 0.5, options: [.repeat, .autoreverse], animations: {[self]  in
                imageView.alpha = 0

            }, completion: nil)
        } else {
            label.layer.removeAllAnimations()
        }
    }
}

//
//  CoverViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/27.
//

import UIKit

class CoverViewController: UIViewController {

    
     @IBOutlet weak var imageView: UIImageView!
   
     @IBOutlet weak var arrow: UIImageView!
     
     
     let images = ["coverImage1", "coverImage2", "coverImage3", "coverImage4"]
     var index = 0
     var buttonIsOn = false {
         didSet {
            rain()
            rotateButton()
            light()
         }
     }
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rain()
       rotateButton()
        light()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goToNextView(_ sender: Any) {
        buttonIsOn = !buttonIsOn
        performSegue(withIdentifier: "goToHomeSegue", sender: nil)
    }
    
    func rain() {
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true)
            { [self](timer) in
            
            if !buttonIsOn {
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
        if !buttonIsOn {
            UIImageView.animate(withDuration: 0.8, delay: 0.5, options: [.repeat], animations: {[self]  in
                arrow.transform = CGAffineTransform(rotationAngle: .pi)

            }, completion: nil)
        } else {
            arrow.layer.removeAnimation(forKey: "")
        }
      
        
    }
    
    func light() {
        if !buttonIsOn {
            UIImageView.animate(withDuration: 0.4, delay: 0.5, options: [.repeat, .autoreverse], animations: {[self]  in
                arrow.alpha = 0.3

            }, completion: nil)
        } else {
            arrow.layer.removeAllAnimations()
        }
    }
}

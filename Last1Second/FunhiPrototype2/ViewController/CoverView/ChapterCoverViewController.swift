//
//  ChapterCoverViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/07.
//

import UIKit

class ChapterCoverViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var chapterNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var sandGlassImageView: UIImageView!
    @IBOutlet weak var closeCoverButton: UIButton!
    @IBOutlet weak var tapAndContinueLabel: UILabel!
    @IBAction func closeCoverButtonAction(_ sender: Any) {
        self.buttonIsOn = true
        blackView.bounds = self.view.bounds
        blackView.center = self.view.center
        blackView.alpha = 0
        self.view.addSubview(blackView)
        UIView.animate(withDuration: 1.0) {
            self.blackView.alpha = 1
        } completion: { (Bool) in
            let dataToSend = true
            self.blackView.removeFromSuperview()
            self.performSegue(withIdentifier: "goToMainGameSegue", sender: dataToSend)
        }

        
       
    }
    
    func designView() {
        yearLabel.font = UIFont(name: "NEXONLv2GothicBold", size: 20)
        chapterNameLabel.font = UIFont(name: "NanumSquareEB", size: 40)
        descriptionLabel.font = UIFont(name: "NanumSquareR", size: 20)
        descriptionLabel.setLineSpacing(lineSpacing: 10)
        descriptionLabel.textAlignment = .center
        tapAndContinueLabel.setCharacterSpacing(characterSpacing: 5)
        tapAndContinueLabel.font = UIFont(name: "NanumSquareR", size: 15)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMainGameSegue" {
            let destination = segue.destination as! mainGameViewController
            if let EPStartTrue = sender as? Bool {
                destination.isStartOfEpisode = EPStartTrue
            }
        }
    }
    @IBOutlet var blackView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        designView() 
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        animateCover()
    }
    func animateCover() {
        backgroundImageView.image = UIImage(named: currentDay().episodeCoverImage)
        yearLabel.text = "\(currentDay().episodeYear)년"
        chapterNameLabel.text = currentDay().episodePlace
        descriptionLabel.text = currentDay().episodeDesciption
        closeCoverButton.isHidden = true
        
        yearLabel.alpha = 0
        chapterNameLabel.alpha = 0
        descriptionLabel.alpha = 0
        sandGlassImageView.isHidden = true
        tapAndContinueLabel.isHidden = true
        
        buttonIsOn = false
      
        UIView.animate(withDuration: 1.0, delay: 0.3) {
            self.yearLabel.alpha = 1
        } completion: { (true) in
            UIView.animate(withDuration: 1.0, delay: 0.3) {
                self.chapterNameLabel.alpha = 1
            } completion: { (Bool) in
                UIView.animate(withDuration: 1.0, delay: 0.3) {
                    self.descriptionLabel.alpha = 1
                } completion: { (Bool) in
                    self.sandGlassImageView.isHidden = false
                    UIView.animate(withDuration: 1.0) {
                        
                        self.chapterNameLabel.alpha = 1
                    } completion: { (Bool) in
                        self.tapAndContinueLabel.isHidden = false
                        self.closeCoverButton.isHidden = false
                        UIView.animate(withDuration: 1.0) {
                            
                            
                        }
                    }
                }
            }
        }
    }
    
    var buttonIsOn = Bool() {
        didSet {
          // rotateButton()
           light()
        }
    }
    func rotateButton() {
        if !buttonIsOn {
            UIImageView.animate(withDuration: 0.8, delay: 0.5, options: [.repeat], animations: {[self]  in
                sandGlassImageView.transform = CGAffineTransform(rotationAngle: .pi)

            }, completion: nil)
        } else {
            sandGlassImageView.layer.removeAnimation(forKey: "")
        }
      
        
    }
    
    func light() {
        if !buttonIsOn {
            UIImageView.animate(withDuration: 0.6, delay: 0, options: [.repeat, .autoreverse], animations: {[self]  in
                sandGlassImageView.alpha = 0.3
                tapAndContinueLabel.alpha = 0.3

            }, completion: nil)
        } else {
            sandGlassImageView.layer.removeAllAnimations()
            tapAndContinueLabel.layer.removeAllAnimations()
        }
    }

    
}

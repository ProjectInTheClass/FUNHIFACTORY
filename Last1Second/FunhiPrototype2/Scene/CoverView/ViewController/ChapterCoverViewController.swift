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
  
  @IBOutlet var tapStackView: UIStackView!
  @IBOutlet weak var sandGlassImageView: UIImageView!
  @IBOutlet weak var closeCoverButton: SoundButton!
  @IBOutlet weak var tapAndContinueLabel: UILabel!
  @IBOutlet var blackView: UIView!
  
  var buttonIsOn = Bool() {
    didSet { light() }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    designView()
    
    self.tapStackView.isHidden = false
    self.closeCoverButton.isHidden = false
  }
  
  override func viewWillAppear(_ animated: Bool) {
//    animateCover()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToMainGameSegue" {
      let destination = segue.destination as! MainGameViewController
      if let EPStartTrue = sender as? Bool {
        destination.isShowBlackView = EPStartTrue
      }
    }
  }
  
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
  
  private func designView() {
    descriptionLabel.setLineSpacing(10)
    descriptionLabel.textAlignment = .center
    tapAndContinueLabel.setCharacterSpacing(5)
  }
  
  private func animateCover() {
    backgroundImageView.image = UIImage(named: currentEpisode().episodeCoverImage)
    yearLabel.text = "\(currentEpisode().episodeYear)년"
    chapterNameLabel.text = currentEpisode().episodePlace
    descriptionLabel.text = currentEpisode().episodeDesciption
    closeCoverButton.isHidden = true
    
    player.currentEpisodes[strToIndex(str: player.dayId)].isStarted = true
    yearLabel.alpha = 0
    chapterNameLabel.alpha = 0
    descriptionLabel.alpha = 0
    tapStackView.isHidden = true
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
            self.tapStackView.isHidden = false
            self.closeCoverButton.isHidden = false
            UIView.animate(withDuration: 0.1) {
            }
          }
        }
      }
    }
  }
 
  private func rotateButton() {
    if !buttonIsOn {
      UIImageView.animate(withDuration: 0.8, delay: 0.5, options: [.repeat], animations: { [weak self] in
        self?.sandGlassImageView.transform = CGAffineTransform(rotationAngle: .pi)
      }, completion: nil)
    } else {
      sandGlassImageView.layer.removeAnimation(forKey: "")
    }
  }
  
  private func light() {
    if !buttonIsOn {
      UIImageView.animate(withDuration: 0.6, delay: 0, options: [.repeat, .autoreverse], animations: { [weak self] in
        self?.sandGlassImageView.alpha = 0.3
        self?.tapAndContinueLabel.alpha = 0.3
      }, completion: nil)
    }
  }
}

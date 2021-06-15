//
//  HomeViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/06/07.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var episodeYearLabel: UILabel!
    @IBOutlet var episodeNameLabel: UILabel!
    @IBOutlet var episodeDescriptionLabel: UILabel!
    
    @IBOutlet var startGameButtonView: UIView!
    @IBOutlet var selectNewEPButtonView: UIView!
    
    @IBOutlet var buttonViews: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        player.dayId = prologueChapter.episodeID
        episodeYearLabel.text = "\(currentEpisode().episodeYear)년"
        episodeNameLabel.text = currentEpisode().episodePlace
        episodeDescriptionLabel.text = currentEpisode().episodeDesciption
        episodeDescriptionLabel.setLineSpacing(lineSpacing: 16)
        episodeDescriptionLabel.textAlignment = .center
        
        
        
        startGameButtonView.layer.cornerRadius = startGameButtonView.frame.height/2
        selectNewEPButtonView.layer.cornerRadius = selectNewEPButtonView.frame.height/2
        startGameButtonView.setShadow(color: UIColor(red: 0.784, green: 0.871, blue: 0.941, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 10)
        selectNewEPButtonView.setShadow(color: UIColor(red: 0.592, green: 0.706, blue: 0.82, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 10)
        
        for view in buttonViews {
            view.layer.borderWidth = 3
            view.layer.borderColor = UIColor(red: 0.524, green: 0.646, blue: 0.75, alpha: 1).cgColor
            view.layer.backgroundColor = UIColor.white.cgColor
        }
        
        
        
        
    }
    
    @IBAction func noteButtonAction(_ sender: Any) {
        pushMenuViewsAnimation()
    }
    @IBAction func albumButtonAction(_ sender: Any) {
        pushMenuViewsAnimation()
    }
    @IBAction func timelineButtonAction(_ sender: Any) {
        pushMenuViewsAnimation()
    }
    @IBAction func settingButtonAction(_ sender: Any) {
        pushMenuViewsAnimation()
    }
    
    func pushMenuViewsAnimation() {
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
        let transition:CATransition = CATransition()
          transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        transition.type = CATransitionType.moveIn
          transition.subtype = CATransitionSubtype.fromBottom
          self.navigationController!.view.layer.add(transition, forKey: kCATransition)
    }
}

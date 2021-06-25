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
        
        episodeYearLabel.text = "\(currentEpisode().episodeYear)년"
        episodeNameLabel.text = currentEpisode().episodePlace
        episodeDescriptionLabel.text = currentEpisode().episodeDesciption
        episodeDescriptionLabel.setLineSpacing(lineSpacing: 10
        )
        episodeDescriptionLabel.textAlignment = .center
        
      //  startGameButtonView.layer.cornerRadius = startGameButtonView.frame.height/2
      //  selectNewEPButtonView.layer.cornerRadius = selectNewEPButtonView.frame.height/2
        startGameButtonView.setShadow(color: UIColor(red: 0.784, green: 0.871, blue: 0.941, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 10)
        selectNewEPButtonView.setShadow(color: UIColor(red: 0.592, green: 0.706, blue: 0.82, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 10)
        
        for view in buttonViews {
            view.setBolder(color: UIColor(red: 0.524, green: 0.646, blue: 0.75, alpha: 1), width: 3)
            view.layer.backgroundColor = UIColor.white.cgColor
        }
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        startGameButtonView.layer.cornerRadius = startGameButtonView.frame.size.height/CGFloat(2.0)
        selectNewEPButtonView.layer.cornerRadius = selectNewEPButtonView.frame.height/2
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
//        pushMenuViewsAnimation()
        guard let settingVC = storyboard?.instantiateViewController(identifier: "settings") else {return}
        settingVC.modalPresentationStyle = .fullScreen
        present(settingVC, animated: true, completion: nil)
    }
    
    @IBAction func goToMainGameButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goToMainGameSegue", sender: nil)
    }
    
    @IBAction func goToSelectStageButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goToSelectNewStageSegue", sender: nil)
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

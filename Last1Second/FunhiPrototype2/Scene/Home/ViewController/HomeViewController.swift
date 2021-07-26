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
        
        designObjects()
        
    }
    
    func designObjects() {
        startGameButtonView.setShadow(color: UIColor(red: 0.784, green: 0.871, blue: 0.941, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 10)
        selectNewEPButtonView.setShadow(color: UIColor(red: 0.592, green: 0.706, blue: 0.82, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 10)
        
        for view in buttonViews {
            view.setBolder(color: UIColor(red: 0.524, green: 0.646, blue: 0.75, alpha: 1), width: 3)
            view.layer.backgroundColor = UIColor.white.cgColor
        }
        //-----팝업------------
        alertPopupView.bounds = self.view.bounds
        alertPopupView.center = self.view.center
        alertPopupBoxView.setBolder(color: UIColor(red:0.647, green: 0.737, blue: 0.812, alpha: 1), width: 6)
        alertPopupLabel.text = "아직 다른 사건들을 열 수 없습니다.\n프롤로그를 먼저 해결해주세요."
        alertPopupLabel.setLineSpacing(lineSpacing: 6)
        alertPopupLabel.textAlignment = .center
        
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
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    
    @IBAction func goToMainGameButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goToMainGameSegue", sender: nil)
    }
    
    @IBAction func goToSelectStageButtonAction(_ sender: Any) {
        
        player.currentEpisodes[0].isCleared ?
            performSegue(withIdentifier: "goToSelectNewStageSegue", sender: nil) : openAlertPopup()
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
    //---------------새로운 사건 보기 팝업쓰----------------
    @IBOutlet var alertPopupView: UIView!
    @IBOutlet var alertPopupBoxView: UIView!
    @IBOutlet var alertPopupLabel: UILabel!
    @IBAction func alertPopupExitButtonAction(_ sender: Any) {
        alertPopupView.removeFromSuperview()
    }
    
    func openAlertPopup() {
        self.view.addSubview(alertPopupView)
    }
}

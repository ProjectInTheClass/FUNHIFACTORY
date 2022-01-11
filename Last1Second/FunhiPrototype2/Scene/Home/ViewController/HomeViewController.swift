//
//  HomeViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/06/07.
//

import UIKit

class HomeViewController: UIViewController {

  lazy var blackView: UIView = {
    let view = UIView()
    view.backgroundColor = .black
    view.center = self.view.center
    view.bounds = self.view.bounds
    return view
  }()
  
  var isShowBlackView: Bool = false
  
  @IBOutlet var episodeYearLabel: UILabel!
  @IBOutlet var episodeNameLabel: UILabel!
  @IBOutlet var episodeDescriptionLabel: UILabel!
  @IBOutlet var startGameButtonView: UIView!
  @IBOutlet var selectNewEPButtonView: UIView!
  @IBOutlet weak var note: FloatingButton!
  @IBOutlet weak var album: FloatingButton!
  @IBOutlet weak var timeline: FloatingButton!
  @IBOutlet weak var setting: FloatingButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    episodeYearLabel.text = "\(currentEpisode().episodeYear)년"
    episodeNameLabel.text = currentEpisode().episodePlace
    episodeDescriptionLabel.text = currentEpisode().episodeDesciption
    episodeDescriptionLabel.setLineSpacing(10)
    episodeDescriptionLabel.textAlignment = .center
    designObjects()
    setupButtons()
    setupTutorial()
  }
    
  override func viewWillAppear(_ animated: Bool) {
    updateButtons()
    if isShowBlackView {
      fadeOut()
    }
  }

  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    startGameButtonView.layer.cornerRadius = startGameButtonView.frame.size.height/CGFloat(2.0)
    selectNewEPButtonView.layer.cornerRadius = selectNewEPButtonView.frame.height/2
  }

  @IBAction func goToNote(_ sender: Any) {
    pushMenuViewsAnimation()
  }
  
  @IBAction func goToAlbum(_ sender: Any) {
    pushMenuViewsAnimation()
  }
  
  @IBAction func goToTimeline(_ sender: Any) {
    pushMenuViewsAnimation()
  }
  
  @IBAction func goToSetting(_ sender: Any) {
//        pushMenuViewsAnimation()
    guard let settingVC = storyboard?.instantiateViewController(identifier: "settings") else {return}
    settingVC.modalPresentationStyle = .fullScreen
    present(settingVC, animated: true, completion: nil)

  }
  
  @IBAction func goToMainGame(_ sender: Any) {
    fadeIn(segue: "goToMainGameSegue")
  }
  
  @IBAction func goToSelectStage(_ sender: Any) {
      
    player.currentEpisodes[0].isCleared ?
          performSegue(withIdentifier: "goToSelectNewStageSegue", sender: nil) : openAlertPopup()
  }
  
  private func setupButtons() {
    note.setImages(nor: "NoteNormal", not: "NoteHighlighted")
    album.setImages(nor: "AlbumNormal", not: "AlbumHighlighted")
    timeline.setImages(nor: "TimelineNormal", not: "TimelineNormal")
    setting.setImages(nor: "SettingNormal", not: "SettingNormal")
  }

  private func updateButtons() {
    readAllNotes ? (note.isNormal = true) : (note.isNormal = false)
    readAllAlbums ? (album.isNormal = true) : (album.isNormal = false)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToMainGameSegue" {
      let destination = segue.destination as! MainGameViewController
      destination.isShowBlackView = true
    }
    if segue.identifier == "GoToTimeline" {
      let destination = segue.destination as! TimeLineViewController
      destination.backButtonState = .x
    }
  }
  
  func designObjects() {
    startGameButtonView.setShadow(color: UIColor(red: 0.784, green: 0.871, blue: 0.941, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 10)
    selectNewEPButtonView.setShadow(color: UIColor(red: 0.592, green: 0.706, blue: 0.82, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 10)
    //-----팝업------------
    alertPopupView.bounds = self.view.bounds
    alertPopupView.center = self.view.center
    
    alertPopupLabel.text = "아직 다른 사건들을 열 수 없습니다.\n프롤로그를 먼저 해결해주세요."
    alertPopupLabel.setLineSpacing(6)
    alertPopupLabel.textAlignment = .center
  }

  func pushMenuViewsAnimation() {
    
    let transition:CATransition = CATransition()
    transition.duration = 0.3
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
    transition.type = CATransitionType.moveIn
    transition.subtype = CATransitionSubtype.fromBottom
    self.navigationController!.view.layer.add(transition, forKey: kCATransition)
  }

      //---------------새로운 사건 보기 팝업쓰----------------
      @IBOutlet var alertPopupView: UIView!
      @IBOutlet var alertPopupLabel: UILabel!
  
      @IBAction func alertPopupExitButtonAction(_ sender: Any) {
          alertPopupView.removeFromSuperview()
      }
      
      func openAlertPopup() {
          self.view.addSubview(alertPopupView)
      }
  
  private func fadeOut() {
    isShowBlackView = false
    blackView.bounds = self.view.bounds
    blackView.center = self.view.center
    self.view.addSubview(blackView)
    blackView.alpha = 1
    
    UIView.animate(withDuration: 1.0) {
        self.blackView.alpha = 0
    } completion: { (Bool) in
        self.blackView.removeFromSuperview()
    }
  }
  
  private func fadeIn(segue: String) {
    isShowBlackView = false
    blackView.bounds = self.view.bounds
    blackView.center = self.view.center
    self.view.addSubview(blackView)
    blackView.alpha = 0
    
    UIView.animate(withDuration: 1.0) {
        self.blackView.alpha = 1
    } completion: { (Bool) in
        self.blackView.removeFromSuperview()
      self.performSegue(withIdentifier: segue, sender: nil)
    }
  }
  
  @IBAction func test(_ sender: Any) {
    self.view.showTutorial(items: sampleData)
  }
}

extension HomeViewController {
  func setupTutorial() {
    let items: [TutorialStyle] = [
      .singleFillImage(image: "home_11", desc: "현재 플레이하고 있는 스토리를 이어서 할 수 있습니다."),
      .singleFillImage(image: "home_22", desc: "현재 플레이하고 있는 스토리 외에 다른 사건들을 볼 수 있습니다."),
      .singleImage(image: "home_33", desc: "게임을 플레이하면서 얻은 정보들을 메뉴에서 찾아볼 수 있습니다.")
    ]
    
    TutorialView.showTutorial(inView: view, items: items, type: .home)
  }
}

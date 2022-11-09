//
//  HomeNewSelecteStageViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/06/07.
//

import UIKit

var previousEpisodeID: String?

class HomeNewSelecteStageViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
  
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return player.currentEpisodes.count - 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let selectedStageIndex = indexPath.row + 1
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "selectStageTableViewCell", for: indexPath) as! SelectStageTableViewCell
    cell.episodePlace.text = player.currentEpisodes[selectedStageIndex].episodePlace
    cell.episodeYear.text = "\(player.currentEpisodes[selectedStageIndex].episodeYear)년"
    cell.episodePlaceImage.image = UIImage(named: player.currentEpisodes[selectedStageIndex].episodePlaceImage)
    cell.progressView.updateStateColor(subView: cell.progressBackgroundView)
    // 완료/미완료한 체크박스 이미지 이름 : trueClear / falseClear
    
    
    // 엔딩 잠금
    if player.currentEpisodes[selectedStageIndex].episodeID == "ending" {
      cell.lockedView.isHidden = checkEndingOpenTiming(playerEpisodes: player.currentEpisodes)
    } else {
      cell.lockedView.isHidden = true
    }
    if selectedRowIndex != nil && selectedRowIndex == selectedStageIndex {
      cell.cellBackground.backgroundColor = .darkGray
    }else{
      
    }
    
    
    
    //현재 스토리블럭 인덱스 int로 변환 잘 되었다면
    if let currentStoryBlockIndex = Int(player.currentEpisodes[selectedStageIndex].currentStoryBlockIndex) {
      print("currentStoryBlockIndex: \(currentStoryBlockIndex)")
      
      let currentEpisodeTotalStoryBlockCount = player.currentEpisodes[selectedStageIndex].storyBlocks.count
      
      let progressValue: Double
      player.currentEpisodes[selectedStageIndex].isCleared ? (progressValue = 1.0) : (progressValue = (Double(currentStoryBlockIndex)/Double(currentEpisodeTotalStoryBlockCount)))
      //에피소드 스토리 블럭 안 비어있다면
      if currentEpisodeTotalStoryBlockCount != 0 {
        //프로그레스원 값 업뎃하기
        print("currentStoryBlockIndex/currentEpisodeTotalStoryBlockCount: \(Double(currentStoryBlockIndex)/Double(currentEpisodeTotalStoryBlockCount))")
        cell.progressView.updateProgress(value: CGFloat(progressValue))
        progressValue == 1.0 ? (cell.progressBackgroundView.isHidden = true) : (cell.progressBackgroundView.isHidden = false)
        
      } else {
        cell.progressView.updateProgress(value: CGFloat(0))
      }
      
    } else {
      cell.progressView.updateProgress(value: CGFloat(0))
    }
    cell.selectionStyle = .none
    return cell
  }
  
  
  var selectedRowIndex: Int?
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    playEffectSound(.buttonClick, type: .mp3)
    let selectedStageIndex = indexPath.row + 1
    
    let dataToSend: Episode
    dataToSend = player.currentEpisodes[selectedStageIndex]
    player.dayIndex = selectedStageIndex
    let epID = dataToSend.episodeID
    
    if epID == "ending" {
      openLockedPopup(isEpiloguePopup: true)
    }
    else if epID == "1592" || epID == "1803" || epID == "1918"{
      openLockedPopup(isEpiloguePopup: false)
    }
    else {
      openStagePopup(indexPath: indexPath)
    }
  }
  
  
  @IBOutlet var selectStageTableView: UITableView!
  
  @IBAction func backButtonAction(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    selectStageTableView.delegate = self
    selectStageTableView.dataSource = self
    
    designPopup()
    
    
    // Do any additional setup after loading the view.
  }
  
  
  //-----------------팝업창 코드-------------------
  @IBOutlet weak var selectedPopupBox: UIView!
  @IBOutlet var selectedPopup: UIView!
  
  @IBOutlet weak var selectedPopupYearLabel: UILabel!
  @IBOutlet weak var selectedPopupTopbar: UIView!
  @IBOutlet weak var selectedPopupPlaceImage: UIImageView!
  @IBOutlet weak var selectedPopupDescriptionLabel: UILabel!
  @IBOutlet weak var selectedPopupStartButtonOutlet: SoundButton!
  @IBOutlet weak var selectedPopupSupTitleLabel: UILabel!
  
  @IBAction func selectedPopupStartButton(_ sender: Any) {
    
    updateCurrentEpisode()
    performSegue(withIdentifier: "goToChapterCoverSegue", sender: nil)
    
  }
  
  func updateCurrentEpisode() {
    previousEpisodeID = player.dayId
    player.dayId = selectedEP.episodeID
    player.indexNumber = 0
    
    if player.currentEpisodes[strToIndex(str: player.dayId)].isCleared {
      player.currentEpisodes[strToIndex(str: player.dayId)].isCleared = false
      player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex = "001"
    }
    player.currentEpisodes[strToIndex(str: selectedEP.episodeID)].isStarted = true
  }
  
  @IBAction func selectedPopupExitButton(_ sender: Any) {
    selectedPopup.removeFromSuperview()
  }
  
  func updatePopup(indexPath: IndexPath) {
    let selectedStageIndex = indexPath.row + 1
    selectedPopupYearLabel.text = "\(player.currentEpisodes[selectedStageIndex].episodeYear)년"
  }
  func designPopup() {
    
    selectedPopupDescriptionLabel.font = UIFont(name: "NanumSquareB", size: 16)
    selectedPopupDescriptionLabel.setLineSpacing(6)
    selectedPopupDescriptionLabel.textAlignment = .center
    
    selectedPopupBox.layer.borderWidth = 4
    selectedPopupBox.layer.borderColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1).cgColor
    selectedPopup.bounds = self.view.bounds
    selectedPopup.center = self.view.center
    
    
    selectedPopupTopbar.layer.cornerRadius = 10
    selectedPopupTopbar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    
    
    lockedPopupLabel.setLineSpacing(6)
    lockedPopupLabel.textAlignment = .center
    
    
    
    lockedPopupLabel.setLineSpacing(6)
    lockedPopupLabel.textAlignment = .center
  }
  
  //초기화 시키느라 이래 됨
  var selectedEP = Episode()
  
  func openStagePopup(indexPath: IndexPath) {
    let selectedStageIndex = indexPath.row + 1
    selectedEP = player.currentEpisodes[selectedStageIndex]
    //print(selectedEP)
    selectedPopupYearLabel.text = "\(selectedEP.episodeYear)년"
    selectedPopupPlaceImage.image = UIImage(named: selectedEP.episodePlaceImage)
    selectedPopupDescriptionLabel.text = selectedEP.episodeShortDesciption
    selectedPopupSupTitleLabel.text = "\(selectedEP.episodeKingYear),\(selectedEP.episodePlace)"
    
    selectedPopupStartButtonOutlet.setTitle("여기서 시작하기", for: .normal)
    selectedPopupStartButtonOutlet.isEnabled = true
    
    
    if player.currentEpisodes[selectedStageIndex].storyBlocks.isEmpty {
      selectedPopupStartButtonOutlet.isEnabled = false
      selectedPopupStartButtonOutlet.setTitle("준비 중입니다.", for: .normal)
    }
    self.view.addSubview(selectedPopup)
  }
  
  
  //-----------에피 잠김 알림 팝업 -------------
  
  
  @IBOutlet var lockedPopup: UIView!
  @IBOutlet weak var lockedPopupImageView: UIImageView!
  @IBOutlet var lockedPopupLabel: UILabel!
  @IBOutlet var lockedPopupOkayButton: SoundButton!
  @IBAction func lockedPopupOkayButtonTouched(_ sender: Any) {
    lockedPopup.removeFromSuperview()
  }
  
  
  
  
  func openLockedPopup(isEpiloguePopup: Bool) {
    lockedPopup.center = self.view.center
    lockedPopup.bounds = self.view.bounds
    self.view.addSubview(lockedPopup)
    let popupText: String
    switch isEpiloguePopup {
    case true:
      popupText = "이 에피소드는 모든 사건을 해결한 후에 진행할 수 있습니다."
    case false:
      popupText = "안녕하세요! [마지막 1초] 개발팀입니다.\n저희 게임을 즐겨주셔서 정말 감사합니다. 그리고 스토리 업데이트가 늦어지는 점 진심으로 죄송합니다.\n\n[마지막 1초]는 예산 등의 문제로 이후 제작이 중단되었으나, 다행스럽게도 최근에 다시 제작할 수 있는 기회를 얻었습니다. 저희 개발팀은 18-19세 청소년 시기부터 시작하여 20-21세의 사회 초년생이 되었습니다. 현재 각자의 필드에서 활동하고 있어 내년 초까지 스토리 업데이트하는 것을 목표로 두고 작업하고 있습니다.\n\n다른 스토리를 플레이하고 싶어도 하실 수 없는 상황, 저희도 충분히 인지하고 있으며 조금만 기다려주시면 저희가 최대한 빠른 시일 내에 다시 찾아뵐 수 있도록 노력하겠습니다.감사합니다."
    }
    
    lockedPopupLabel.text = popupText
  }
  
  func checkEndingOpenTiming(playerEpisodes: [Episode]) -> Bool {
    var endingOpen: Bool = true
    // 만약 에피소드 중 한 개라도 클리어 안 되어있으면 엔딩열림여부 false 될 것임
    for ep in playerEpisodes {
      if ep.episodeID != "ending" && !ep.isCleared {
        endingOpen = false
      }
    }
    return endingOpen
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
}


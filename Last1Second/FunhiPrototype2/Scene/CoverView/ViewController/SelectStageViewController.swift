//
//  SelectStageViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/29.
//

import UIKit

class SelectStageTableViewCell: UITableViewCell {
  @IBOutlet weak var cellBackground: UIView!
  @IBOutlet weak var episodeYear: UILabel!
  @IBOutlet weak var episodePlace: UILabel!
  @IBOutlet weak var episodePlaceImage: UIImageView!
  @IBOutlet weak var leftBox: UIView!
  @IBOutlet weak var lockedView: UIView!
  @IBOutlet var progressBackgroundView: UIView!
  @IBOutlet var progressView: CircularProgressView!

  override func awakeFromNib() {
    super.awakeFromNib()
    designButton()
  }
  
  private func designButton() {
    lockedView.layer.cornerRadius = 12
    leftBox.layer.cornerRadius = 8
    leftBox.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
    cellBackground.layer.cornerRadius = 8
     
    progressView.trackColor = UIColor(red: 0.333, green: 0.429, blue: 0.529, alpha: 1)
    progressView.progressColor = UIColor(red: 0.78, green: 0.89, blue: 1, alpha: 1)
    progressView.centerCircleColor = UIColor(red: 0.521, green: 0.646, blue: 0.771, alpha: 1)
    
    progressView.finishImageView.layer.cornerRadius = 3
    progressView.finishImageView.setShadow(color: UIColor(red: 1, green: 1, blue: 1, alpha: 1), x: 0, y: 0, opacity: 1, radius: 5)
    progressView.progressNumberString.font = UIFont(name: "NanumSquareEB", size: 10)
    
    progressBackgroundView.setShadow(color: UIColor(red: 0.325, green: 0.455, blue: 0.584, alpha: 1), x: 0, y: 0, opacity: 1, radius: 4)
    selectionStyle = .none
  }
  
  func configure(selectedStageIndex index: Int, selectedRowIndex rowIndex: Int?) {
    let player = player
    let place = player.currentEpisodes[index].episodePlace
    let year = "\(player.currentEpisodes[index].episodeYear)년"
    let placeImageName = player.currentEpisodes[index].episodePlaceImage
    let isEnding = player.currentEpisodes[index].episodeID == "ending"
    let isEndingOpen = EpisodeService.isEdingOpen()
    
    episodePlace.text = place
    episodeYear.text = year
    episodePlaceImage.image = UIImage(named: placeImageName)
    progressView.updateStateColor(subView: progressBackgroundView)
   
    if isEnding {
      lockedView.isHidden = isEndingOpen
    } else {
      lockedView.isHidden = true
    }
    
    if let rowIndex = rowIndex, rowIndex == index {
      cellBackground.backgroundColor = .darkGray
    }
  }
}
  
class SelectStageViewController: UIViewController {
  @IBOutlet weak var selectedPopupBox: UIView!
  @IBOutlet var selectedPopup: UIView!
  @IBOutlet weak var selectedPopupYearLabel: UILabel!
  @IBOutlet weak var selectedPopupTopbar: UIView!
  @IBOutlet weak var selectedPopupPlaceImage: UIImageView!
  @IBOutlet weak var selectedPopupDescriptionLabel: UILabel!
  @IBOutlet weak var selectedPopupStartButtonOutlet: SoundButton!
  @IBOutlet weak var selectedPopupSupTitleLabel: UILabel!
  @IBOutlet weak var selectStageTableView: UITableView!

  @IBOutlet var lockedPopup: UIView!
  @IBOutlet weak var lockedPopupBox: UIView!
  @IBOutlet weak var lockedPopupImageView: UIImageView!
  @IBOutlet var lockedPopupLabel: UILabel!
  @IBOutlet var lockedPopupOkayButton: SoundButton!
  
  var selectedRowIndex: Int?
  
  var selectedEP = Episode()
  
  @IBAction func thirdPopupOkayButtonTouched(_ sender: Any) {
    closeLockedPopup()
  }
  
  @IBAction func selectedPopupStartButton(_ sender: Any) {
    updateCurrentEpisode()
    performSegue(withIdentifier: "goToChapterCoverSegue", sender: nil)
  }
  
  @IBAction func selectedPopupExitButton(_ sender: Any) {
    selectedPopup.removeFromSuperview()
  }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    selectStageTableView.delegate = self
    selectStageTableView.dataSource = self
    designPopup()
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
    selectedPopup.bounds = view.bounds
    selectedPopup.center = view.center
    selectedPopupTopbar.layer.cornerRadius = 10
    selectedPopupTopbar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    lockedPopupLabel.setLineSpacing(6)
    lockedPopupLabel.textAlignment = .center
    lockedPopupBox.layer.cornerRadius = 20
    lockedPopupBox.setBolder(color: UIColor(red: 0.647, green: 0.737, blue: 0.812, alpha: 1), width: 6)
    lockedPopupLabel.setLineSpacing(6)
    lockedPopupLabel.textAlignment = .center
  }
  
  func openStagePopup(indexPath: IndexPath) {
    let selectedStageIndex = indexPath.row + 1
    selectedEP = player.currentEpisodes[selectedStageIndex]
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
    view.addSubview(selectedPopup)
  }
  
  func openLockedPopup(isEpiloguePopup: Bool) {
    view.addSubview(lockedPopup)
    lockedPopup.pinToEdges(inView: view)
    let popupText: String
    switch isEpiloguePopup {
      case true:
        popupText = "이 에피소드는 모든 사건을 해결한 후에 진행할 수 있습니다."
      case false:
        popupText = "안녕하세요! [마지막 1초] 개발팀입니다.\n저희 게임을 즐겨주셔서 정말 감사합니다. 그리고 스토리 업데이트가 늦어지는 점 진심으로 죄송합니다.\n\n[마지막 1초]는 예산 등의 문제로 이후 제작이 중단되었으나, 다행스럽게도 최근에 다시 제작할 수 있는 기회를 얻었습니다. 저희 개발팀은 18-19세 청소년 시기부터 시작하여 20-21세의 사회 초년생이 되었습니다. 현재 각자의 필드에서 활동하고 있어 내년 초까지 스토리 업데이트하는 것을 목표로 두고 작업하고 있습니다.\n\n다른 스토리를 플레이하고 싶어도 하실 수 없는 상황, 저희도 충분히 인지하고 있으며 조금만 기다려주시면 저희가 최대한 빠른 시일 내에 다시 찾아뵐 수 있도록 노력하겠습니다.감사합니다."
    }
    lockedPopupLabel.text = popupText
  }
  
  private func closeLockedPopup() {
    lockedPopup.removeFromSuperview()
  }
}

extension SelectStageViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return player.currentEpisodes.count - 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let selectedStageIndex = indexPath.row + 1
    let cell = tableView.dequeueReusableCell(withIdentifier: "selectStageTableViewCell", for: indexPath) as! SelectStageTableViewCell

    cell.configure(selectedStageIndex: selectedStageIndex, selectedRowIndex: selectedRowIndex)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    playEffectSound(.buttonClick, type: .mp3)
    let selectedStageIndex = indexPath.row + 1
    let dataToSend: Episode
    dataToSend = player.currentEpisodes[selectedStageIndex]
    player.dayIndex = selectedStageIndex
    let epID = dataToSend.episodeID
    if epID == "ending" { openLockedPopup(isEpiloguePopup: true) }
    else if epID == "1592" || epID == "1803" || epID == "1918" { openLockedPopup(isEpiloguePopup: false) }
    else { openStagePopup(indexPath: indexPath) }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}

class EpisodeService {
  static func isEdingOpen() -> Bool {
    let episodes = player.currentEpisodes
    let endingTurn = episodes.filter { $0.episodeID != "ending" && !$0.isCleared }.isEmpty
    return endingTurn
  }
}

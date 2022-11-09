//
//  SelectStageViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/29.
//

import Alamofire
import UIKit

class SelectStageViewController: UIViewController {
  var epis: [CompactEpisode]?
  
  @IBOutlet weak var selectedPopupBox: UIView!
  @IBOutlet var selectedPopup: UIView!
  @IBOutlet weak var selectedPopupYearLabel: UILabel!
  @IBOutlet weak var selectedPopupTopbar: UIView!
  @IBOutlet weak var selectedPopupPlaceImage: UIImageView!
  @IBOutlet weak var selectedPopupDescriptionLabel: UILabel!
  @IBOutlet weak var selectedPopupStartButtonOutlet: SoundButton!
  @IBOutlet weak var selectedPopupSupTitleLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!

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
    tableView.delegate = self
    tableView.dataSource = self
    designPopup()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    Task {
      if let titles = await getSinarios() {
        self.epis = titles
        for (i, item) in self.epis!.enumerated() {
          await self.epis?[i].loadStory()
        }
        
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }
    }
  }
  
  private func getSinarios() async -> [CompactEpisode]? {
    let result = await AF.request(EpisodeRouter.episodes)
      .serializingDecodable(EpisodesResDto.self).result

    switch result {
    case let .success(res):
      let names = res.toModel().names.map { $0.fileName }.filter { $0.contains(".json") }
      print("Github sinarios:", names.joined(separator: ", "))
//        episodes.text = names.joined(separator: ", ")
      print(names.joined(separator: ", "))
        
      return res.toModel().names
    case let .failure(error):
      print("Github Error:", error)
      return nil
    }
  }
    
  private func getSinariosDetail(name: String) async {
    let result = await AF.request(EpisodeDetailRouter.episode(name))
      .serializingDecodable([BlockOfDayEpisodeForJson].self).result

    switch result {
    case let .success(res):
      print("Github Detail sinario:", res.first?.chats.first ?? "")
//        let new = "\(episodes.text ?? "")\n유효한 시나리오"
      print("유효한 시나리오")
//        episodes.text = new
    case let .failure(error):
      print("Github Detail Error:", error)
//        episodes.text = "\(episodes.text ?? "")\n유효하지 않은 시나리오"
      print("유효하지 않은 시나리오")
    }
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
  
  func checkEndingOpenTiming(playerEpisodes: [Episode]) -> Bool {
    var endingOpen = true
    for ep in playerEpisodes {
      if ep.episodeID != "ending", !ep.isCleared {
        endingOpen = false
      }
    }
    return endingOpen
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
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return epis?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let episode = epis?[indexPath.row].toEpisode()
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "selectStageTableViewCell", for: indexPath) as! SelectStageTableViewCell
    cell.episodeYear.text = episode?.fileName ?? "정보 없음"
    cell.episodePlaceImage.image = UIImage(named: player.currentEpisodes[1].episodePlaceImage)
    cell.progressView.updateStateColor(subView: cell.progressBackgroundView)
    cell.selectionStyle = .none
    cell.lockedView.isHidden = false
    cell.invalidDesc.alpha = (episode?.isTestEnable == true ? 0 : 1)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    playEffectSound(.buttonClick, type: .mp3)
//    let selectedStageIndex = indexPath.row + 1
//    let dataToSend: Episode
//    dataToSend = player.currentEpisodes[selectedStageIndex]
//    player.dayIndex = selectedStageIndex
//    let epID = dataToSend.episodeID
//    if epID == "ending" { openLockedPopup(isEpiloguePopup: true) }
//    else if epID == "1592" || epID == "1803" || epID == "1918"{ openLockedPopup(isEpiloguePopup: false) }
//    else { openStagePopup(indexPath: indexPath) }
    var episode = epis?[indexPath.row].toEpisode() ?? Episode()
    guard episode.isTestEnable else { return }
    
    let storyboard = UIStoryboard(name: "MainGame", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "UIViewController-58V-k4-uXR") as! MainGameViewController
    
    episode.currentStoryBlockIndex = "001"
    
    vc.episode = episode
    
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}

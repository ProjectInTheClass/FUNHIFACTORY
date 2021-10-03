//
//  TimeLineViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/08.
//

import UIKit

class TimeLineViewController: UIViewController {

  @IBOutlet var topBarTitle: UILabel!
  @IBOutlet weak var timelineTableView: UITableView!
  @IBOutlet weak var checkPointTableView: UITableView!
  @IBOutlet var epPopupBg: UIView!
  @IBOutlet weak var epPopupBox: UIView!
  @IBOutlet weak var epPopupTopBar: UIView!
  @IBOutlet weak var epPopupYear: UILabel!
  @IBOutlet weak var epPopupExit: UIButton!
  @IBOutlet weak var epPopupDesc: AlertDescLabel!
  
  @IBOutlet var startPopupBg: UIView!
  @IBOutlet var startPopupBox: AlertBox!
  @IBOutlet weak var startPopupDesc: AlertDescLabel!
  @IBOutlet weak var startPopupOk: UIButton!
  @IBOutlet weak var startPopupExit: UIButton!
  
  @IBOutlet var alertBg: UIView!
  @IBOutlet weak var alertBox: AlertBox!
  @IBOutlet weak var alertImage: UIImageView!
  @IBOutlet var alertDesc: AlertDescLabel!
  @IBOutlet var alertOk: UIButton!
  
  @IBOutlet var backXButton: UIButton!
  @IBOutlet var backClampButton: UIButton!
  
  var selectedEpisodeStoryBlockIndex = String()
  var selectedEpisode: Episode? {
    didSet {
      checkPointTableView.reloadData()
    }
  }
  
  enum BackButtonState {
    case arrow
    case x
  }
  
  var backButtonState: BackButtonState = .x
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView() 
    setupStyle()
    updateBackButton()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    timelineTableView.reloadData()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    if let headerView = checkPointTableView.tableHeaderView {
      let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
      var headerFrame = headerView.frame
      if height != headerFrame.size.height {
        headerFrame.size.height = height
        headerView.frame = headerFrame
        checkPointTableView.tableHeaderView = headerView
      }
    }
  }
  
  @IBAction func back(_ sender: Any) {
    back()
    audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
  }
  
  @IBAction func openChatHistory(_ sender: Any) {
    guard let currentEpisode = selectedEpisode else { return }
    if currentEpisode.chatHistory.count != 0 {
      let dataToSend = currentEpisode
      performSegue(withIdentifier: "textSegue", sender: dataToSend)
    } else {
      self.view.addSubview(alertBg)
      alertDesc.text = "아직 기록된 내용이 없습니다.\n조금 더 플레이 후 눌러주세요!"
    }
  }
    
  @IBAction func exitEpPopup(_ sender: Any) {
    epPopupBg.removeFromSuperview()
  }
  
  @IBAction func okStartPopup(_ sender: Any) {
    guard let selectedEpisode = selectedEpisode else { return }
    let dataToSend = selectedEpisode
    player.currentEpisodes[strToIndex(str: player.dayId)].chatHistory = player.currentChatArray
    player.currentChatArray.removeAll()
    player.indexNumber = 0
    player.currentEpisodes[strToIndex(str: selectedEpisode.episodeID)].isCleared = false
    isChoiceOn = false
    player.dayId = selectedEpisode.episodeID
    player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex = selectedEpisodeStoryBlockIndex
    performSegue(withIdentifier: "fromTimelineToMaingameSegue", sender: dataToSend)
  }
  
  @IBAction func exitStartPopup(_ sender: Any) {
    startPopupBg.removeFromSuperview()
  }

  @IBAction func exitAlert(_ sender: Any) {
    alertBg.removeFromSuperview()
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "textSegue" {
      let destination = segue.destination as! EPHistoryViewController
      if let sender = sender as? Episode {
        destination.currentEpisode = sender
      }
    }
  }
 
  private func setupTableView() {
    self.timelineTableView.delegate = self
    self.timelineTableView.dataSource = self
    self.checkPointTableView.delegate = self
    self.checkPointTableView.dataSource = self
    timelineTableView.register(UINib(nibName: "EpisodeCell", bundle: nil), forCellReuseIdentifier: "EpisodeCell")
    timelineTableView.register(UINib(nibName: "EpisodeCurrentCell", bundle: nil), forCellReuseIdentifier: "EpisodeCurrentCell")
    checkPointTableView.register(UINib(nibName: "CheckPointHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "CheckPointHeaderView")
    checkPointTableView.register(UINib(nibName: "CheckPointHeaderView2", bundle: nil), forHeaderFooterViewReuseIdentifier: "CheckPointHeaderView2")
    checkPointTableView.tableFooterView = UIView()
    checkPointTableView.tableFooterView?.frame.size.height = 20
    checkPointTableView.tableFooterView?.backgroundColor = .clear
  }
  
  private func openEpPopup(ep: Episode) {
    selectedEpisode = ep
    self.view.addSubview(epPopupBg)
    epPopupBg.pinToEdges(inView: self.view)
    setupEpPopup(ep: ep)
  }

  private func openStartPopup() {
    epPopupBg.removeFromSuperview()
    self.view.addSubview(startPopupBg)
    startPopupBg.pinToEdges(inView: self.view)
    setupStartPopup()
  }
  
  private func openAlert(isEnding: Bool) {
    self.view.addSubview(alertBg)
    alertBg.pinToEdges(inView: self.view)
    setupAlert(isEnding: isEnding)
  }
  
  private func setupEpPopup(ep: Episode) {
    epPopupYear.text = "\(ep.episodeYear)년 \(ep.episodePlace)"
    if ep.episodeID == "prologue" {
      epPopupDesc.text = "\(ep.episodeShortDesciption)\n\n"
    } else {
      epPopupDesc.text = ep.episodeShortDesciption
    }
  }

  private func setupStartPopup() {
    let desc = "현재 진행 중인 게임을 그만두고,\n선택한 지점부터 사건을 재시작하여\n이전 사건 기록이 사라집니다.\n\n계속하시겠습니까?"
    startPopupDesc.text = desc
  }
  
  private func setupAlert(isEnding: Bool) {
    let normalDesc = "아직 진행하지 않은 사건입니다.\n현재 진행하고 있는 사건을 완료한 후\n계속할 수 있습니다."
    let endingDesc = "이 에피소드는 모든 사건을 해결한 후에 진행할 수 있습니다."
    if isEnding {
      alertDesc.text = endingDesc
    } else {
      alertDesc.text = normalDesc
    }
  }
  
  private func setupStyle() {
    topBarTitle.font = UIFont(name: "NanumSquareEB", size: 29)
    epPopupBox.layer.cornerRadius = 10
    epPopupBox.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
    epPopupBox.layer.borderWidth = 4
    epPopupYear.textAlignment = .center
  }
  
  private func updateBackButton() {
    switch backButtonState {
    case .arrow:
      backXButton.isHidden = true
      backClampButton.isHidden = false
    case .x:
      backXButton.isHidden = false
      backClampButton.isHidden = true
    }
  }
  
  private func back() {
    switch backButtonState {
    case .arrow:
      popWithAnimationFromLeft()
    case .x:
      popWithAnimation()
    }
  }
}

extension TimeLineViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    switch tableView {
    case timelineTableView:
      return 1
    case checkPointTableView:
      return selectedEpisode?.timelineCheckPoint.count ?? 1
    default:
      return 0
    }
  }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    switch tableView {
    case timelineTableView:
      return player.currentEpisodes.count + 2
    case checkPointTableView:
      return selectedEpisode?.timelineCheckPoint[section].count ?? 1
    default:
      return 0
    }
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    var returnCell = UITableViewCell()
    
    if tableView == timelineTableView {
      switch indexPath.row {
      case 1, 6:
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClockCell", for: indexPath) as! ClockCell
        returnCell = cell
        
      default:
        let timelineIndex = indexPath.row.toTimelineIndex()
        let ep = player.currentEpisodes[timelineIndex]
        switch player.currentEpisodes[timelineIndex] == currentEpisode() {
        case true:
          let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCurrentCell", for: indexPath) as! EpisodeCurrentCell
          cell.configureCell(ep: ep, row: indexPath.row, index: timelineIndex)
          returnCell = cell
          
        case false:
          let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as! EpisodeCell
          cell.configureCell(ep: ep, row: indexPath.row, index: timelineIndex)
          returnCell = cell
        }
      }
    }

    if tableView == checkPointTableView {
      guard let currentEpisode = selectedEpisode else { return returnCell }
      let cell = tableView.dequeueReusableCell(withIdentifier: "checkPointTableViewCell", for: indexPath) as! CheckPointTableViewCell
      let checkPoint = currentEpisode.timelineCheckPoint[indexPath.section][indexPath.row]
      cell.configureCell(point: checkPoint, section: indexPath.section)
      returnCell = cell
    }
    return returnCell
  }
    
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if tableView == checkPointTableView {
      switch section {
      case 0:
          return 34
      default:
          return 15
      }
    } else {
      return UITableView.automaticDimension
    }
  }


  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard tableView == checkPointTableView else { return UIView() }
    if section == 0 {
      let header = checkPointTableView.dequeueReusableHeaderFooterView(withIdentifier: "CheckPointHeaderView") as! CheckPointHeaderFooterView
      return header
    } else {
      let header = checkPointTableView.dequeueReusableHeaderFooterView(withIdentifier: "CheckPointHeaderView2") as! CheckPointHeaderFooterView2
      header.configureHeader(section: section)
      return header
    }
  }
}


extension TimeLineViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView == timelineTableView && indexPath.row != 1 && indexPath.row != 6 {
      let timelineIndex = indexPath.row.toTimelineIndex()
      let ep = player.currentEpisodes[timelineIndex]
        guard ep.isStarted else {
          if timelineIndex == player.currentEpisodes.count-1 {
            openAlert(isEnding: true)
          } else {
            openAlert(isEnding: false)
          }
          return
        }
        openEpPopup(ep: player.currentEpisodes[timelineIndex])
      }

    if tableView == checkPointTableView {
      guard let selectedEpisode = selectedEpisode else { return }
      let selectedCheckPoint = selectedEpisode.timelineCheckPoint[indexPath.section][indexPath.row]
      selectedEpisodeStoryBlockIndex = selectedEpisode.timelineCheckPoint[indexPath.section][indexPath.row].storyBlockIndex
      if !selectedCheckPoint.isLocked {
        openStartPopup()
      }
    }
  }
}

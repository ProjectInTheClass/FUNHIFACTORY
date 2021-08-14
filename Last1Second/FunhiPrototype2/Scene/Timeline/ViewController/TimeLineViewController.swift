//
//  TimeLineViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/08.
//

import UIKit

//---------------------------뷰컨--------------------------


class TimeLineViewController: UIViewController {

  @IBOutlet var timelineLabel: UILabel!
  @IBOutlet weak var timelineTableView: UITableView!
  @IBOutlet weak var checkPointTableView: UITableView!

  var selectedEpisode: Episode?
  var selectedEpisodeStoryBlockIndex = String()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView() 
    designObjects(firstPopupView: selectedEpisodePopupBox, secondPopupView: gettingStartPopupBox, secondPopupButton1: continueButton, secondPopupButton2: exitButton)
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
  override func viewWillAppear(_ animated: Bool) {
      timelineTableView.reloadData()
      
  }
  
  @IBOutlet var scrollViewHeight: NSLayoutConstraint!
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      //이전 기록 보기
      if segue.identifier == "textSegue" {
          let destination = segue.destination as! EPHistoryViewController
          if let sender = sender as? Episode {
              destination.currentEpisode = sender
          }
      }
  }
  
  @IBAction func backAction(_ sender: Any) {
      let transition:CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
      transition.type = CATransitionType.reveal
      transition.subtype = CATransitionSubtype.fromTop
      self.navigationController!.view.layer.add(transition, forKey: kCATransition)
      self.navigationController?.popViewController(animated: false)
      audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
  }
    
    //--------------------첫 번째 팝업--------------------
    @IBOutlet var selectedEpisodePopup: UIView!
    @IBOutlet weak var selectedEpisodePopupBox: UIView!
    @IBOutlet weak var selectedEpisodePopupTopBar: UIView!
    @IBOutlet weak var selectedEpisodeYearLabel: UILabel!
    @IBOutlet weak var selectedEpisodePopupExitButton: UIButton!
    @IBOutlet weak var selectedEpisodeDescriptionLabel: UILabel!


    //이전 기록 보기 버튼
    @IBAction func openEpisodeHistoryAction(_ sender: Any) {
        guard let currentEpisode = selectedEpisode else { return }
        if currentEpisode.chatHistory.count != 0 {
            let dataToSend = currentEpisode
          //  player.dayId = currentEpisode.episodeID
            performSegue(withIdentifier: "textSegue", sender: dataToSend)
        } else {
            self.view.addSubview(thirdPopup)
            thirdPopupLabel.text = "아직 기록된 내용이 없습니다.\n조금 더 플레이 후 눌러주세요!"
        }
       
    }
    
    @IBAction func selectedEpisodePopupExitButtonAction(_ sender: Any) {
        selectedEpisodePopup.removeFromSuperview()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let headerView = checkPointTableView.tableHeaderView {

            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var headerFrame = headerView.frame

            //Comparison necessary to avoid infinite loop
            if height != headerFrame.size.height {
                headerFrame.size.height = height
                headerView.frame = headerFrame
                checkPointTableView.tableHeaderView = headerView
            }
        }
    }
    
    //-------------------두 번째 팝업----------------
    @IBOutlet var gettingStartPopup: UIView!
    @IBOutlet var gettingStartPopupBox: UIView!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    //예 버튼 눌렀을 때 : 체크포인트부터 다시 시작
    @IBAction func continueButtonAction(_ sender: Any) {
        guard let selectedEpisode = selectedEpisode else { return }
        
        //selectedEpisode: 선택한 체크포인트가 속해있는 에피소드
        let dataToSend = selectedEpisode
        
        // 기존에 메인게임에서 플레이하던 내용은 이전 기록 보기에 저장
        player.currentEpisodes[strToIndex(str: player.dayId)].chatHistory = player.currentChatArray
        //그 다음 메인게임 화면의 챗 전체 삭제
        player.currentChatArray.removeAll()
        
        //챗 인덱스 0으로 바꾸기, 초이스바 끄기
        player.indexNumber = 0
        player.currentEpisodes[strToIndex(str: selectedEpisode.episodeID)].isCleared = false
        isChoiceOn = false
        //현제 에피소드 id 바꾸기
        player.dayId = selectedEpisode.episodeID
        
        // 세이브포인트 버튼 테블뷰로 바꾸고 인덱스값 수정하기
        player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex = selectedEpisodeStoryBlockIndex
        
       //푸쉬
        performSegue(withIdentifier: "fromTimelineToMaingameSegue", sender: dataToSend)
        }
    
    //아니오 버튼 눌렀을 때
    @IBAction func exitButtonAction(_ sender: Any) {
        gettingStartPopup.removeFromSuperview()
    }
    
    
    //-------------------세 번째 팝업----------------
    
    @IBOutlet var thirdPopup: UIView!
    @IBOutlet weak var thirdPopupBox: UIView!
    @IBOutlet weak var thirdPopupImageView: UIImageView!
    @IBOutlet var thirdPopupLabel: UILabel!
    @IBOutlet var thirdPopupOkayButton: UIButton!
    @IBAction func thirdPopupOkayButtonTouched(_ sender: Any) {
        thirdPopup.removeFromSuperview()
    }
    
    
    
  
    //첫 번째 팝업 여는 함수
    func openSelectedEpisodePopup(indexPathRow: Int) {
        selectedEpisode = player.currentEpisodes[indexPathRow]
        
        guard let currentEpisode = selectedEpisode else { return }
        self.view.addSubview(selectedEpisodePopup)
        
        checkPointTableView.reloadData()
        selectedEpisodeYearLabel.text = "\(currentEpisode.episodeYear)년 \(currentEpisode.episodePlace)"
        selectedEpisodeDescriptionLabel.text = currentEpisode.episodeShortDesciption
        if currentEpisode.episodeID == "prologue" {
            selectedEpisodeDescriptionLabel.text = "\(currentEpisode.episodeShortDesciption)\n\n"
        }

    }
    //얼러트 팝업 여는 함수
    func openAlertPopup(isEndingCell: Bool) {
        
        self.view.addSubview(thirdPopup)
        if isEndingCell {
            thirdPopupLabel.text = "이 에피소드는 모든 사건을 해결한 후에 진행할 수 있습니다."
        }
        else {
            thirdPopupLabel.text = "아직 진행하지 않은 사건입니다.\n현재 진행하고 있는 사건을 완료한 후\n계속할 수 있습니다."
        }
    }
    
    //첫 번째 팝업에서 두 번째 팝업 넘어가는 함수
    func openGettingStartPopup() {
        selectedEpisodePopup.removeFromSuperview()
        self.view.addSubview(gettingStartPopup)
        //이 문구는 베리가 넘겨주면 넣을 예정
        warningLabel.text = "현재 진행 중인 게임을 그만두고,\n선택한 지점부터 사건을 재시작하여\n이전 사건 기록이 사라집니다.\n\n계속하시겠습니까?"
    }
    
    //팝업 디자인하는 함수
    func designObjects(firstPopupView: UIView, secondPopupView: UIView, secondPopupButton1: UIButton, secondPopupButton2: UIButton) {
     
        timelineLabel.font = UIFont(name: "NanumSquareEB", size: 29)

       // selectedEpisodeYearLabel.font = UIFont(name: "NEXONLv2GothicB", size: 24)
        
        selectedEpisodePopup.center = self.view.center
        selectedEpisodePopup.bounds = self.view.bounds
        
        gettingStartPopup.center = self.view.center
        gettingStartPopup.bounds = self.view.bounds
        
        thirdPopup.center = self.view.center
        thirdPopup.bounds = self.view.bounds
        
        selectedEpisodeYearLabel.textAlignment = .center
        selectedEpisodePopupBox.layer.cornerRadius = 10
        selectedEpisodePopupBox.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        selectedEpisodePopupBox.layer.borderWidth = 4
        
        selectedEpisodeDescriptionLabel.font = UIFont(name: "NanumSquareB", size: 16)
        
        selectedEpisodeDescriptionLabel.setLineSpacing(lineSpacing: 6)
        selectedEpisodeDescriptionLabel.textAlignment = .center
        
        
        
        gettingStartPopupBox.layer.cornerRadius = 20
        gettingStartPopupBox.layer.borderWidth = 6
        gettingStartPopupBox.layer.borderColor = UIColor(red:0.647, green: 0.737, blue: 0.812, alpha: 1).cgColor
        
        
        warningLabel.setLineSpacing(lineSpacing: 6)
        warningLabel.textAlignment = .center
        thirdPopupBox.layer.cornerRadius = 20
        thirdPopupBox.layer.borderWidth = 6
        thirdPopupBox.layer.borderColor = UIColor(red:0.647, green: 0.737, blue: 0.812, alpha: 1).cgColor
        
        
        thirdPopupLabel.setLineSpacing(lineSpacing: 6)
        thirdPopupLabel.textAlignment = .center
       
   
    
    }

  private func setProgressValue(timelineIndex: Int) -> CGFloat {
    let currentEp = player.currentEpisodes[timelineIndex]
    // 100%
    if currentEp.isCleared {
      return CGFloat(1.0)
    // 1~99%
    } else if currentEp.storyBlocks.count != 0 {
      return CGFloat((Double(Int(currentEp.currentStoryBlockIndex) ?? 0)/Double(currentEp.storyBlocks.count)))
    // 0%
    } else {
      return CGFloat(0.0)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "clockTimelineTableViewCell", for: indexPath) as! ClockTimelineTableViewCell
        cell.selectionStyle = .none
        returnCell = cell
      default:
        
        let timelineIndex = indexPath.row.toTimelineIndex()
        let currentEp = player.currentEpisodes[timelineIndex]
        let progressValue: CGFloat
        
        switch player.currentEpisodes[timelineIndex] == currentEpisode() {
        case true:
          let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCurrentCell", for: indexPath) as! EpisodeCurrentCell
          cell.episodePlace.text = currentEp.episodePlace
          cell.episodeYear.text = "\(currentEp.episodeYear)년"
          cell.episodePlaceImage.image = UIImage(named: currentEp.episodePlaceImage)
          cell.lockedView.isHidden = currentEp.isStarted
          cell.setLine(indexPathRow: indexPath.row)
          progressValue = setProgressValue(timelineIndex: timelineIndex)
          cell.progressView.updateProgress(value: progressValue)
          progressValue == 1.0 ?
            (cell.progressBackgroundView.isHidden = true) :
            (cell.progressBackgroundView.isHidden = false)
          cell.progressView.updateStateColor(subView: cell.progressBackgroundView)
          cell.selectionStyle = .none
          returnCell = cell
        case false:
          let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as! EpisodeCell
          cell.episodePlace.text = currentEp.episodePlace
          cell.episodeYear.text = "\(currentEp.episodeYear)년"
          cell.episodePlaceImage.image = UIImage(named: currentEp.episodePlaceImage)
          cell.lockedView.isHidden = currentEp.isStarted
          cell.setLine(indexPathRow: indexPath.row)
          progressValue = setProgressValue(timelineIndex: timelineIndex)
          cell.progressView.updateProgress(value: progressValue)
          progressValue == 1.0 ?
            (cell.progressBackgroundView.isHidden = true) :
            (cell.progressBackgroundView.isHidden = false)
          cell.progressView.updateStateColor(subView: cell.progressBackgroundView)
          cell.selectionStyle = .none
          returnCell = cell
        }
        
        
       
        
        
      }
    }

    if tableView == checkPointTableView {
      guard let currentEpisode = selectedEpisode else { return returnCell }
      let cell = tableView.dequeueReusableCell(withIdentifier: "checkPointTableViewCell", for: indexPath) as! CheckPointTableViewCell
      let checkPoint = currentEpisode.timelineCheckPoint[indexPath.section][indexPath.row]
      cell.titleLabel.text = checkPoint.name
      checkPoint.isLocked ? (cell.lockedShadow.isHidden = false) : (cell.lockedShadow.isHidden = true)
      
      if checkPoint.isLocked {
        switch indexPath.section {
        case 0:
          cell.lockedview.backgroundColor = .way0LockedBackground
          cell.lockedShadow.backgroundColor = .way0LockedShadow
        case 1:
          cell.lockedview.backgroundColor = .way1LockedBackground
          cell.lockedShadow.backgroundColor = .way1LockedShadow
        case 2:
          cell.lockedview.backgroundColor = .way2LockedBackground
          cell.lockedShadow.backgroundColor = .way2LockedShadow
        default:
          cell.view.backgroundColor = .black
          cell.shadow.backgroundColor = .black
        }
      } else {
        switch indexPath.section {
        case 0:
          cell.view.backgroundColor = .checkWay0Background
          cell.shadow.backgroundColor = .checkWay0Shadow
        case 1:
          cell.view.backgroundColor = .checkWay1Background
          cell.shadow.backgroundColor = .checkWay1Shadow
        case 2:
          cell.view.backgroundColor = .checkWay2Background
          cell.shadow.backgroundColor = .checkWay2Shadow
        default:
          cell.view.backgroundColor = .black
          cell.shadow.backgroundColor = .black
        }
      }
      
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
      
      guard tableView == checkPointTableView else {
        return UIView()
      }
      
      if section == 0 {
          let headerView = checkPointTableView.dequeueReusableHeaderFooterView(withIdentifier: "CheckPointHeaderView") as! CheckPointHeaderFooterView
          headerView.sectionLabel.text = "여기서부터 다시 시작"
            //  headerView.sectionImageView.image = UIImage(named: "start here icon")
          return headerView
      } else {
         let headerView = checkPointTableView.dequeueReusableHeaderFooterView(withIdentifier: "CheckPointHeaderView2") as! CheckPointHeaderFooterView2
          headerView.sectionLabel.text = "\(section)번째 길"

        switch section {
        case 1:
          headerView.sectionIconView.backgroundColor = .checkWay1Section
        case 2:
          headerView.sectionIconView.backgroundColor = .checkWay2Section
        default:
          headerView.sectionIconView.backgroundColor = .way0TrackColor
        }
          

          return headerView
      }
  }
}





extension TimeLineViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
      // 타임라인 테이블 뷰의 경우(시계 셀은 뺌)
      if tableView == timelineTableView && indexPath.row != 1 && indexPath.row != 6 {
          
          var timelineIndex = Int()
          switch indexPath.row {
          case 0:
              timelineIndex = indexPath.row
          case 2...5:
              timelineIndex = indexPath.row - 1
          case 7:
              timelineIndex = indexPath.row - 2
          default:
             // 걍 예외 땜빵용
              timelineIndex = 0
          }
          
          guard player.currentEpisodes[timelineIndex].isStarted else {
              
              if timelineIndex == player.currentEpisodes.count-1 {
                  openAlertPopup(isEndingCell: true)
              }
              else {
                  openAlertPopup(isEndingCell: false)
              }
              return
          }
          selectedEpisode = player.currentEpisodes[timelineIndex]
          
          openSelectedEpisodePopup(indexPathRow: timelineIndex)
      }
      // 체크포인트 테이블 뷰의 경우
      if tableView == checkPointTableView {
          
          guard let selectedEpisode = selectedEpisode else {
              return
          }
          let selectedCheckPoint = selectedEpisode.timelineCheckPoint[indexPath.section][indexPath.row]
          selectedEpisodeStoryBlockIndex = selectedEpisode.timelineCheckPoint[indexPath.section][indexPath.row].storyBlockIndex
          
          //체크포인트 해금 되었다면 터치 되게 하기
          if !selectedCheckPoint.isLocked {
              openGettingStartPopup()
          }
          
      }
      
      
  }

}

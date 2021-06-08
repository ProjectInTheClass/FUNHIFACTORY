//
//  TimeLineViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/08.
//

import UIKit
//--------------------------테이블뷰 셀--------------------------
class CheckPointTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
    func designCell() {
        titleLabel.font = UIFont(name: "NanumSquareEB", size: 14)
    }
}

class ClockTimelineTableViewCell: UITableViewCell {
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
   
}
class TimelineTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var episodeYear: UILabel!
    @IBOutlet weak var episodePlace: UILabel!
    @IBOutlet weak var episodePlaceImage: UIImageView!
    @IBOutlet weak var lockedView: UIView!
    @IBOutlet weak var leftBox: UIView!
    
    
    @IBOutlet var lineTopConstraint: NSLayoutConstraint!
    @IBOutlet var lineBottomConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func designButton() {
        
        lockedView.layer.cornerRadius = 8
        leftBox.layer.cornerRadius = 8
        leftBox.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        cellBackground.layer.cornerRadius = 8
       
    }
}
//---------------------------뷰컨--------------------------






class TimeLineViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
//---------------------------TableView---------------------------
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == timelineTableView {
            return 1
            //tableView == checkpointTableView
        } else {
            guard let currentEpisode = selectedEpisode else {
                return 1
            }

            return currentEpisode.timelineCheckPoint.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == timelineTableView {
            return player.currentEpisodes.count + 2
        }
        // tableView == checkPointTableView면
        else {
            guard let currentEpisode = selectedEpisode else {
                return 1
            }
          //  checkPointTableViewHeight.constant = CGFloat(49*currentEpisode.timelineCheckPoint.count)
            return currentEpisode.timelineCheckPoint[section].count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnCell = UITableViewCell()
        if tableView == timelineTableView {
            if indexPath.row == 1 || indexPath.row == 6 {
                //타임라인 시계 셀
                let cell = tableView.dequeueReusableCell(withIdentifier: "clockTimelineTableViewCell", for: indexPath) as! ClockTimelineTableViewCell
                cell.selectionStyle = .none
                returnCell = cell
            
            } else {
                //일반 타임라인 셀
                let cell = tableView.dequeueReusableCell(withIdentifier: "timelineTableViewCell", for: indexPath) as! TimelineTableViewCell
                
                var timelineIndex = Int()
                switch indexPath.row {
                case 0:
                    timelineIndex = indexPath.row
                case 2...5:
                    timelineIndex = indexPath.row - 1
                case 7:
                    timelineIndex = indexPath.row - 2
                default:
                    timelineIndex = 0
                }
                cell.episodePlace.text = player.currentEpisodes[timelineIndex].episodePlace
                cell.episodeYear.text = "\(player.currentEpisodes[timelineIndex].episodeYear)년"
                cell.episodePlaceImage.image = UIImage(named: player.currentEpisodes[timelineIndex].episodePlaceImage)
                // 완료/미완료한 체크박스 이미지 이름 : trueClear / falseClear
                cell.lockedView.isHidden = player.currentEpisodes[timelineIndex].isCleared
                cell.selectionStyle = .none
                
                if indexPath.row == 0 {
                    cell.lineTopConstraint.constant = 20
                    cell.lineBottomConstraint.constant = 0
                } else if indexPath.row == 7 {
                    cell.lineTopConstraint.constant = 0
                    cell.lineBottomConstraint.constant = 20
                } else {
                    cell.lineTopConstraint.constant = 0
                    cell.lineBottomConstraint.constant = 0
                }
                returnCell = cell
            }
        }
        // tableView == checkPointTableView면
        else {
            guard let currentEpisode = selectedEpisode else {
                return UITableViewCell()
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "checkPointTableViewCell", for: indexPath) as! CheckPointTableViewCell
            cell.titleLabel.text = currentEpisode.timelineCheckPoint[indexPath.section][indexPath.row].name
            returnCell = cell
        }

        return returnCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //타임라인 테이블 뷰
        if tableView == timelineTableView {
           return UITableView.automaticDimension
        } else {
            //체크포인트 테이블 뷰
            return 49
        }
    }
   
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
            
            guard player.currentEpisodes[timelineIndex].isCleared else {
                
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
            selectedEpisodeStoryBlockIndex = selectedEpisode.timelineCheckPoint[indexPath.section][indexPath.row].storyBlockIndex
            openGettingStartPopup()
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard tableView == checkPointTableView else {
            return UIView()
        }
        
        if section == 0 {
            let headerView = checkPointTableView.dequeueReusableHeaderFooterView(withIdentifier: "CheckPointHeaderView") as! CheckPointHeaderFooterView
            headerView.sectionLabel.text = "여기서부터 다시 시작"
            headerView.sectionImageView.image = UIImage(named: "start here icon")
            return headerView
        } else {
           let headerView = checkPointTableView.dequeueReusableHeaderFooterView(withIdentifier: "CheckPointHeaderView2") as! CheckPointHeaderFooterView2
            headerView.sectionLabel.text = "\(section)번째 길"

            headerView.sectionView.backgroundColor = .blue

            return headerView
        }
       
        
        
    }
    
    
    
    
    
    
    
    //---------------------------일반---------------------------
    @IBOutlet var timelineLabel: UILabel!
    @IBOutlet weak var timelineTableView: UITableView!
    @IBOutlet weak var checkPointTableView: UITableView!

    var selectedEpisode: Episode?
    var selectedEpisodeStoryBlockIndex = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timelineTableView.delegate = self
        self.timelineTableView.dataSource = self
        self.checkPointTableView.delegate = self
        self.checkPointTableView.dataSource = self
        
        checkPointTableView.register(UINib(nibName: "CheckPointHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "CheckPointHeaderView")
        checkPointTableView.register(UINib(nibName: "CheckPointHeaderView2", bundle: nil), forHeaderFooterViewReuseIdentifier: "CheckPointHeaderView2")
        designObjects(firstPopupView: selectedEpisodePopupBox, secondPopupView: gettingStartPopupBox, secondPopupButton1: continueButton, secondPopupButton2: exitButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        timelineTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //이전 기록 보기
        if segue.identifier == "textSegue" {
            let destination = segue.destination as! EPHistoryViewController
            if let sender = sender as? [Chat] {
                destination.recieved = sender
            }
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        let transition:CATransition = CATransition()
          transition.duration = 0.35
          transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
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
    @IBOutlet weak var selectedEpisodePlaceImageView: UIImageView!
    @IBOutlet var episodeHistoryButtonBakgroundView: UIView!
    
  
    
    //이전 기록 보기 버튼
    @IBAction func openEpisodeHistoryAction(_ sender: Any) {
        guard let currentEpisode = selectedEpisode else { return }
        let dataToSend = currentEpisode.chatHistory
        performSegue(withIdentifier: "textSegue", sender: dataToSend)
    }
    
    @IBAction func selectedEpisodePopupExitButtonAction(_ sender: Any) {
        selectedEpisodePopup.removeFromSuperview()
    }
    
    
   
    //-------------------두 번째 팝업----------------
    @IBOutlet var gettingStartPopup: UIView!
    @IBOutlet var gettingStartPopupBox: UIView!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    //예 버튼 눌렀을 때
    @IBAction func continueButtonAction(_ sender: Any) {
        guard let currentEpisode = selectedEpisode else { return }
        let dataToSend = currentEpisode
        player.currentChatArray.removeAll()
        player.indexNumber = 0   
        player.dayId = currentEpisode.episodeID
        // 세이브포인트 버튼 테블뷰로 바꾸고 인덱스값 수정하기
        player.currentChatId = selectedEpisodeStoryBlockIndex
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
        selectedEpisodeYearLabel.text = "\(currentEpisode.episodeYear)년"
        selectedEpisodeDescriptionLabel.text = currentEpisode.episodeDesciption

    }
    //얼러트 팝업 여는 함수
    func openAlertPopup(isEndingCell: Bool) {
        
        self.view.addSubview(thirdPopup)
        if isEndingCell {
            thirdPopupLabel.text = "이 에피소드는 모든 사건을 해결한 후에 진행할 수 있습니다."
        }
        else {
            thirdPopupLabel.text = "아직 진행하지 않은 사건입니다. 현재 진행하고 있는 사건을 완료한 후 계속할 수 있습니다."
        }
    }
    
    //첫 번째 팝업에서 두 번째 팝업 넘어가는 함수
    func openGettingStartPopup() {
        selectedEpisodePopup.removeFromSuperview()
        self.view.addSubview(gettingStartPopup)
        //이 문구는 베리가 넘겨주면 넣을 예정
        warningLabel.text = "현재 진행 중인 게임을 그만두고, 선택한 지점부터 사건을 재시작하여 이전 사건 기록이 사라집니다.\n\n계속하시겠습니까?"
    }
    
    //팝업 디자인하는 함수
    func designObjects(firstPopupView: UIView, secondPopupView: UIView, secondPopupButton1: UIButton, secondPopupButton2: UIButton) {
     
        timelineLabel.font = UIFont(name: "NanumSquareEB", size: 29)

        selectedEpisodeYearLabel.font = UIFont(name: "NEXONLv2GothicB", size: 24)
         episodeHistoryButtonBakgroundView.layer.borderWidth = 3
        episodeHistoryButtonBakgroundView.layer.borderColor = UIColor(red: 0.524, green: 0.646, blue: 0.75, alpha: 1).cgColor
       
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
        
        thirdPopupBox.layer.cornerRadius = 20
        thirdPopupBox.layer.borderWidth = 6
        thirdPopupBox.layer.borderColor = UIColor(red:0.647, green: 0.737, blue: 0.812, alpha: 1).cgColor
     
        
        thirdPopupImageView.layer.shadowColor = UIColor(red: 0.051, green: 0.192, blue: 0.312, alpha: 1).cgColor
        thirdPopupImageView.layer.shadowOpacity = 1
        thirdPopupImageView.layer.shadowRadius = 5
        thirdPopupImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
    
        thirdPopupOkayButton.layer.shadowColor = UIColor(red: 0.443, green: 0.561, blue: 0.663, alpha: 1).cgColor
        thirdPopupOkayButton.layer.shadowOpacity = 1
        thirdPopupOkayButton.layer.shadowRadius = 0
        thirdPopupOkayButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        
    
    }
}

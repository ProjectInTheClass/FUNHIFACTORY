//
//  TimeLineViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/08.
//

import UIKit
//--------------------------테이블뷰 셀--------------------------
class TimelineTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var episodeYear: UILabel!
    @IBOutlet weak var episodePlace: UILabel!
    @IBOutlet weak var episodePlaceImage: UIImageView!
    @IBOutlet weak var lockedView: UIView!
    @IBOutlet weak var leftBox: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        designButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func designButton() {
        
        leftBox.layer.cornerRadius = 8
        leftBox.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        cellBackground.layer.borderWidth = 2.5
        cellBackground.layer.borderColor = CGColor(red: 0.106, green: 0.157, blue: 0.22, alpha: 1)
        cellBackground.layer.cornerRadius = 8
           
        let shadowPath0 = UIBezierPath(roundedRect: cellBackground.bounds, cornerRadius: 8)
          
        cellBackground.layer.shadowPath = shadowPath0.cgPath
        cellBackground.layer.shadowColor = UIColor(red: 0.106, green: 0.157, blue: 0.22, alpha: 1).cgColor
        cellBackground.layer.shadowOpacity = 1
        cellBackground.layer.shadowRadius = 0
        cellBackground.layer.shadowOffset = CGSize(width: 7, height: 7)
        cellBackground.layer.position = cellBackground.center
    }
}
//---------------------------뷰컨--------------------------






class TimeLineViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
//---------------------------TableView---------------------------
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return player.currentEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        cell.episodePlace.text = player.currentEpisodes[indexPath.row].episodeName
        cell.episodeYear.text = "\(player.currentEpisodes[indexPath.row].episodeYear)년"
        cell.episodePlaceImage.image = UIImage(named: player.currentEpisodes[indexPath.row].episodePlaceImage)
        // 완료/미완료한 체크박스 이미지 이름 : trueClear / falseClear
        cell.lockedView.isHidden = player.currentEpisodes[indexPath.row].isCleared

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 147
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard player.currentEpisodes[indexPath.row].isCleared else {
            return
        }
        currentEpisode = player.currentEpisodes[indexPath.row]
        openSelectedEpisodePopup(indexPath: indexPath)
    }
    
    
    
    
    
    
    
    
    
    
    //---------------------------일반---------------------------
    @IBOutlet weak var timelineTableView: UITableView!
    var currentEpisode: Episode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timelineTableView.delegate = self
        self.timelineTableView.dataSource = self
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
        self.navigationController?.popViewController(animated: true)
    }
    
    //--------------------첫 번째 팝업--------------------
    @IBOutlet var selectedEpisodePopup: UIView!
    @IBOutlet weak var selectedEpisodePopupBox: UIView!
    @IBOutlet weak var selectedEpisodeYearLabel: UILabel!
    @IBOutlet weak var selectedEpisodePopupExitButton: UIImageView!
    @IBOutlet weak var selectedEpisodeDescriptionLabel: UILabel!
    @IBOutlet weak var selectedEpisodePlaceImageView: UIImageView!
    @IBOutlet weak var selectedEpisodePopupStartButton: UIButton!
    
    
    
    //에피 선택 후 팝업에서 시작하기 버튼 눌렀을 때
    @IBAction func selectedEpisodePopupStartButtonAction(_ sender: Any) {
        openGettingStartPopup()
    }
    
    //이전 기록 보기 버튼
    @IBAction func openEpisodeHistoryAction(_ sender: Any) {
        guard let currentEpisode = currentEpisode else { return }
        let dataToSend = currentEpisode.chatHistory
        performSegue(withIdentifier: "textSegue", sender: dataToSend)
    }
    
    
    
   
    //-------------------두 번째 팝업----------------
    @IBOutlet var gettingStartPopup: UIView!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    //예 버튼 눌렀을 때
    @IBAction func continueButtonAction(_ sender: Any) {
        guard let currentEpisode = currentEpisode else { return }
        let dataToSend = currentEpisode
        currentChatArray.removeAll()
        indexNumber = 0   
        player.dayId = currentEpisode.episodeID
        // 세이브포인트 버튼 테블뷰로 바꾸고 인덱스값 수정하기
        player.currentChatId = currentEpisode.timelineSavePoint[0].storyBlockIndex
        performSegue(withIdentifier: "fromTimelineToMaingameSegue", sender: dataToSend)
        }
    
    //아니오 버튼 눌렀을 때
    @IBAction func exitButtonAction(_ sender: Any) {
        gettingStartPopup.removeFromSuperview()
    }
    
    
    
    
    
    
    
    
  
    //첫 번째 팝업 여는 함수
    func openSelectedEpisodePopup(indexPath: IndexPath) {
        currentEpisode = player.currentEpisodes[indexPath.row]
        
        guard let currentEpisode = currentEpisode else { return }
        self.view.addSubview(selectedEpisodePopup)
        selectedEpisodeYearLabel.text = "\(currentEpisode.episodeYear)년"
        selectedEpisodeDescriptionLabel.text = currentEpisode.episodeDesciption
        selectedEpisodePlaceImageView.image = UIImage(named: currentEpisode.episodePlaceImage)
    }
    
    //첫 번째 팝업에서 두 번째 팝업 넘어가는 함수
    func openGettingStartPopup() {
        selectedEpisodePopup.removeFromSuperview()
        self.view.addSubview(gettingStartPopup)
        //이 문구는 베리가 넘겨주면 넣을 예정
        warningLabel.text = "현재 진행 중인 게임을 그만두고, 선택한 지점부터 사건을 재시작하여 이전 사건 기록이 사라집니다.\n\n계속하시겠습니까?"
    }
    
    //팝업 디자인하는 함수
    func designSelectedEpisodePopup(popupView: UIView) {
        
    }
}

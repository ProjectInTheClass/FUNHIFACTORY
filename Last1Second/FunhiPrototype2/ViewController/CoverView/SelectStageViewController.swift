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
    var touched: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        designButton()
     
//        let tap = UILongPressGestureRecognizer(target: self, action: #selector(changeColorObjc))
//                tap.minimumPressDuration = 0
//        cellBackground.addGestureRecognizer(tap)
    }
//    @objc func changeColorObjc(gesture: UITapGestureRecognizer) {
//        if gesture.state == .began {
//            cellBackground.backgroundColor = UIColor.darkGray
//                return
//            }
//
//            if gesture.state == .changed {
//                print("very likely, just that the finger wiggled around while the user was holding down the button. generally, just ignore this")
//                return
//            }
//
//            if gesture.state == .possible || gesture.state == .recognized {
//                print("in almost all cases, simply ignore these two, unless you are creating very unusual custom subclasses")
//                cellBackground.backgroundColor = UIColor.lightGray
//                //popup open
//                return
//            }
//        }
//

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func designButton() {
        
        lockedView.layer.cornerRadius = 12
        leftBox.layer.cornerRadius = 8
        leftBox.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        cellBackground.layer.cornerRadius = 8
       
        progressView.trackColor = UIColor(red: 0.333, green: 0.429, blue: 0.529, alpha: 1)
        progressView.progressColor = UIColor(red: 0.78, green: 0.89, blue: 1, alpha: 1)
        progressView.centerCircleColor = UIColor(red: 0.521, green: 0.646, blue: 0.771, alpha: 1)
      
        progressView.finishImageView.layer.cornerRadius = 3
        progressView.finishImageView.setShadow(color: UIColor(red: 1, green: 1, blue: 1, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 5)
        progressView.progressNumberString.font = UIFont(name: "NanumSquareEB", size: 10)
      
        progressBackgroundView.setShadow(color: UIColor(red: 0.325, green: 0.455, blue: 0.584, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 4)
    }
    
 

}
  


class SelectStageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
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
        // 완료/미완료한 체크박스 이미지 이름 : trueClear / falseClear
       
        if player.currentEpisodes[selectedStageIndex].episodeID == "ending" {
            cell.lockedView.isHidden = checkEndingOpenTiming(playerEpisodes: player.currentEpisodes)
        } else {
            cell.lockedView.isHidden = true
        }
        if selectedRowIndex != nil && selectedRowIndex == selectedStageIndex{
            cell.cellBackground.backgroundColor = .darkGray
                  }else{
                     
                  }
        cell.selectionStyle = .none
        return cell
    }
    
   
    
    var selectedRowIndex: Int?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
   
    @IBOutlet weak var selectStageTableView: UITableView!
 
    
    
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
    @IBOutlet weak var selectedPopupStartButtonOutlet: UIButton!
    @IBOutlet weak var selectedPopupSupTitleLabel: UILabel!
    
    @IBAction func selectedPopupStartButton(_ sender: Any) {
        
        updateCurrentEpisode()
        performSegue(withIdentifier: "goToChapterCoverSegue", sender: nil)
        
    }
    func updateCurrentEpisode() {
        previousEpisodeID = player.dayId
        player.dayId = selectedEP.episodeID
        player.indexNumber = 0
        player.currentEpisodes[strToIndex(str: player.dayId)].isCleared = false
//        player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex = "001"
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
        selectedPopupDescriptionLabel.setLineSpacing(lineSpacing: 6)
        selectedPopupDescriptionLabel.textAlignment = .center
        
        selectedPopupBox.layer.borderWidth = 4
        selectedPopupBox.layer.borderColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1).cgColor
        selectedPopup.bounds = self.view.bounds
        selectedPopup.center = self.view.center
     
        
        selectedPopupTopbar.layer.cornerRadius = 10
        selectedPopupTopbar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
   
        
        lockedPopupLabel.setLineSpacing(lineSpacing: 6)
        lockedPopupLabel.textAlignment = .center
        lockedPopupBox.layer.cornerRadius = 20
        lockedPopupBox.layer.borderWidth = 6
        lockedPopupBox.layer.borderColor = UIColor(red:0.647, green: 0.737, blue: 0.812, alpha: 1).cgColor
        
        
        lockedPopupLabel.setLineSpacing(lineSpacing: 6)
        lockedPopupLabel.textAlignment = .center
    }
    
    //초기화 시키느라 이래 됨
    var selectedEP = Episode(episodeID: "", episodePlace: "", episodeYear: 0, episodeKingYear: "", episodeShortDesciption: "", episodeDesciption: "", episodePlaceImage: "", episodeCoverImage: "", isCleared: true, chatHistory: [], storyBlocks: [:], currentCharacterNote: [], currentCaseNote: [], currentAlbumImages: [], timelineCheckPoint: [], currentStoryBlockIndex: "")
    
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
    
    //---------에피소드 잠금 팝업--------
    
    
    @IBOutlet var lockedPopup: UIView!
    @IBOutlet weak var lockedPopupBox: UIView!
    @IBOutlet weak var lockedPopupImageView: UIImageView!
    @IBOutlet var lockedPopupLabel: UILabel!
    @IBOutlet var lockedPopupOkayButton: UIButton!
    @IBAction func thirdPopupOkayButtonTouched(_ sender: Any) {
        lockedPopup.removeFromSuperview()
    }
    
    //얼러트 팝업 여는 함수
    func openLockedPopup(isEpiloguePopup: Bool) {
        lockedPopup.center = self.view.center
        lockedPopup.bounds = self.view.bounds
        self.view.addSubview(lockedPopup)
        let popupText: String
        switch isEpiloguePopup {
        case true:
            popupText = "이 에피소드는 모든 사건을 해결한 후에 진행할 수 있습니다."
        case false:
            popupText = "이 사건은 아직 제작 중입니다.\n다음 업데이트 때 만나요!"
        }
       
        lockedPopupLabel.text = popupText
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
   
        return UITableView.automaticDimension
                
    }
    
    
    
    @IBAction func unwindToSelectStage(_ unwindSegue: UIStoryboardSegue) {
        _ = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
    
}




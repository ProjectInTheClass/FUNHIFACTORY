//
//  HomeNewSelecteStageViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/06/07.
//

import UIKit

class HomeNewSelecteStageViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

  

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return player.currentEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectStageTableViewCell", for: indexPath) as! SelectStageTableViewCell
        cell.episodePlace.text = player.currentEpisodes[indexPath.row].episodePlace
        cell.episodeYear.text = "\(player.currentEpisodes[indexPath.row].episodeYear)년"
        cell.episodePlaceImage.image = UIImage(named: player.currentEpisodes[indexPath.row].episodePlaceImage)
        // 완료/미완료한 체크박스 이미지 이름 : trueClear / falseClear
        
        if player.currentEpisodes[indexPath.row].episodeID == "ending" {
            cell.lockedView.isHidden = checkEndingOpenTiming(playerEpisodes: player.currentEpisodes)
        } else {
            cell.lockedView.isHidden = true
        }
        if selectedRowIndex != nil && selectedRowIndex == indexPath.row {
            cell.cellBackground.backgroundColor = .darkGray
        }else{
                     
        }
        
        
        //현재 스토리블럭 인덱스 int로 변환 잘 되었다면
        if let currentStoryBlockIndex = Int(player.currentEpisodes[indexPath.row].currentStoryBlockIndex) {
            print("currentStoryBlockIndex: \(currentStoryBlockIndex)")
            
            let currentEpisodeTotalStoryBlockCount = player.currentEpisodes[indexPath.row].storyBlocks.count
            
            let progressValue = (Double(currentStoryBlockIndex)/Double(currentEpisodeTotalStoryBlockCount))
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 143
    }
    var selectedRowIndex: Int?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let dataToSend: Episode
        dataToSend = player.currentEpisodes[indexPath.row]
        player.dayIndex = indexPath.row
        
        if dataToSend.episodeID != "ending" {
            openStagePopup(indexPath: indexPath)
        } else {
            openLockedPopup()
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
    @IBOutlet weak var selectedPopupStartButtonOutlet: UIButton!
    @IBOutlet weak var selectedPopupSupTitleLabel: UILabel!
    
    @IBAction func selectedPopupStartButton(_ sender: Any) {
        
        player.dayId = selectedEP.episodeID
        
        player.currentEpisodes[strToIndex(str: selectedEP.episodeID)].isStarted = true
        performSegue(withIdentifier: "goToChapterCoverSegue", sender: nil)
        
    }
    @IBAction func selectedPopupExitButton(_ sender: Any) {
        selectedPopup.removeFromSuperview()
    }
    
    func updatePopup(indexPath: IndexPath) {
        selectedPopupYearLabel.text = "\(player.currentEpisodes[indexPath.row].episodeYear)년"
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
     
        selectedEP = player.currentEpisodes[indexPath.row]
        //print(selectedEP)
        selectedPopupYearLabel.text = "\(selectedEP.episodeYear)년"
        selectedPopupPlaceImage.image = UIImage(named: selectedEP.episodePlaceImage)
        selectedPopupDescriptionLabel.text = selectedEP.episodeShortDesciption
        selectedPopupSupTitleLabel.text = "\(selectedEP.episodeKingYear),\(selectedEP.episodePlace)"
        
        selectedPopupStartButtonOutlet.setTitle("여기서 시작하기", for: .normal)
        selectedPopupStartButtonOutlet.isEnabled = true
        
        
        if player.currentEpisodes[indexPath.row].storyBlocks.isEmpty {
            selectedPopupStartButtonOutlet.isEnabled = false
            selectedPopupStartButtonOutlet.setTitle("준비 중입니다.", for: .normal)
        }
        self.view.addSubview(selectedPopup)
    }
    
    
//-----------에피 잠김 알림 팝업 -------------
    
    
    @IBOutlet var lockedPopup: UIView!
    @IBOutlet weak var lockedPopupBox: UIView!
    @IBOutlet weak var lockedPopupImageView: UIImageView!
    @IBOutlet var lockedPopupLabel: UILabel!
    @IBOutlet var lockedPopupOkayButton: UIButton!
    @IBAction func lockedPopupOkayButtonTouched(_ sender: Any) {
        lockedPopup.removeFromSuperview()
    }
    
    
    
    
    func openLockedPopup() {
        self.view.addSubview(lockedPopup)
        lockedPopupLabel.text = "이 에피소드는 모든 사건을 해결한 후에 진행할 수 있습니다."
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
    
    @IBAction func unwindToSelectStage(_ unwindSegue: UIStoryboardSegue) {
        _ = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
    //얼러트 팝업 여는 함수
    

}

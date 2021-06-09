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
        cell.checkBox.backgroundColor = player.currentEpisodes[indexPath.row].isCleared ? UIColor(red: 0.42, green: 0.498, blue: 0.58, alpha: 1) : .white
        cell.checkImageView.isHidden = player.currentEpisodes[indexPath.row].isCleared ? false : true
        if player.currentEpisodes[indexPath.row].episodeID == "ending" {
            cell.lockedView.isHidden = checkEndingOpenTiming(playerEpisodes: player.currentEpisodes)
        } else {
            cell.lockedView.isHidden = true
        }
        if selectedRowIndex != nil && selectedRowIndex == indexPath.row{
            cell.cellBackground.backgroundColor = .darkGray
                  }else{
                     
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
        
        if dataToSend.isCleared {
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
    @IBOutlet weak var selectedPopup: UIView!
    @IBOutlet var selectedPopupBackground: UIView!
    
    @IBOutlet weak var selectedPopupYearLabel: UILabel!
    @IBOutlet weak var selectedPopupTopbar: UIView!
    @IBOutlet weak var selectedPopupPlaceImage: UIImageView!
    @IBOutlet weak var selectedPopupDescriptionLabel: UILabel!
    @IBOutlet weak var selectedPopupStartButtonOutlet: UIButton!
    @IBOutlet weak var selectedPopupSupTitleLabel: UILabel!
    
    @IBAction func selectedPopupStartButton(_ sender: Any) {
        
        player.dayId = selectedEP.episodeID
//        player.currentChatId = "001" //기본 시작id로 지정하기
        performSegue(withIdentifier: "goToChapterCoverSegue", sender: nil)
        
    }
    @IBAction func selectedPopupExitButton(_ sender: Any) {
        selectedPopupBackground.removeFromSuperview()
    }
    
    func updatePopup(indexPath: IndexPath) {
        selectedPopupYearLabel.text = "\(player.currentEpisodes[indexPath.row].episodeYear)년"
    }
    func designPopup() {
        
        selectedPopupYearLabel.font = UIFont(name: "NEXONLv2GothicBold", size: 26)
        selectedPopupSupTitleLabel.font = UIFont(name: "NanumSquareEB", size: 15)
        selectedPopupDescriptionLabel.font = UIFont(name: "NanumSquareB", size: 18)
        selectedPopupDescriptionLabel.setLineSpacing(lineSpacing: 6)
        selectedPopupDescriptionLabel.textAlignment = .center
        selectedPopup.layer.borderWidth = 4
        selectedPopup.layer.borderColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1).cgColor
        selectedPopupBackground.bounds = self.view.bounds
        selectedPopupBackground.center = self.view.center
     
        
        selectedPopupTopbar.layer.cornerRadius = 10
        selectedPopupTopbar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
//        selectedPopupStartButtonOutlet.layer.shadowColor = UIColor(red: 0.442, green: 0.562, blue: 0.662, alpha: 1).cgColor
//        selectedPopupStartButtonOutlet.layer.shadowOpacity = 1
//        selectedPopupStartButtonOutlet.layer.shadowRadius = 0
//        selectedPopupStartButtonOutlet.layer.shadowOffset = CGSize(width: 0, height: 4)
        
       
    }
    
    //초기화 시키느라 이래 됨
    var selectedEP = Episode(episodeID: "", episodePlace: "", episodeYear: 0, episodeKingYear: "", episodeShortDesciption: "", episodeDesciption: "", episodePlaceImage: "", episodeCoverImage: "", isCleared: true, chatHistory: [], storyBlocks: [:], currentCharacterNote: [], currentCaseNote: [], currentAlbumImages: [], timelineCheckPoint: [])
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
        self.view.addSubview(selectedPopupBackground)
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
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
    

}
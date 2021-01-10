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
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var leftBox: UIView!
    @IBOutlet weak var checkBox: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        designButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func designButton() {
        leftBox.layer.cornerRadius = 8
        leftBox.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        cellBackground.layer.borderWidth = 2.5
        cellBackground.layer.borderColor = CGColor(red: 0.106, green: 0.157, blue: 0.22, alpha: 1)
        cellBackground.layer.cornerRadius = 8
           
        let shadowPath0 = UIBezierPath(roundedRect: cellBackground.bounds, cornerRadius: 8)
          
        cellBackground.layer.shadowPath = shadowPath0.cgPath
        cellBackground.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        cellBackground.layer.shadowOpacity = 1
        cellBackground.layer.shadowRadius = 0
        cellBackground.layer.shadowOffset = CGSize(width: 7, height: 7)
        cellBackground.layer.position = cellBackground.center
            
        
        
        checkBox.layer.cornerRadius = 8
        checkBox.layer.borderWidth = 2
        checkBox.layer.borderColor = UIColor(red: 0.106, green: 0.157, blue: 0.22, alpha: 1).cgColor
        
    }

}
  


class SelectStageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
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
        cell.checkBox.backgroundColor = player.currentEpisodes[indexPath.row].isCleared ? UIColor(red: 0.533, green: 0.533, blue: 0.533, alpha: 1) : .white
        cell.checkImageView.isHidden = player.currentEpisodes[indexPath.row].isCleared ? false : true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 147
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataToSend: Episode
        dataToSend = player.currentEpisodes[indexPath.row]
        
        
        openStagePopup(indexPath: indexPath)
        
        
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
        
        //나중에 필요한 정보 넣을 것
        performSegue(withIdentifier: "goToChapterCoverSegue", sender: nil)
        
    }
    @IBAction func selectedPopupExitButton(_ sender: Any) {
        selectedPopupBackground.removeFromSuperview()
    }
    
    func updatePopup(indexPath: IndexPath) {
        selectedPopupYearLabel.text = "\(player.currentEpisodes[indexPath.row].episodeYear)년"
    }
    func designPopup() {
        
        selectedPopupBackground.bounds = self.view.bounds
        selectedPopupBackground.center = self.view.center
        selectedPopup.layer.cornerRadius = 10
        selectedPopup.layer.borderWidth = 4
        selectedPopup.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        selectedPopupBackground.bounds = self.view.bounds
        selectedPopupBackground.center = self.view.center
        selectedPopupStartButtonOutlet.layer.cornerRadius = 3
        selectedPopupStartButtonOutlet.layer.borderWidth = 1.5
        selectedPopupStartButtonOutlet.layer.borderColor = UIColor(red: 0.106, green: 0.157, blue: 0.22, alpha: 1).cgColor
        selectedPopupTopbar.layer.cornerRadius = 10
        selectedPopupTopbar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    var selectedEP = Episode(episodeID: "", episodePlace: "", episodeYear: 0, episodeKingYear: "", episodeDesciption: "", episodePlaceImage: "", episodeCoverImage: "", isCleared: true, chatHistory: [], storyBlocks: [:], currentCharacterNote: [], currentCaseNote: [], currentAlbumImages: [], timelineSavePoint: [])
    func openStagePopup(indexPath: IndexPath) {
     
        selectedEP = player.currentEpisodes[indexPath.row]
        print(selectedEP)
        selectedPopupYearLabel.text = "\(selectedEP.episodeYear)년"
        selectedPopupPlaceImage.image = UIImage(named: selectedEP.episodePlaceImage)
        selectedPopupDescriptionLabel.text = selectedEP.episodeDesciption
        selectedPopupSupTitleLabel.text = "\(selectedEP.episodeKingYear),\(selectedEP.episodePlace)"
        
        selectedPopupStartButtonOutlet.setTitle("여기서 시작하기", for: .normal)
        selectedPopupStartButtonOutlet.isEnabled = true
        selectedPopupStartButtonOutlet.layer.cornerRadius = 3
        selectedPopupStartButtonOutlet.layer.borderWidth = 2
        selectedPopupStartButtonOutlet.layer.borderColor = UIColor(red: 0.517, green: 0.517, blue: 0.517, alpha: 1).cgColor
        if player.currentEpisodes[indexPath.row].storyBlocks.count == 0 {
            selectedPopupStartButtonOutlet.isEnabled = false
            selectedPopupStartButtonOutlet.setTitle("준비 중입니다.", for: .normal)
        }
        self.view.addSubview(selectedPopupBackground)
    }
}


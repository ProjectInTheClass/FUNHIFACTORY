//
//  NoteViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/29.
//

import UIKit


class NoteSmallGameCharacterTableViewCell: UITableViewCell {
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var likabilityBackgroundView: UIView!
    @IBOutlet weak var likabilityProgressView: UIView!
    @IBOutlet weak var lockedView: UIView!
    @IBOutlet weak var likabilityProgressWidth: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func designCell() {
        lockedView.layer.cornerRadius = 7
        lockedView.layer.borderWidth = 3
        lockedView.layer.borderColor = UIColor(red: 0.314, green: 0.471, blue: 0.6, alpha: 1).cgColor
        
        cellBackgroundView.layer.cornerRadius = 7
        cellBackgroundView.layer.borderWidth = 3
        cellBackgroundView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        
       
        likabilityBackgroundView.layer.cornerRadius = likabilityBackgroundView.frame.height/2
        likabilityBackgroundView.layer.borderWidth = 0.7
        likabilityBackgroundView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        
        
        likabilityProgressView.layer.cornerRadius = likabilityBackgroundView.frame.height/2
        likabilityProgressView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
}

//------------------------------------------------------------------------------------------------
class NoteGameCharacterTableViewCell: UITableViewCell {


    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var achievementLabel: UILabel!
    @IBOutlet weak var lockedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func designCell() {
        descriptionLabel.setLineSpacing(lineSpacing: 3.0)
        lockedView.layer.cornerRadius = 7
        lockedView.layer.borderWidth = 3
        lockedView.layer.borderColor = UIColor(red: 0.314, green: 0.471, blue: 0.6, alpha: 1).cgColor
        
        cellBackgroundView.layer.cornerRadius = 7
        cellBackgroundView.layer.borderWidth = 3
        cellBackgroundView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        profileImage.layer.cornerRadius = profileImage.frame.width/2
    }
}
//------------------------------------------------------------------------------------------------
class NoteCaseTableViewCell: UITableViewCell {

    @IBOutlet weak var caseNameLabel: UILabel!
    @IBOutlet weak var caseDescriptionLabel: UILabel!
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var lockedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func designCell() {
        lockedView.layer.cornerRadius = 7
        lockedView.layer.borderWidth = 3
        lockedView.layer.borderColor = UIColor(red: 0.314, green: 0.471, blue: 0.6, alpha: 1).cgColor
        
        cellBackgroundView.layer.cornerRadius = 7
        cellBackgroundView.layer.borderWidth = 3
        cellBackgroundView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
    }
}

class DesignTableViewCell: UITableViewCell {
    @IBOutlet var springImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
//------------------------------------------------------------------------------------------------
class NoteViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    enum NoteTitle {
        case gameCharacters
        case cases
    }
    enum NotePageNumber {
        case first
        case second
        case third
        case fourth
        case fifth
    }
    
    
    //현재 수첩 페이지의 몇 번째 쪽인지(탭바) 구별해주는 변수의 Int 타입
    var currentNotePageInt: Int = 0
    var cellHeight: Int = 300
    //현재 수첩이 인물 페이지인지, 사건 페이지인지 구별해주는 변수
    var currentNoteTitle: NoteTitle = .gameCharacters {
        didSet {
            let currentEpisodes = player.currentEpisodes
            noteTableView.reloadData()
            if self.currentNoteTitle == .gameCharacters {
                page1Button.isHidden = false
                page1Button.setTitle("기본", for: .normal)
            } else {
                currentNotePageInt = 1
                page1Button.isHidden = true
                
            }
            
            page2Button.setTitle(String(currentEpisodes[1].episodeYear), for: .normal)
            page3Button.setTitle(String(currentEpisodes[2].episodeYear), for: .normal)
            page4Button.setTitle(String(currentEpisodes[3].episodeYear), for: .normal)
            page5Button.setTitle(String(currentEpisodes[4].episodeYear), for: .normal)
        }
    }
  
    
  //---------테이블 뷰-----------------
    
    @IBOutlet weak var noteTableView: UITableView!
    @IBOutlet var designTableView: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowInSectionsCount = 0
        guard tableView == noteTableView else {
            return 12
        }
        if currentNoteTitle == .gameCharacters {
            rowInSectionsCount = player.currentEpisodes[currentNotePageInt].currentCharacterNote.count
        }
        if currentNoteTitle == .cases {
            rowInSectionsCount = player.currentEpisodes[currentNotePageInt].currentCaseNote.count
        }
        return rowInSectionsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //인물 창일 때
        let currentEpisode = player.currentEpisodes[currentNotePageInt]
        guard tableView == noteTableView else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "designTableViewCell", for: indexPath) as! DesignTableViewCell
            cell.springImageView.image = UIImage(named: "spring image")
            return cell
        }
        if currentNoteTitle == .gameCharacters {
            
            
            //큰 인물 셀
            if currentEpisode.currentCharacterNote[indexPath.row].name == "이단희" || currentEpisode.currentCharacterNote[indexPath.row].name == "휘령" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "gameCharacterCell", for: indexPath) as! NoteGameCharacterTableViewCell
                cell.selectionStyle = .none
                cell.nameLabel.text = currentEpisode.currentCharacterNote[indexPath.row].name
                cell.descriptionLabel.text = currentEpisode.currentCharacterNote[indexPath.row].description
                cell.profileImage.image = UIImage(named: currentEpisode.currentCharacterNote[indexPath.row].profileImage)
                cell.achievementLabel.text = "업적 \(player.clearedAchievementCount)/\(player.currentAchievementInfo.count)"
                print(currentEpisode.currentCharacterNote[indexPath.row].isLocked )
                if currentEpisode.currentCharacterNote[indexPath.row].isLocked {
                    cell.lockedView.isHidden = false
                } else {
                    cell.lockedView.isHidden = true
                    
                }
                cellHeight = 267
                if cell.nameLabel.text != "이단희" {
                   cell.achievementLabel.text = ""
                }
                return cell
            // 작은 인물 셀
            } else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "smallGameCharacterCell", for: indexPath) as! NoteSmallGameCharacterTableViewCell
                cell.selectionStyle = .none
                cell.nameLabel.text = currentEpisode.currentCharacterNote[indexPath.row].name
                cell.descriptionLabel.text = currentEpisode.currentCharacterNote[indexPath.row].description
                cell.profileImageView.image = UIImage(named: currentEpisode.currentCharacterNote[indexPath.row].profileImage)
                cell.likabilityProgressWidth.constant = cell.likabilityBackgroundView.frame.width*CGFloat(player.currentEpisodes[currentNotePageInt].currentCharacterNote[indexPath.row].likability)/100
                if currentEpisode.currentCharacterNote[indexPath.row].isLocked {
                    cell.lockedView.isHidden = false
                } else {
                    cell.lockedView.isHidden = true
                    
                }
                cellHeight = 146
                return cell
            }
        //사건 창일 때
        } else {
           
            let currentCase = player.currentEpisodes[currentNotePageInt].currentCaseNote[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "caseCell", for: indexPath) as! NoteCaseTableViewCell
            
            cell.selectionStyle = .none
            cell.caseNameLabel.text = currentCase.title
            cell.caseDescriptionLabel.text = currentCase.shortDescription
            if currentCase.isLocked {
                cell.lockedView.isHidden = false
            } else {
                cell.lockedView.isHidden = true
                
            }
            cellHeight = 121
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //플레이어 해금된 상태야 셀 눌림.
        
        if currentNoteTitle == .gameCharacters {
            guard !player.currentEpisodes[currentNotePageInt].currentCharacterNote[indexPath.row].isLocked else { return }
            let dataToSend = player.currentEpisodes[currentNotePageInt].currentCharacterNote[indexPath.row]
            //이단희 셀일 때
            if player.currentEpisodes[currentNotePageInt].currentCharacterNote[indexPath.row].name == "이단희" {
                performSegue(withIdentifier: "goToUserNoteView", sender: dataToSend)
            //휘령 셀일 때
            } else if player.currentEpisodes[currentNotePageInt].currentCharacterNote[indexPath.row].name == "휘령" {
                performSegue(withIdentifier: "goToHwiryeongNoteView", sender: dataToSend)
            // 그 외 인물 셀일 때
            } else {
                performSegue(withIdentifier: "sibal", sender: dataToSend)
            }
            
            
            
        }
        //사건 셀일 때
        if currentNoteTitle == .cases {
            guard !player.currentEpisodes[currentNotePageInt].currentCaseNote [indexPath.row].isLocked else { return }
            caseNameLabel.text = player.currentEpisodes[currentNotePageInt].currentCaseNote[indexPath.row].title
            caseLongDescriptionLabel.text = player.currentEpisodes[currentNotePageInt].currentCaseNote[indexPath.row].longDescription
            popupViewOn(blackView: casePopupBackgroundView, popupView: casePopupBoxView, priviousScale: 0.6, afterScale: 1.0)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToUserNoteView" {
             let destination = segue.destination as! NoteUserViewController
             if let gameCharacter = sender as? GameCharacter {
                 destination.recievedGameCharacter = gameCharacter
             }
        }
        if segue.identifier == "sibal" {
             let destination = segue.destination as! NoteGameCharacterViewController
             if let gameCharacter = sender as? GameCharacter {
                destination.recievedGameCharacter = gameCharacter
             }
        }
        if segue.identifier == "goToHwiryeongNoteView" {
             let destination = segue.destination as! NoteHeeryeongViewController
             if let gameCharacter = sender as? GameCharacter {
                 destination.recievedGameCharacter = gameCharacter
             }
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == designTableView {
            return 80
        } else {
            return CGFloat(cellHeight)
        }
       
    }
//------여기부터 이외 아웃렛, 액션-------------
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet weak var noteBackgroundView: UIView!
    @IBOutlet weak var gameCharactersBookmarkView: UIView!
    @IBOutlet weak var gameCharactersBookmarkLineView: UIView!
    @IBOutlet weak var casesBookmarkView: UIView!
    @IBOutlet weak var casesBookmarkLineView: UIView!
    
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
    func changePageDesign() {
        if currentNoteTitle == .gameCharacters {
            gameCharactersBookmarkView.backgroundColor = UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1)
            casesBookmarkView.backgroundColor = UIColor(red: 0.341, green: 0.478, blue: 0.604, alpha: 1)
            
            setButtonTitleColor(newPageNumber: 0)
         
            
        } else {
            gameCharactersBookmarkView.backgroundColor = UIColor(red: 0.341, green: 0.478, blue: 0.604, alpha: 1)
            casesBookmarkView.backgroundColor = UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1)
            
            setButtonTitleColor(newPageNumber: 1)
          
        }
    }
    @IBOutlet weak var page1Button: UIButton!
    @IBOutlet weak var page2Button: UIButton!
    @IBOutlet weak var page3Button: UIButton!
    @IBOutlet weak var page4Button: UIButton!
    @IBOutlet weak var page5Button: UIButton!
//    @IBOutlet weak var page1ButtonStackView: UIStackView!
    @IBOutlet var pageButtons: [UIButton]!
    
    
    //--------------사건 팝업----------------
    @IBOutlet var casePopupBackgroundView: UIView!
    @IBOutlet weak var casePopupBoxView: UIView!
    @IBOutlet weak var casePopopBackgroundViewTopBar: UIView!
    @IBOutlet weak var caseNameLabel: UILabel!
    @IBOutlet weak var caseLongDescriptionLabel: UILabel!
    @IBAction func exitCasePopupAction(_ sender: Any) {
        popupViewOff(popupView: casePopupBoxView, blackView: casePopupBackgroundView, priviousScale: 1.0, afterScale: 0.3)
    }
   
  
    
    
    @IBAction func openGameCharactersNoteAction(_ sender: Any) {
        currentNoteTitle = .gameCharacters
        currentNotePageInt = 0
        changePageDesign()
        noteTableView.reloadData()
    }
    @IBAction func openCasesNoteAction(_ sender: Any) {
        currentNoteTitle = .cases
        currentNotePageInt = 1
        changePageDesign()
        noteTableView.reloadData()
    }
    @IBAction func page1ButtonAction(_ sender: Any) {
        setButtonTitleColor(newPageNumber: 0)
        noteTableView.reloadData()
    }
    @IBAction func page2ButtonAction(_ sender: Any) {
        setButtonTitleColor(newPageNumber: 1)
        noteTableView.reloadData()
    }
    @IBAction func page3ButtonAction(_ sender: Any) {
        setButtonTitleColor(newPageNumber: 2)
        noteTableView.reloadData()
    }
    @IBAction func page4ButtonAction(_ sender: Any) {
        setButtonTitleColor(newPageNumber: 3)
        noteTableView.reloadData()
    }
    @IBAction func page5ButtonAction(_ sender: Any) {
        setButtonTitleColor(newPageNumber: 4)
        noteTableView.reloadData()
    }
    
    func setButtonTitleColor(newPageNumber: Int) {
        let buttons = [page1Button, page2Button, page3Button, page4Button, page5Button]
        if let button = buttons[currentNotePageInt] {
            button.setTitleColor(UIColor(red: 0.109, green: 0.201, blue: 0.275, alpha: 1), for: .normal)
            button.backgroundColor = UIColor(red: 0.341, green: 0.478, blue: 0.604, alpha: 1)
            currentNotePageInt = newPageNumber
        }
        if let button = buttons[currentNotePageInt] {
            button.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            button.backgroundColor = UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1)
        }
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.noteTableView.delegate = self
        self.noteTableView.dataSource = self
        self.designTableView.delegate = self
        self.designTableView.dataSource = self
        designObjects()
        currentNotePageInt = 0
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.currentNoteTitle = .gameCharacters
        changePageDesign()
        
        noteTableView.reloadData()
    }
    
       
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    
}


extension NoteViewController {
    
    func designObjects() {
   
     
    //--------------수첩 --------------
    
    noteBackgroundView.layer.cornerRadius = 5
   
        noteBackgroundView.layer.shadowColor = UIColor(red: 0.174, green: 0.292, blue: 0.404, alpha: 1).cgColor
        noteBackgroundView.layer.shadowOffset = CGSize(width: 26, height: -17)
        noteBackgroundView.layer.shadowOpacity = 1
        noteBackgroundView.layer.shadowRadius = 0
    
    //--------------수첩 인물/사건 북마크-----
    
    gameCharactersBookmarkView.layer.cornerRadius = 10
    gameCharactersBookmarkView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
   
    casesBookmarkView.layer.cornerRadius = 10
    casesBookmarkView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
       
    
    //--------수첩 페이지 버튼, 하단 줄----------
        
        for button in pageButtons {
            button.layer.cornerRadius = 10
            button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
//    page1Button.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
//    page2Button.setTitleColor(UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), for: .normal)
//    page3Button.setTitleColor(UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), for: .normal)
//    page4Button.setTitleColor(UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), for: .normal)
//    page5Button.setTitleColor(UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), for: .normal)
   
    //사건/인물 페이지 바뀔 때를 대응하는 함슈
    changePageDesign()
    //--------사건 팝업------------------
    casePopupBoxView.layer.cornerRadius = 16
    casePopupBoxView.layer.borderWidth = 4
    casePopupBoxView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        
        casePopopBackgroundViewTopBar.layer.cornerRadius = 16
        casePopopBackgroundViewTopBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
}
    
    func popupViewOn(blackView: UIView, popupView: UIView, priviousScale: CGFloat, afterScale: CGFloat) {
        let backgroundView = self.view!
        //뷰 두 개(이미지, 글씨) 서브뷰로 추가
        
        backgroundView.addSubview(blackView)
        backgroundView.bringSubviewToFront(blackView)
        
        //이미지뷰만 히든 풀고, 뷰들 정렬함. 텍스트뷰는 서서히 나타나는 애니메이션을 위해 알파 0으로 설정해둠.
        blackView.center = backgroundView.center
        popupView.isHidden = false
        popupView.alpha = 0
        blackView.alpha = 1
        popupView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
       
        //애니메이션
        UIView.animate(withDuration: 0.2) {
            popupView.transform = CGAffineTransform(scaleX: afterScale, y: afterScale)
            popupView.alpha = 1
        }
    }
    func popupViewOff(popupView: UIView, blackView: UIView, priviousScale: CGFloat, afterScale: CGFloat) {
        let backgroundView = self.view!
       
     
        popupView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
        
        //애니메이션
        UIView.animate(withDuration: 0.2) {
            popupView.transform = CGAffineTransform(scaleX: afterScale, y: afterScale)
            popupView.alpha = 0
        } completion: { (Bool) in
            UIView.animate(withDuration: 0.1) {
                blackView.alpha = 0
            } completion: { (Bool) in
                blackView.removeFromSuperview()
            }

            
        }
        
    }

}

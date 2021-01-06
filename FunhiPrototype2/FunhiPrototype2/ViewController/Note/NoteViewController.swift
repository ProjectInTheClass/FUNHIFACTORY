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
        cellBackgroundView.layer.cornerRadius = 7
        cellBackgroundView.layer.borderWidth = 3
        cellBackgroundView.layer.borderColor = UIColor(red: 0.416, green: 0.278, blue: 0.18, alpha: 1).cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        
        likabilityBackgroundView.backgroundColor = .white
        likabilityBackgroundView.layer.cornerRadius = likabilityBackgroundView.frame.height/2
        likabilityBackgroundView.layer.borderWidth = 0.7
        likabilityBackgroundView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        likabilityProgressView.layer.backgroundColor = UIColor(red: 0.812, green: 0.311, blue: 0.311, alpha: 1).cgColor
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
        lockedView.layer.cornerRadius = 7
        cellBackgroundView.layer.cornerRadius = 7
        cellBackgroundView.layer.borderWidth = 3
        cellBackgroundView.layer.borderColor = UIColor(red: 0.416, green: 0.278, blue: 0.18, alpha: 1).cgColor
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
        cellBackgroundView.layer.cornerRadius = 7
        cellBackgroundView.layer.borderWidth = 3
        cellBackgroundView.layer.borderColor = UIColor(red: 0.416, green: 0.278, blue: 0.18, alpha: 1).cgColor
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
                page1ButtonStackView.isHidden = false
                page1Button.setTitle("기본", for: .normal)
            } else {
                page1ButtonStackView.isHidden = true
            }
            page2Button.setTitle("\(currentEpisodes[1].episodeName)", for: .normal)
            page3Button.setTitle("\(currentEpisodes[2].episodeName)", for: .normal)
            page4Button.setTitle("\(currentEpisodes[3].episodeName)", for: .normal)
            page5Button.setTitle("\(currentEpisodes[4].episodeName)", for: .normal)
        }
    }
  
    
  //---------테이블 뷰-----------------
    
    @IBOutlet weak var noteTableView: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowInSectionsCount = 0
        if currentNoteTitle == .gameCharacters {
            rowInSectionsCount = player.currentEpisodes[currentNotePageInt].currentCharacterNote.count
        }
        if currentNoteTitle == .cases {
            rowInSectionsCount = player.currentEpisodes[currentNotePageInt].currentCharacterNote.count
        }
        return rowInSectionsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //인물 창일 때
        if currentNoteTitle == .gameCharacters {
            let currentEpisode = player.currentEpisodes[currentNotePageInt]
            
            //큰 인물 셀
            if currentEpisode.currentCharacterNote[indexPath.row].name == "이단희" || currentEpisode.currentCharacterNote[indexPath.row].name == "휘령" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "gameCharacterCell", for: indexPath) as! NoteGameCharacterTableViewCell
                cell.selectionStyle = .none
                cell.nameLabel.text = currentEpisode.currentCharacterNote[indexPath.row].name
                cell.descriptionLabel.text = currentEpisode.currentCharacterNote[indexPath.row].description
                cell.profileImage.image = UIImage(named: currentEpisode.currentCharacterNote[indexPath.row].profileImage)
                cell.achievementLabel.text = currentEpisode.currentCharacterNote[indexPath.row].name
                print(currentEpisode.currentCharacterNote[indexPath.row].isLocked )
                if currentEpisode.currentCharacterNote[indexPath.row].isLocked {
                    cell.lockedView.isHidden = false
                } else {
                    cell.lockedView.isHidden = true
                    
                }
                cellHeight = 267
                if cell.nameLabel.text != "휘령" {
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
                        
                cellHeight = 146
                return cell
            }
        //사건 창일 때
        } else {
           
            let currentEpisodes = player.currentEpisodes
            let cell = tableView.dequeueReusableCell(withIdentifier: "caseCell", for: indexPath) as! NoteCaseTableViewCell
            cell.selectionStyle = .none
            let currentPage = currentEpisodes[currentNotePageInt]
            cell.caseNameLabel.text = currentPage.currentCaseNote[indexPath.row].title
            cell.caseDescriptionLabel.text = currentEpisodes[currentNotePageInt].currentCaseNote[indexPath.row].shortDescription
            cellHeight = 121
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //플레이어 해금된 상태야 셀 눌림.
        guard !player.currentEpisodes[currentNotePageInt].currentCharacterNote[indexPath.row].isLocked else { return }
        if currentNoteTitle == .gameCharacters {
            let dataToSend = player.currentEpisodes[currentNotePageInt].currentCharacterNote[indexPath.row]
            //이단희 셀일 때
            if player.currentEpisodes[currentNotePageInt].currentCharacterNote[indexPath.row].name == "이단희" {
                performSegue(withIdentifier: "goToUserNoteView", sender: dataToSend)
            //휘령 셀일 때
            } else if player.currentEpisodes[currentNotePageInt].currentCharacterNote[indexPath.row].name == "휘령" {
                performSegue(withIdentifier: "goToHwiryeongNoteView", sender: dataToSend)
            // 그 외 인물 셀일 때
            } else {
                performSegue(withIdentifier: "goToOtherGameCharacterView", sender: dataToSend)
            }
            
            
            
        }
        if currentNoteTitle == .cases {
            caseNameLabel.text = player.currentEpisodes[currentNotePageInt].currentCaseNote[indexPath.row].title
            caseLongDescriptionLabel.text = player.currentEpisodes[currentNotePageInt].currentCaseNote[indexPath.row].longDescription
            popupViewOn(priviousScale: 0.6, afterScale: 1.0)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToUserNoteView" {
             let destination = segue.destination as! NoteUserViewController
             if let gameCharacter = sender as? GameCharacter {
                 destination.recievedGameCharacter = gameCharacter
             }
        }
        if segue.identifier == "goToOtherGameCharacterView" {
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
        return CGFloat(cellHeight)
    }
//------여기부터 이외 아웃렛, 액션-------------
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var noteBackgroundView: UIView!
    @IBOutlet weak var gameCharactersBookmarkView: UIView!
    @IBOutlet weak var gameCharactersBookmarkLineView: UIView!
    @IBOutlet weak var casesBookmarkView: UIView!
    @IBOutlet weak var casesBookmarkLineView: UIView!
    
    func changePageDesign() {
        if currentNoteTitle == .gameCharacters {
            gameCharactersBookmarkView.backgroundColor = UIColor(displayP3Red: 0.749, green: 0.631, blue: 0.455, alpha: 1)
            casesBookmarkView.backgroundColor = UIColor(displayP3Red: 0.492, green: 0.406, blue: 0.279, alpha: 1)
            gameCharactersBookmarkLineView.backgroundColor = UIColor(displayP3Red: 0.749, green: 0.631, blue: 0.455, alpha: 1)
            casesBookmarkLineView.backgroundColor = UIColor(displayP3Red: 0.254, green: 0.205, blue: 0.13, alpha: 1)
            
            
        } else {
            gameCharactersBookmarkView.backgroundColor = UIColor(displayP3Red: 0.492, green: 0.406, blue: 0.279, alpha: 1)
            casesBookmarkView.backgroundColor = UIColor(displayP3Red: 0.749, green: 0.631, blue: 0.455, alpha: 1)
            gameCharactersBookmarkLineView.backgroundColor = UIColor(displayP3Red: 0.254, green: 0.205, blue: 0.13, alpha: 1)
            casesBookmarkLineView.backgroundColor = UIColor(displayP3Red: 0.749, green: 0.631, blue: 0.455, alpha: 1)
            page1Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
            page2Button.setTitleColor(UIColor(red: 0.312, green: 0.208, blue: 0.134, alpha: 1), for: .normal)
            page3Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
            page4Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
            page5Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
            page1ButtonLine.backgroundColor = .clear
            page2ButtonLine.backgroundColor = .black
            page3ButtonLine.backgroundColor = .clear
            page4ButtonLine.backgroundColor = .clear
            page5ButtonLine.backgroundColor = .clear
        }
    }
    @IBOutlet weak var page1Button: UIButton!
    @IBOutlet weak var page2Button: UIButton!
    @IBOutlet weak var page3Button: UIButton!
    @IBOutlet weak var page4Button: UIButton!
    @IBOutlet weak var page5Button: UIButton!
    @IBOutlet weak var page1ButtonStackView: UIStackView!
    
    @IBOutlet weak var page1ButtonLine: UIView!
    @IBOutlet weak var page2ButtonLine: UIView!
    @IBOutlet weak var page3ButtonLine: UIView!
    @IBOutlet weak var page4ButtonLine: UIView!
    @IBOutlet weak var page5ButtonLine: UIView!
    //--------------사건 팝업----------------
    @IBOutlet var casePopupView: UIView!
    @IBOutlet weak var casePopopBackgroundView: UIView!
    @IBOutlet weak var casePopopBackgroundViewTopBar: UIView!
    @IBOutlet weak var caseNameLabel: UILabel!
    @IBOutlet weak var caseLongDescriptionLabel: UILabel!
    @IBAction func exitCasePopupAction(_ sender: Any) {
        popupViewOff(priviousScale: 1.0, afterScale: 0.3)
    }
   
  
    
    
    @IBAction func openGameCharactersNoteAction(_ sender: Any) {
        currentNoteTitle = .gameCharacters
        changePageDesign()
    }
    @IBAction func openCasesNoteAction(_ sender: Any) {
        currentNoteTitle = .cases
        currentNotePageInt = 1
        changePageDesign()
    }
    @IBAction func page1ButtonAction(_ sender: Any) {
        currentNotePageInt = 0
        page1Button.setTitleColor(UIColor(red: 0.312, green: 0.208, blue: 0.134, alpha: 1), for: .normal)
        page2Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page3Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page4Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page5Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page1ButtonLine.backgroundColor = .black
        page2ButtonLine.backgroundColor = .clear
        page3ButtonLine.backgroundColor = .clear
        page4ButtonLine.backgroundColor = .clear
        page5ButtonLine.backgroundColor = .clear
        noteTableView.reloadData()
    }
    @IBAction func page2ButtonAction(_ sender: Any) {
        currentNotePageInt = 1
        page1Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page2Button.setTitleColor(UIColor(red: 0.312, green: 0.208, blue: 0.134, alpha: 1), for: .normal)
        page3Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page4Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page5Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page1ButtonLine.backgroundColor = .clear
        page2ButtonLine.backgroundColor = .black
        page3ButtonLine.backgroundColor = .clear
        page4ButtonLine.backgroundColor = .clear
        page5ButtonLine.backgroundColor = .clear
        noteTableView.reloadData()
    }
    @IBAction func page3ButtonAction(_ sender: Any) {
        currentNotePageInt = 2
        page1Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page2Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page3Button.setTitleColor(UIColor(red: 0.312, green: 0.208, blue: 0.134, alpha: 1), for: .normal)
        page4Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page5Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page1ButtonLine.backgroundColor = .clear
        page2ButtonLine.backgroundColor = .clear
        page3ButtonLine.backgroundColor = .black
        page4ButtonLine.backgroundColor = .clear
        page5ButtonLine.backgroundColor = .clear
        noteTableView.reloadData()
    }
    @IBAction func page4ButtonAction(_ sender: Any) {
        currentNotePageInt = 3
        page1Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page2Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page3Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page4Button.setTitleColor(UIColor(red: 0.312, green: 0.208, blue: 0.134, alpha: 1), for: .normal)
        page5Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page1ButtonLine.backgroundColor = .clear
        page2ButtonLine.backgroundColor = .clear
        page3ButtonLine.backgroundColor = .clear
        page4ButtonLine.backgroundColor = .black
        page5ButtonLine.backgroundColor = .clear
        noteTableView.reloadData()
    }
    @IBAction func page5ButtonAction(_ sender: Any) {
        currentNotePageInt = 4
        page1Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page2Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page3Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page4Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        page5Button.setTitleColor(UIColor(red: 0.312, green: 0.208, blue: 0.134, alpha: 1), for: .normal)
        page1ButtonLine.backgroundColor = .clear
        page2ButtonLine.backgroundColor = .clear
        page3ButtonLine.backgroundColor = .clear
        page4ButtonLine.backgroundColor = .clear
        page5ButtonLine.backgroundColor = .black
        noteTableView.reloadData()
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.noteTableView.delegate = self
        self.noteTableView.dataSource = self
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
   
  //--------------상단바--------------
    topBar.layer.shadowColor = UIColor(red: 0, green: 0.11, blue: 0.208, alpha: 1).cgColor
    topBar.layer.shadowOpacity = 1
    topBar.layer.shadowRadius = 26
    topBar.layer.shadowOffset = CGSize(width: 0, height: 12)
    //--------------수첩 --------------
    noteBackgroundView.layer.backgroundColor = UIColor(red: 0.749, green: 0.631, blue: 0.455, alpha: 1).cgColor
    noteBackgroundView.layer.cornerRadius = 5
    noteBackgroundView.layer.borderWidth = 2
    noteBackgroundView.layer.borderColor = UIColor(red: 0.254, green: 0.205, blue: 0.13, alpha: 1).cgColor
    //--------------수첩 인물/사건 북마크-----
    gameCharactersBookmarkView.layer.backgroundColor = UIColor(red: 0.749, green: 0.631, blue: 0.455, alpha: 1).cgColor
    gameCharactersBookmarkView.layer.cornerRadius = 5
    gameCharactersBookmarkView.layer.borderWidth = 2
    gameCharactersBookmarkView.layer.borderColor = UIColor(red: 0.254, green: 0.205, blue: 0.13, alpha: 1).cgColor
    
    casesBookmarkView.layer.backgroundColor = UIColor(red: 0.492, green: 0.406, blue: 0.279, alpha: 1).cgColor
    casesBookmarkView.layer.cornerRadius = 5
    casesBookmarkView.layer.borderWidth = 2
    casesBookmarkView.layer.borderColor = UIColor(red: 0.254, green: 0.205, blue: 0.13, alpha: 1).cgColor
    //--------수첩 페이지 버튼, 하단 줄----------
    page1Button.setTitleColor(UIColor(red: 0.312, green: 0.208, blue: 0.134, alpha: 1), for: .normal)
    page2Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
    page3Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
    page4Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
    page5Button.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
    page1ButtonLine.backgroundColor = .black
    page2ButtonLine.backgroundColor = .clear
    page3ButtonLine.backgroundColor = .clear
    page4ButtonLine.backgroundColor = .clear
    page5ButtonLine.backgroundColor = .clear
    //사건/인물 페이지 바뀔 때를 대응하는 함슈
    changePageDesign()
    //--------사건 팝업------------------
    casePopopBackgroundView.layer.cornerRadius = 7
    casePopopBackgroundView.layer.borderWidth = 2
    casePopopBackgroundView.layer.borderColor = UIColor(red: 0.254, green: 0.205, blue: 0.13, alpha: 1).cgColor
        
        casePopopBackgroundViewTopBar.layer.cornerRadius = 7
        casePopopBackgroundViewTopBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
}
    
    func popupViewOn(priviousScale: CGFloat, afterScale: CGFloat) {
        let backgroundView = self.view!
        //뷰 두 개(이미지, 글씨) 서브뷰로 추가
        self.view.addSubview(casePopupView)
        self.view.bringSubviewToFront(casePopupView)
        
        //이미지뷰만 히든 풀고, 뷰들 정렬함. 텍스트뷰는 서서히 나타나는 애니메이션을 위해 알파 0으로 설정해둠.
        casePopupView.center = backgroundView.center
        casePopupView.isHidden = false
        casePopupView.alpha = 0
      
        casePopupView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
       
        //애니메이션
        UIView.animate(withDuration: 0.1) {
            self.casePopupView.transform = CGAffineTransform(scaleX: afterScale, y: afterScale)
            self.casePopupView.alpha = 1
        }
    }
    func popupViewOff(priviousScale: CGFloat, afterScale: CGFloat) {
        let backgroundView = self.view!
        //뷰 두 개(이미지, 글씨) 서브뷰로 추가
       
        
     
        casePopupView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
       
        //애니메이션
        UIView.animate(withDuration: 0.1) {
            self.casePopupView.transform = CGAffineTransform(scaleX: afterScale, y: afterScale)
            self.casePopupView.alpha = 0
        } completion: { (Bool) in
            self.casePopupView.removeFromSuperview()
        }
        
    }
}

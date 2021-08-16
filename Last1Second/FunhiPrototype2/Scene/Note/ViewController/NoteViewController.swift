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
    @IBOutlet weak var noticeIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lockedView: UIView!
    
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        noticeIcon.isHidden = true
        designCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func designCell() {
        lockedView.layer.cornerRadius = 7
        lockedView.layer.borderWidth = 3
        lockedView.layer.borderColor = UIColor(red: 0.314, green: 0.471, blue: 0.6, alpha: 1).cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        cellBackgroundView.layer.cornerRadius = 10
    }
    func changeShadowAndBorder(view: UIView, shadowColor: UIColor, borderColor: UIColor) {
        view.setShadow(color: shadowColor, offsetX: 0, offsetY: 0, opacity: 1, radius: 5)
        view.setBolder(color: borderColor, width: 4)
    }
  
}

//------------------------------------------------------------------------------------------------
class NoteGameCharacterTableViewCell: UITableViewCell {


    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var noticeIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lockedView: UIView!
    
    @IBOutlet var cellBorderAndShadowView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        noticeIcon.isHidden = true
        designCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func designCell() {
        lockedView.layer.cornerRadius = 37
        cellBackgroundView.layer.cornerRadius = 40
        profileImage.layer.cornerRadius = profileImage.frame.width/2
        cellBorderAndShadowView.layer.cornerRadius = 40
    }
    
    func changeShadowAndBorder(view: UIView, shadowColor: UIColor, borderColor: UIColor) {
        view.setShadow(color: shadowColor, offsetX: 0, offsetY: 0, opacity: 1, radius: 5)
        view.setBolder(color: borderColor, width: 4)
    }
}


//------------------------------------------------------------------------------------------------
class NoteCaseTableViewCell: UITableViewCell {

    @IBOutlet weak var caseNameLabel: UILabel!
    @IBOutlet weak var noticeIcon: UIImageView!
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var lockedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
        noticeIcon.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func designCell() {
        lockedView.layer.cornerRadius = 7
       
        
        cellBackgroundView.layer.cornerRadius = 10
        cellBackgroundView.layer.borderWidth = 3
     
        
        
    }
    
    func changeShadowAndBorder(view: UIView, shadowColor: UIColor, borderColor: UIColor) {
        view.setShadow(color: shadowColor, offsetX: 0, offsetY: 0, opacity: 1, radius: 5)
        view.setBolder(color: borderColor, width: 4)
    }
}

class DesignTableViewCell: UITableViewCell {
    @IBOutlet var springImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
//------------------------------------------------------------------------------------------------
class NoteViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
   
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
        if currentNoteTitleInt == 0 {
            rowInSectionsCount = player.currentEpisodes[currentNotePageInt].currentCharacterNote.count
        }
        if currentNoteTitleInt == 1 {
            rowInSectionsCount = player.currentEpisodes[currentNotePageInt].currentCaseNote.count
        }
        return rowInSectionsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //인물 창일 때--------------------
        let currentEpisode = player.currentEpisodes[currentNotePageInt]
        
        //수첩 테이블 뷰일 때
        guard tableView == noteTableView else {
        
            //수첩 링 이미지
            let cell = tableView.dequeueReusableCell(withIdentifier: "designTableViewCell", for: indexPath) as! DesignTableViewCell
            cell.springImageView.image = UIImage(named: "note ring image")
            return cell
        }
        
        let isCharacterPage = (currentNoteTitleInt == 0)
        let currentCharacter = currentEpisode.currentCharacterNote[indexPath.row]
        //인물 페이지일 때
        if isCharacterPage {
         
           
            //큰 인물 셀
            if currentCharacter.name == "이단희" || currentCharacter.name == "휘령" {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "gameCharacterCell", for: indexPath) as! NoteGameCharacterTableViewCell
                
                cell.selectionStyle = .none
                cell.nameLabel.text = currentCharacter.name
                cell.profileImage.image = UIImage(named: "\(currentCharacter.profileImage)_noteLarge")
                
                print("\(currentCharacter.name) 잠김: \(currentEpisode.currentCharacterNote[indexPath.row].isLocked)")
                
                currentCharacter.isLocked ? (cell.lockedView.isHidden = false) : (cell.lockedView.isHidden = true)
             
                currentCharacter.isLocked ? cell.changeShadowAndBorder(view: cell.cellBorderAndShadowView, shadowColor: UIColor(red: 0.314, green: 0.471, blue: 0.6, alpha: 1), borderColor: UIColor(red: 0.314, green: 0.471, blue: 0.6, alpha: 1)) : cell.changeShadowAndBorder(view: cell.cellBorderAndShadowView, shadowColor: UIColor(red: 0.749, green: 0.824, blue: 0.894, alpha: 1), borderColor: UIColor(red: 0.749, green: 0.824, blue: 0.894, alpha: 1))
                if (!currentCharacter.isChecked)
                {
                    cell.changeShadowAndBorder(view: cell.cellBorderAndShadowView, shadowColor: UIColor.white, borderColor: UIColor.white)
                    cell.backgroundColor = UIColor(red: 0.831, green: 0.886, blue: 0.933, alpha: 1)
                    cell.noticeIcon.isHidden = false
                }
                return cell
            // 작은 인물 셀
            } else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "smallGameCharacterCell", for: indexPath) as! NoteSmallGameCharacterTableViewCell
                
                cell.selectionStyle = .none
                cell.nameLabel.text = currentCharacter.name
                cell.profileImageView.image = UIImage(named: "\(currentCharacter.profileImage)_noteLarge")
                
                currentCharacter.isLocked ? cell.changeShadowAndBorder(view: cell.cellBackgroundView, shadowColor: UIColor(red: 0.314, green: 0.471, blue: 0.6, alpha: 1), borderColor: UIColor(red: 0.314, green: 0.471, blue: 0.6, alpha: 1)) : cell.changeShadowAndBorder(view: cell.cellBackgroundView, shadowColor: UIColor(red: 0.749, green: 0.824, blue: 0.894, alpha: 1), borderColor: UIColor(red: 0.749, green: 0.824, blue: 0.894, alpha: 1))
                
                currentCharacter.isLocked ? (cell.lockedView.isHidden = false) : (cell.lockedView.isHidden = true)
                if (!currentCharacter.isChecked)
                {
                    cell.changeShadowAndBorder(view: cell.cellBackgroundView, shadowColor: UIColor.white, borderColor: UIColor.white)
                    cell.backgroundColor = UIColor(red: 0.831, green: 0.886, blue: 0.933, alpha: 1)
                    cell.noticeIcon.isHidden = false
                }
                return cell
            }
            
        //사건 창일 때
        } else {
           
            let currentCase = player.currentEpisodes[currentNotePageInt].currentCaseNote[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "caseCell", for: indexPath) as! NoteCaseTableViewCell
            
            cell.selectionStyle = .none
            cell.caseNameLabel.text = currentCase.title
            
            currentCase.isLocked ? cell.changeShadowAndBorder(view: cell.cellBackgroundView, shadowColor: UIColor(red: 0.314, green: 0.471, blue: 0.6, alpha: 1), borderColor: UIColor(red: 0.314, green: 0.471, blue: 0.6, alpha: 1)) : cell.changeShadowAndBorder(view: cell.cellBackgroundView, shadowColor: UIColor(red: 0.749, green: 0.824, blue: 0.894, alpha: 1), borderColor: UIColor(red: 0.749, green: 0.824, blue: 0.894, alpha: 1))
            currentCase.isLocked ? (cell.lockedView.isHidden = false) : (cell.lockedView.isHidden = true)
            if (!currentCharacter.isChecked)
            {
                cell.changeShadowAndBorder(view: cell.cellBackgroundView, shadowColor: UIColor.white, borderColor: UIColor.white)
                cell.backgroundColor = UIColor(red: 0.831, green: 0.886, blue: 0.933, alpha: 1)
                cell.noticeIcon.isHidden = false
            }
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //플레이어 해금된 상태야 셀 눌림.
        
        if currentNoteTitleInt == 0 {
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
        if currentNoteTitleInt == 1 {
            guard !player.currentEpisodes[currentNotePageInt].currentCaseNote [indexPath.row].isLocked else { return }
            caseNameLabel.text = player.currentEpisodes[currentNotePageInt].currentCaseNote[indexPath.row].title
            caseLongDescriptionLabel.text = player.currentEpisodes[currentNotePageInt].currentCaseNote[indexPath.row].longDescription
            popupViewOn(blackView: casePopupBackgroundView, popupView: casePopupBoxView, priviousScale: 0.6, afterScale: 1.0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.noteTableView.delegate = self
        self.noteTableView.dataSource = self
        self.designTableView.delegate = self
        self.designTableView.dataSource = self
        designObjects()
        designButtons()
        updateTitle(newTitleNumber: 0)
        updatePage(newPageNumber: 0)
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        designButtons()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
       
    }
  
//----------------------일반----------------------
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var noteBackgroundView: UIView!


    @IBAction func backAction(_ sender: Any) {
        let transition:CATransition = CATransition()
          transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromTop
        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.popViewController(animated: false)
        updateTitle(newTitleNumber: 0)
        updatePage(newPageNumber: 0)
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
 
    
    
    
    
    //---------------------------버튼-------------------
    
    let currentPageButtonTitleColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    let currentPageButtonBackgroundColor = UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1)
    let otherPageButtonTitledColor = UIColor(red: 0.109, green: 0.201, blue: 0.275, alpha: 1)
    let otherPageButtonBackgroundColor = UIColor(red: 0.341, green: 0.478, blue: 0.604, alpha: 1)
    
    //---------------타이틀 버튼----------------------
    
    var currentNoteTitleInt = 0 {
        didSet {
            currentNoteTitleInt == 0 ? (pageButtons[0].isHidden = false) : (pageButtons[0].isHidden = true)
            noteTableView.reloadData()
        }
    }
    
    @IBOutlet var titleButtons: [UIButton]!
    
    @IBAction func characterButtonAction(_ sender: Any) {
        updateTitle(newTitleNumber: 0)
    }
    @IBAction func caseButtonAction(_ sender: Any) {
        updateTitle(newTitleNumber: 1)
    }
    
    func updateTitle(newTitleNumber: Int) {
        
        currentNoteTitleInt = newTitleNumber
        currentNoteTitleInt == 0 ? updatePage(newPageNumber: 0) : updatePage(newPageNumber: 1)
        for button in titleButtons.enumerated() {
            if button.offset == currentNoteTitleInt {
                button.element.setTitleColor(currentPageButtonTitleColor, for: .normal)
                button.element.backgroundColor = currentPageButtonBackgroundColor
            } else {
                button.element.setTitleColor(otherPageButtonTitledColor, for: .normal)
                button.element.backgroundColor = otherPageButtonBackgroundColor
            }
        }
    
    }
    
    //---------------페이지 버튼----------------------
    
 
    var currentNotePageInt: Int = 0 {
        didSet {
            noteTableView.reloadData()
        }
    }
    
    @IBOutlet var pageButtons: [UIButton]!
    
    @IBAction func page1ButtonAction(_ sender: Any) {
        updatePage(newPageNumber: 0)
    }
    @IBAction func page2ButtonAction(_ sender: Any) {
        updatePage(newPageNumber: 1)
    }
    @IBAction func page3ButtonAction(_ sender: Any) {
        updatePage(newPageNumber: 2)
    }
    @IBAction func page4ButtonAction(_ sender: Any) {
        updatePage(newPageNumber: 3)
    }
    @IBAction func page5ButtonAction(_ sender: Any) {
        updatePage(newPageNumber: 4)
    }
    
    func designButtons() {
        
        for button in pageButtons.enumerated() {
            
            let currentEpisode = player.currentEpisodes[button.offset]
        
            currentEpisode.isStarted ? button.element.setTitle(String(currentEpisode.episodeYear), for: .normal) : button.element.setTitle("????", for: .normal)
            button.element.layer.cornerRadius = 10
            button.element.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            button.element.titleLabel?.font =  UIFont(name: "NanumSquareEB", size: 17)
        }
        for button in titleButtons.enumerated() {
            
            let titles = ["인물", "역사"]
            let currentTitle = titles[button.offset]
            
            button.element.setTitle(String(currentTitle), for: .normal)
            button.element.layer.cornerRadius = 10
            button.element.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            button.element.titleLabel?.font =  UIFont(name: "NanumSquareEB", size: 17)
        }
        
    }
    
 
    
    func updatePage(newPageNumber: Int) {
        
        currentNotePageInt = newPageNumber
        
       
        
        for button in pageButtons.enumerated() {
            if button.offset == currentNotePageInt {
                button.element.setTitleColor(currentPageButtonTitleColor, for: .normal)
                button.element.backgroundColor = currentPageButtonBackgroundColor
            } else {
                button.element.setTitleColor(otherPageButtonTitledColor, for: .normal)
                button.element.backgroundColor = otherPageButtonBackgroundColor
            }
      }
  }
   
    
    //--------------사건 팝업----------------
    @IBOutlet var casePopupBackgroundView: UIView!
    @IBOutlet weak var casePopupBoxView: UIView!
    @IBOutlet weak var casePopopBackgroundViewTopBar: UIView!
    @IBOutlet weak var caseNameLabel: UILabel!
    @IBOutlet weak var caseLongDescriptionLabel: UILabel!
    @IBAction func exitCasePopupAction(_ sender: Any) {
        popupViewOff(popupView: casePopupBoxView, blackView: casePopupBackgroundView, priviousScale: 1.0, afterScale: 0.3)
    }
   
  
    
}


extension NoteViewController {
    
    func designObjects() {
   
     
    //--------------수첩 --------------
    
        noteBackgroundView.backgroundColor = UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1)
        titleLabel.font = UIFont(name: "NanumSquareEB", size: 29)
        
        noteBackgroundView.layer.cornerRadius = 24
        noteBackgroundView.setShadow(color: UIColor(red: 0.174, green: 0.292, blue: 0.404, alpha: 1), offsetX: 24, offsetY: -15, opacity: 1, radius: 0)
        noteBackgroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        caseLongDescriptionLabel.setLineSpacing(lineSpacing: 6)
        caseLongDescriptionLabel.textAlignment = .center
  
    //--------사건 팝업------------------
        casePopupBoxView.layer.cornerRadius = 14
        casePopupBoxView.setBolder(color: UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1), width: 4)
        casePopopBackgroundViewTopBar.backgroundColor = UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1)
        casePopopBackgroundViewTopBar.layer.cornerRadius = 14
        casePopopBackgroundViewTopBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
}
    
//-----------------------함수---------------------------------
    func popupViewOn(blackView: UIView, popupView: UIView, priviousScale: CGFloat, afterScale: CGFloat) {
        let backgroundView = self.view!
        //뷰 두 개(이미지, 글씨) 서브뷰로 추가
        
        backgroundView.addSubview(blackView)
        backgroundView.bringSubviewToFront(blackView)
        
        //이미지뷰만 히든 풀고, 뷰들 정렬함. 텍스트뷰는 서서히 나타나는 애니메이션을 위해 알파 0으로 설정해둠.
        blackView.bounds = self.view.bounds
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
        _ = self.view!
       
     
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
        return UITableView.automaticDimension
    }
}

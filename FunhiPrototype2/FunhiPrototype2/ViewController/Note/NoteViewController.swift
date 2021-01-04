//
//  NoteViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/29.
//

import UIKit
//------------------------------------------------------------------------------------------------
class NoteGameCharacterTableViewCell: UITableViewCell {


    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var achievementLabel: UILabel!
    
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
class NoteCaseTableViewCell: UITableViewCell {

    @IBOutlet weak var caseNameLabel: UILabel!
    @IBOutlet weak var caseDescriptionLabel: UILabel!
    @IBOutlet weak var cellBackgroundView: UIView!
    
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
        case histories
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
        if currentNoteTitle == .histories {
            rowInSectionsCount = player.currentEpisodes[currentNotePageInt].currentCaseNote .count
        }
        return rowInSectionsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if currentNoteTitle == .gameCharacters {
            let currentEpisode = player.currentEpisodes[currentNotePageInt]
            let cell = tableView.dequeueReusableCell(withIdentifier: "gameCharacterCell", for: indexPath) as! NoteGameCharacterTableViewCell
            
            cell.nameLabel.text = currentEpisode.currentCharacterNote[indexPath.row].name
            cell.descriptionLabel.text = currentEpisode.currentCharacterNote[indexPath.row].description
            cell.profileImage.image = UIImage(contentsOfFile: currentEpisode.currentCharacterNote[indexPath.row].profileImage)
            cell.achievementLabel.text = currentEpisode.currentCharacterNote[indexPath.row].name
            
            if cell.nameLabel.text != "이단희" {
                cell.achievementLabel.text = ""
            }
            return cell
        } else {
            let currentEpisodes = player.currentEpisodes
            let cell = tableView.dequeueReusableCell(withIdentifier: "caseCell", for: indexPath) as! NoteCaseTableViewCell
        
            cell.caseNameLabel.text = currentEpisodes[currentNotePageInt].currentCaseNote[indexPath.row].title
            cell.caseDescriptionLabel.text = currentEpisodes[currentNotePageInt].currentCaseNote[indexPath.row].shortDescription
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if currentNoteTitle == .gameCharacters {
            return 267
        } else {
            return 121
        }
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
    
    @IBAction func openGameCharactersNoteAction(_ sender: Any) {
        currentNoteTitle = .gameCharacters
        changePageDesign()
    }
    @IBAction func openCasesNoteAction(_ sender: Any) {
        currentNoteTitle = .histories
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
    }
    
    func designObjects() {
       
      
        topBar.layer.shadowColor = UIColor(red: 0, green: 0.11, blue: 0.208, alpha: 1).cgColor
        topBar.layer.shadowOpacity = 1
        topBar.layer.shadowRadius = 26
        topBar.layer.shadowOffset = CGSize(width: 0, height: 12)
        
        noteBackgroundView.layer.backgroundColor = UIColor(red: 0.749, green: 0.631, blue: 0.455, alpha: 1).cgColor
        noteBackgroundView.layer.cornerRadius = 5
        noteBackgroundView.layer.borderWidth = 2
        noteBackgroundView.layer.borderColor = UIColor(red: 0.254, green: 0.205, blue: 0.13, alpha: 1).cgColor
        
        gameCharactersBookmarkView.layer.backgroundColor = UIColor(red: 0.749, green: 0.631, blue: 0.455, alpha: 1).cgColor
        gameCharactersBookmarkView.layer.cornerRadius = 5
        gameCharactersBookmarkView.layer.borderWidth = 2
        gameCharactersBookmarkView.layer.borderColor = UIColor(red: 0.254, green: 0.205, blue: 0.13, alpha: 1).cgColor
        
        casesBookmarkView.layer.backgroundColor = UIColor(red: 0.492, green: 0.406, blue: 0.279, alpha: 1).cgColor
        casesBookmarkView.layer.cornerRadius = 5
        casesBookmarkView.layer.borderWidth = 2
        casesBookmarkView.layer.borderColor = UIColor(red: 0.254, green: 0.205, blue: 0.13, alpha: 1).cgColor
       
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
        changePageDesign()
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

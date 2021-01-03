//
//  NoteViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/29.
//

import UIKit

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
            noteTableView.reloadData()
            if self.currentNoteTitle == .gameCharacters {
                page5Button.isHidden = false
            } else {
                page5Button.isHidden = true
            }
        }
    }
    //현재 수첩 페이지의 몇 번째 쪽인지(탭바) 구별해주는 변수의 이넘 타입
    var currentNotePageNumber: NotePageNumber = .first
    
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
            rowInSectionsCount = player.currentEpisodes[currentNotePageInt].currentHistoryNote .count
        }
        return rowInSectionsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if currentNoteTitle == .gameCharacters {
            let cell = tableView.dequeueReusableCell(withIdentifier: "gameCharacterCell", for: indexPath) as! NoteGameCharacterTableViewCell
            cell.nameLabel.text = player.currentEpisodes[currentNotePageInt].currentCharacterNote[indexPath.row].name
            
            cell.descriptionLabel.text = player.currentEpisodes[currentNotePageInt].currentCharacterNote[indexPath.row].description
            
            cell.profileImage.image = UIImage(contentsOfFile: player.currentEpisodes[currentNotePageInt].currentCharacterNote[indexPath.row].profileImage)
            
            cell.achievementLabel.text = player.currentEpisodes[currentNotePageInt].currentCharacterNote[indexPath.row].name
            if cell.nameLabel.text != "이단희" {
                cell.achievementLabel.text = ""
            }
            return cell
        } else {
            return UITableViewCell()
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
    @IBOutlet weak var noteCharactersBookmarkView: UIView!
    @IBOutlet weak var noteEpisodesBookmarkView: UIView!
    
    
    @IBOutlet weak var page1Button: UIButton!
    @IBOutlet weak var page2Button: UIButton!
    @IBOutlet weak var page3Button: UIButton!
    @IBOutlet weak var page4Button: UIButton!
    @IBOutlet weak var page5Button: UIButton!
    
    @IBOutlet weak var page1ButtonLine: UIView!
    @IBOutlet weak var page2ButtonLine: UIView!
    @IBOutlet weak var page3ButtonLine: UIView!
    @IBOutlet weak var page4ButtonLine: UIView!
    @IBOutlet weak var page5ButtonLine: UIView!
    
    @IBAction func openGameCharactersNoteAction(_ sender: Any) {
        currentNoteTitle = .gameCharacters
    }
    @IBAction func openCasesNoteAction(_ sender: Any) {
        currentNoteTitle = .histories
    }
    @IBAction func page1ButtonAction(_ sender: Any) {
    }
    @IBAction func page2ButtonAction(_ sender: Any) {
    }
    @IBAction func page3ButtonAction(_ sender: Any) {
    }
    @IBAction func page4ButtonAction(_ sender: Any) {
    }
    @IBAction func page5ButtonAction(_ sender: Any) {
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.noteTableView.delegate = self
        self.noteTableView.dataSource = self
        designObjects()
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
        
        noteCharactersBookmarkView.layer.backgroundColor = UIColor(red: 0.749, green: 0.631, blue: 0.455, alpha: 1).cgColor
        noteCharactersBookmarkView.layer.cornerRadius = 5
        noteCharactersBookmarkView.layer.borderWidth = 2
        noteCharactersBookmarkView.layer.borderColor = UIColor(red: 0.254, green: 0.205, blue: 0.13, alpha: 1).cgColor
        
        noteEpisodesBookmarkView.layer.backgroundColor = UIColor(red: 0.492, green: 0.406, blue: 0.279, alpha: 1).cgColor
        noteEpisodesBookmarkView.layer.cornerRadius = 5
        noteEpisodesBookmarkView.layer.borderWidth = 2
        noteEpisodesBookmarkView.layer.borderColor = UIColor(red: 0.254, green: 0.205, blue: 0.13, alpha: 1).cgColor
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

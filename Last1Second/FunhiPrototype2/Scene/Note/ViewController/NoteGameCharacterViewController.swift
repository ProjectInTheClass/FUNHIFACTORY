//
//  NoteGameCharacterViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/04.
//

import UIKit


class GameCharacterSingleinfomationCell: UITableViewCell {
    @IBOutlet weak var smallCircle: UIView!
    @IBOutlet weak var informationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func designCell() {
        informationLabel.setLineSpacing(lineSpacing: 7.0)
        informationLabel.font = UIFont(name: "NanumSquareR", size: 15)
        smallCircle.setBolder(color: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), width: 1.2)
        smallCircle.backgroundColor = UIColor(red: 0.588, green: 0.698, blue: 0.796, alpha: 1)
        smallCircle.layer.cornerRadius = smallCircle.frame.width/2
    }
}
class GameCharacterFirstinfomationCell: UITableViewCell {
    @IBOutlet weak var smallCircle: UIView!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet var line: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func designCell() {
        informationLabel.setLineSpacing(lineSpacing: 7.0)
        informationLabel.font = UIFont(name: "NanumSquareR", size: 15)
        smallCircle.setBolder(color: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), width: 1.2)
        smallCircle.backgroundColor = UIColor(red: 0.588, green: 0.698, blue: 0.796, alpha: 1)
        smallCircle.layer.cornerRadius = smallCircle.frame.width/2
        line.backgroundColor = UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1)
    }
}
class GameCharacterMiddleinfomationCell: UITableViewCell {
    @IBOutlet weak var smallCircle: UIView!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet var line: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func designCell() {
        informationLabel.setLineSpacing(lineSpacing: 7.0)
        informationLabel.font = UIFont(name: "NanumSquareR", size: 15)
        smallCircle.setBolder(color: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), width: 1.2)
        smallCircle.backgroundColor = UIColor(red: 0.588, green: 0.698, blue: 0.796, alpha: 1)
        smallCircle.layer.cornerRadius = smallCircle.frame.width/2
        line.backgroundColor = UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1)
    }
}
class GameCharacterLastinfomationCell: UITableViewCell {
    @IBOutlet weak var smallCircle: UIView!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet var line: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        designCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func designCell() {
        informationLabel.setLineSpacing(lineSpacing: 7.0)
        informationLabel.font = UIFont(name: "NanumSquareR", size: 15)
        smallCircle.setBolder(color: UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1), width: 1.2)
        smallCircle.backgroundColor = UIColor(red: 0.588, green: 0.698, blue: 0.796, alpha: 1)
        smallCircle.layer.cornerRadius = smallCircle.frame.width/2
        line.backgroundColor = UIColor(red: 0.404, green: 0.561, blue: 0.694, alpha: 1)
    }
}
//-------------------뷰컨-------------
class NoteGameCharacterViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var openedInfomation = [Infomation]()
    
  
  

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let recievedGameCharacter = recievedGameCharacter else { return 0 }
            openedInfomation.removeAll()
            for infomation in recievedGameCharacter.infomation {
                if !infomation.isLocked {
                    openedInfomation.append(infomation)
                }
            }
            return openedInfomation.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnCell = UITableViewCell()

        guard let recievedGameCharacter = recievedGameCharacter else { return UITableViewCell() }
        
            let infomations = recievedGameCharacter.infomation
            // 인포메이션 1개일 때 singleCell 모양 반환
            if openedInfomation.count == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "gameCharacterSinglenfomationCell", for: indexPath) as! GameCharacterSingleinfomationCell
                cell.informationLabel.text = openedInfomation[indexPath.row].text
                returnCell = cell
            }
            // 인포메이션 1개 이상일 때 알맞는 모양 반환
            if openedInfomation.count > 1 {
                // 인포메이션 목록의 처음 부분이면 firstCell 모양임
                if indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "gameCharacterFirstInfomationCell", for: indexPath) as! GameCharacterFirstinfomationCell
                    cell.informationLabel.text = openedInfomation[indexPath.row].text
                    returnCell = cell
                }
                
                // 인포메이션 목록의 중간 부분이면 middleCell 모양임
                if indexPath.row > 0 && indexPath.row < infomations.count-1 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "gameCharacterMiddleInfomationCell", for: indexPath) as! GameCharacterMiddleinfomationCell
                    cell.informationLabel.text = openedInfomation[indexPath.row].text
                    returnCell = cell
                }
                
                // 인포메이션 목록의 마지막 부분이면 lastCell 모양임
                if indexPath.row == openedInfomation.count-1 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "gameCharacterLastInfomationCell", for: indexPath) as! GameCharacterLastinfomationCell
                    cell.informationLabel.text = openedInfomation[indexPath.row].text
                    returnCell = cell
                }
            }
        infomationTableView.updateHeaderViewHeight()
        return returnCell
    }
    //----------------일반 아웃렛, 메소드------------------------------
    @IBOutlet var nameLabel: UILabel!
    var recievedGameCharacter: GameCharacter?
    @IBOutlet weak var infomationTableView: UITableView!
    @IBOutlet weak var gameCharacterImageView: UIImageView!
    @IBOutlet weak var gameCharacterDescriptionLabel: UILabel!
    @IBOutlet weak var gameCharacterIsLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
           designObjects()
        self.infomationTableView.delegate = self
        self.infomationTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if let recievedGameCharacter = recievedGameCharacter {
           updateView(gameCharacter: recievedGameCharacter)
        }
    }
    
    func updateView(gameCharacter: GameCharacter) {
        nameLabel.text = gameCharacter.name
        gameCharacterImageView.image = UIImage(named: "\(gameCharacter.profileImage)_noteLarge")
        gameCharacterDescriptionLabel.text = gameCharacter.description
        gameCharacterIsLabel.text = postPositionText(gameCharacter.name)
    }
    
    @IBAction func exitButton(_ sender: Any) {
    
        self.navigationController?.popViewController(animated: true)
    }
    func designObjects() {
        
        nameLabel.font = UIFont(name: "NanumSquareEB", size: 29)

        gameCharacterDescriptionLabel.setLineSpacing(lineSpacing: 10)
        gameCharacterDescriptionLabel.textAlignment = .center
        gameCharacterImageView.layer.cornerRadius = gameCharacterImageView.frame.width/2
       
    }
  
    func postPositionText(_ name: String) -> String {
            guard let lastText = name.last else { return name }     // 글자의 마지막 부분을 가져옴
            
            let unicodeVal = UnicodeScalar(String(lastText))?.value // 유니코드 전환
            
            guard let value = unicodeVal else { return name }

            if (value < 0xAC00 || value > 0xD7A3) { return name }   // 한글아니면 반환

            let last = (value - 0xAC00) % 28                        // 종성인지 확인

            let str = last > 0 ? "은..." : "는..."      // 받침있으면 은 없으면 는 반환
            
            return name + str
            
        }
}

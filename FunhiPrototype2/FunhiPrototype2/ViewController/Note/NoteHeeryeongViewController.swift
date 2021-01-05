//
//  NoteGameCharacterViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/04.
//

import UIKit


class HeeryeongSingleinfomationCell: UITableViewCell {
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
        smallCircle.layer.backgroundColor = UIColor(red: 0.933, green: 0.859, blue: 0.195, alpha: 1).cgColor
        smallCircle.layer.borderWidth = 2
        smallCircle.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        smallCircle.layer.cornerRadius = smallCircle.frame.width/2
    }
}
class HeeryeongFirstinfomationCell: UITableViewCell {
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
        smallCircle.layer.backgroundColor = UIColor(red: 0.933, green: 0.859, blue: 0.195, alpha: 1).cgColor
        smallCircle.layer.borderWidth = 2
        smallCircle.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        smallCircle.layer.cornerRadius = smallCircle.frame.width/2
    }
}
class HeeryeongMiddleinfomationCell: UITableViewCell {
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
        smallCircle.layer.backgroundColor = UIColor(red: 0.933, green: 0.859, blue: 0.195, alpha: 1).cgColor
        smallCircle.layer.borderWidth = 2
        smallCircle.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        smallCircle.layer.cornerRadius = smallCircle.frame.width/2
    }
}
class HeeryeongLastinfomationCell: UITableViewCell {
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
        smallCircle.layer.backgroundColor = UIColor(red: 0.933, green: 0.859, blue: 0.195, alpha: 1).cgColor
        smallCircle.layer.borderWidth = 2
        smallCircle.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        smallCircle.layer.cornerRadius = smallCircle.frame.width/2
    }
}
//-------------------뷰컨-------------
class NoteHeeryeongViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let recievedGameCharacter = recievedGameCharacter {
            return recievedGameCharacter.infomation.count
        } else {
            return 0
            print("recievedGameCharacter nil임")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnCell = UITableViewCell()

        if let recievedGameCharacter = recievedGameCharacter {
            let infomations = recievedGameCharacter.infomation
            // 인포메이션 1개일 때 singleCell 모양 반환
            if infomations.count == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "heeryeongSinglenfomationCell", for: indexPath) as! HeeryeongSingleinfomationCell
                cell.informationLabel.text = infomations[indexPath.row].text
                returnCell = cell
            }
            // 인포메이션 1개 이상일 때 알맞는 모양 반환
            if infomations.count > 1 {
                // 인포메이션 목록의 처음 부분이면 firstCell 모양임
                if indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "heeryeongFirstInfomationCell", for: indexPath) as! HeeryeongFirstinfomationCell
                    cell.informationLabel.text = infomations[indexPath.row].text
                    returnCell = cell
                }
                
                // 인포메이션 목록의 중간 부분이면 middleCell 모양임
                if indexPath.row > 0 && indexPath.row < infomations.count-1 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "heeryeongMiddleInfomationCell", for: indexPath) as! HeeryeongMiddleinfomationCell
                    cell.informationLabel.text = infomations[indexPath.row].text
                    returnCell = cell
                }
                
                // 인포메이션 목록의 마지막 부분이면 lastCell 모양임
                if indexPath.row == infomations.count-1 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "heeryeongLastInfomationCell", for: indexPath) as! HeeryeongLastinfomationCell
                    cell.informationLabel.text = infomations[indexPath.row].text
                    returnCell = cell
                }
            }




        } else {
            return UITableViewCell()
            print("recievedGameCharacter nil임")
        }
        return returnCell
    }
    //----------------일반 아웃렛, 메소드------------------------------
    var recievedGameCharacter: GameCharacter?
    
    
    
    @IBOutlet weak var hwiryeongInfomationTableView: UITableView!
    @IBOutlet weak var hwiryeongProfileImageView: UIImageView!
    
    @IBOutlet weak var hwiryeongBackgroundImageView: UIImageView!
    
    
    @IBOutlet weak var hwiryeongDescriptionLabel: UILabel!
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        designObjects()
        self.hwiryeongInfomationTableView.delegate = self
        self.hwiryeongInfomationTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if let recievedGameCharacter = recievedGameCharacter {
            hwiryeongProfileImageView.image = UIImage(named: recievedGameCharacter.profileImage)
            hwiryeongBackgroundImageView.image = UIImage(named: recievedGameCharacter.backGroundImage)
            hwiryeongDescriptionLabel.text = recievedGameCharacter.description

           
            
        }
    }
    
    @IBAction func exitButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func designObjects() {
     
       
    }
}


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
        smallCircle.layer.backgroundColor = UIColor(red: 0.933, green: 0.859, blue: 0.195, alpha: 1).cgColor
        smallCircle.layer.borderWidth = 2
        smallCircle.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        smallCircle.layer.cornerRadius = smallCircle.frame.width/2
    }
}
class GameCharacterFirstinfomationCell: UITableViewCell {
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
class GameCharacterMiddleinfomationCell: UITableViewCell {
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
class GameCharacterLastinfomationCell: UITableViewCell {
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
class NoteGameCharacterViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
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
                let cell = tableView.dequeueReusableCell(withIdentifier: "gameCharacterSinglenfomationCell", for: indexPath) as! GameCharacterSingleinfomationCell
                cell.informationLabel.text = infomations[indexPath.row].text
                returnCell = cell
            }
            // 인포메이션 1개 이상일 때 알맞는 모양 반환
            if infomations.count > 1 {
                // 인포메이션 목록의 처음 부분이면 firstCell 모양임
                if indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "gameCharacterFirstInfomationCell", for: indexPath) as! GameCharacterFirstinfomationCell
                    cell.informationLabel.text = infomations[indexPath.row].text
                    returnCell = cell
                }
                
                // 인포메이션 목록의 중간 부분이면 middleCell 모양임
                if indexPath.row > 0 && indexPath.row < infomations.count-1 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "gameCharacterMiddleInfomationCell", for: indexPath) as! GameCharacterMiddleinfomationCell
                    cell.informationLabel.text = infomations[indexPath.row].text
                    returnCell = cell
                }
                
                // 인포메이션 목록의 마지막 부분이면 lastCell 모양임
                if indexPath.row == infomations.count-1 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "gameCharacterLastInfomationCell", for: indexPath) as! GameCharacterLastinfomationCell
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
    @IBOutlet weak var infomationTableView: UITableView!
    @IBOutlet weak var gameCharacterImageView: UIImageView!
    @IBOutlet weak var gameCharacterDescriptionLabel: UILabel!
    @IBOutlet weak var likabilityBackgroundView: UIView!
    @IBOutlet weak var likabilityProgressView: UIView!
    @IBOutlet weak var likabilityProgressWidth: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designObjects()
        self.infomationTableView.delegate = self
        self.infomationTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if let recievedGameCharacter = recievedGameCharacter {
            gameCharacterImageView.image = UIImage(named: recievedGameCharacter.profileImage)
            gameCharacterDescriptionLabel.text = recievedGameCharacter.description

           
                likabilityProgressWidth.constant = likabilityBackgroundView.frame.width*CGFloat(recievedGameCharacter.likability)/100
            
        }
    }
    
    @IBAction func exitButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func designObjects() {
     
        likabilityBackgroundView.backgroundColor = .white
        likabilityBackgroundView.layer.cornerRadius = likabilityBackgroundView.frame.height/2
        likabilityBackgroundView.layer.borderWidth = 1
        likabilityBackgroundView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        likabilityProgressView.layer.backgroundColor = UIColor(red: 0.812, green: 0.311, blue: 0.311, alpha: 1).cgColor
        likabilityProgressView.layer.cornerRadius = likabilityBackgroundView.frame.height/2
        likabilityProgressView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        if let recievedGameCharacter = recievedGameCharacter {
            likabilityProgressWidth.constant = likabilityBackgroundView.frame.width*CGFloat(recievedGameCharacter.likability)/100
            
        }
       
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

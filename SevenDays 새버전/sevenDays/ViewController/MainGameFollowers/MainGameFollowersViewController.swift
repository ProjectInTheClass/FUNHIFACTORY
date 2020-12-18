//
//  MainGameFollowersViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/12/09.
//

import UIKit



class FollowersTableViewCell: UITableViewCell {

    @IBOutlet weak var followerImage: UIImageView!
    @IBOutlet weak var followerName: UILabel!
    @IBOutlet weak var likabilityGrayBox: UIView!
    @IBOutlet weak var likabilityConstraint: NSLayoutConstraint!
    @IBOutlet weak var likabilityRedBox: UIView!
    @IBOutlet weak var followerBox: UIView!
    @IBOutlet weak var likabilityView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func designFollowersTableViewCell() {
        followerBox.layer.borderColor = CGColor(red: 200/255, green: 199/255, blue: 181/255, alpha: 1)
        followerBox.layer.borderWidth = 1.5
        likabilityGrayBox.layer.cornerRadius = likabilityGrayBox.frame.height/2
        likabilityRedBox.layer.cornerRadius = likabilityGrayBox.frame.height/2
    }
}

class MainGameFollowersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var topBar: UIView!
    //딕셔너리 자료를 어레이로 타입변환해서 담을 곳.
    var gameCharactersInfoArray = [GameCharacter]()
    
    
    
    
    
  
    @IBOutlet weak var followersTableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sevenDays.player.currentGameCharacter.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "followersTableViewCell", for: indexPath) as! FollowersTableViewCell
        cell.backgroundColor = .clear
        cell.likabilityView.backgroundColor = .clear
        cell.followerName.text = gameCharactersInfoArray[indexPath.row].name
        cell.followerImage.image = UIImage(named: gameCharactersInfoArray[indexPath.row].profileImage)
        cell.followerImage.layer.cornerRadius = cell.followerImage.frame.height/2
        cell.likabilityConstraint.constant = CGFloat(gameCharactersInfoArray[indexPath.row].likability*Int(cell.likabilityGrayBox.frame.size.width)/100)
            print(cell.likabilityGrayBox.frame.size.width)
        cell.selectionStyle = .none
        cell.designFollowersTableViewCell()
        
        if gameCharactersInfoArray[indexPath.row].name == "키렐" || gameCharactersInfoArray[indexPath.row].name == "카론" {
            cell.likabilityView.isHidden = true
            
        }
        
        print("현재 호감도\(gameCharactersInfoArray[indexPath.row].likability)")
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataToSend = gameCharactersInfoArray[indexPath.row]
        performSegue(withIdentifier: "goToFollowerDetailViewSegue", sender: dataToSend)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "goToFollowerDetailViewSegue" {
            let destination = segue.destination as! MainGameFollowerDetailViewController
            if let gameCharacter = sender as? GameCharacter {
                destination.recievedGameCharacter = gameCharacter
            }
       }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.followersTableView.delegate = self
        self.followersTableView.dataSource = self
        followersTableView.backgroundColor = .clear
        updateGameCharacterInfoArray(array: currentCharactersInfo)
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.followersTableView.delegate = self
        self.followersTableView.dataSource = self
    }
    
    func updateGameCharacterInfoArray(array: [String:GameCharacter]) {
        //딕셔너리에서 게임캐릭터만 빼오기
        var a = [GameCharacter]()
        for (_, value) in array {
            a.append(GameCharacter(name: value.name, profileImage: value.profileImage, backgroundImage: value.backgroundImage, infomation: value.infomation, mission: value.mission, likability: value.likability))
        }
        
        //order 순으로 정렬하기
        let arrayCount = array.count
        let order = ["키렐", "발람", "힐데", "아르고", "필리오", "카론", "???", "울프"]
        var index = 0
        var newArray = [GameCharacter]()
        while newArray.count != arrayCount {
            for gameCharacter in a {
                if gameCharacter.name == order[index] {
                    newArray.append(gameCharacter)
                    index += 1
                }
                if newArray.count == arrayCount {
                    break
                }
            }
        }
        gameCharactersInfoArray = newArray
        print("최종\(gameCharactersInfoArray)")
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

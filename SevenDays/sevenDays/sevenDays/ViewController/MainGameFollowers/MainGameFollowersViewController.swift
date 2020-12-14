//
//  MainGameFollowersViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/12/09.
//

import UIKit




class MainGameFollowersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //딕셔너리 자료를 어레이로 타입변환해서 담을 곳.
    
    
    var charactersInfoArray: [GameCharacter]{
        get {
            
            var a = [GameCharacter]()
            for (key, value) in player.currentGameCharacter {
                a.append(GameCharacter(name: value.name, profileImage: value.profileImage, backgroundImage: value.backgroundImage, infomation: value.infomation, mission: value.mission, likability: value.likability))
            }
            print(a)
            return a
        }
        
        
    }
    
    
    
  
    @IBOutlet weak var followersTableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sevenDays.player.currentGameCharacter.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "followersTableViewCell", for: indexPath) as! FollowersTableViewCell
       
        
        cell.followerName.text = charactersInfoArray[indexPath.row].name
        cell.followerImage.image = UIImage(named: charactersInfoArray[indexPath.row].profileImage)
        cell.followerImage.layer.cornerRadius = cell.followerImage.frame.height/2
        cell.likabilityConstraint.constant = CGFloat(charactersInfoArray[indexPath.row].likability*Int(cell.likabilityGrayBox.frame.size.width)/100)
            print(cell.likabilityGrayBox.frame.size.width)
        
        print(charactersInfoArray[indexPath.row].likability)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataToSend = charactersInfoArray[indexPath.row]
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
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.followersTableView.delegate = self
        self.followersTableView.dataSource = self
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

//
//  MainGameFollowersDetailViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/12/09.
//

import UIKit

class MainGameFollowerDetailViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "followerInfoTableViewCell", for: indexPath) as! FollowerInfoTableViewCell
        cell.infoLabel.text = recievedGameCharacter?.infomation[indexPath.row]
        return cell
    }
    
    
    

    @IBOutlet weak var gameCharacterNameLabel: UILabel!
    @IBOutlet weak var gameCharacterProfileImageView: UIImageView!
    @IBOutlet weak var gameCharacterbackgroundImageView: UIImageView!
    @IBOutlet weak var gameCharacterInfoTableView: UITableView!
    @IBOutlet weak var gameCharacterLikabilityConstraint: NSLayoutConstraint!
    @IBOutlet weak var gameCharacterLikabilityGrayBox: UIView!
    var recievedGameCharacter: GameCharacter?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows = 0
        if let recievedGameCharacter = recievedGameCharacter {
            numberOfRows = recievedGameCharacter.infomation.count
        }
        print("인포메이션 개수:\(recievedGameCharacter?.infomation)")
        print(numberOfRows)
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell =  tableView.dequeueReusableCell(withIdentifier: "followerInfoTableViewCell", for: indexPath) as! FollowerInfoTableViewCell
//        if let recievedGameCharacter = recievedGameCharacter {
//
//            cell.infoLabel.text = recievedGameCharacter.infomation[indexPath.row]
//            print(cell.infoLabel.text)
//        }
//        return cell
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gameCharacterInfoTableView.delegate = self
        self.gameCharacterInfoTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.gameCharacterInfoTableView.delegate = self
        self.gameCharacterInfoTableView.dataSource = self
        
        if let recievedGameCharacter = recievedGameCharacter {
            gameCharacterNameLabel.text = recievedGameCharacter.name
            gameCharacterProfileImageView.image = UIImage(named: recievedGameCharacter.profileImage)
            gameCharacterbackgroundImageView.image = UIImage(named: recievedGameCharacter.backgroundImage)
            gameCharacterLikabilityConstraint.constant = CGFloat(recievedGameCharacter.likability*Int(gameCharacterLikabilityGrayBox.frame.size.width)/100)
        }
    }

    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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

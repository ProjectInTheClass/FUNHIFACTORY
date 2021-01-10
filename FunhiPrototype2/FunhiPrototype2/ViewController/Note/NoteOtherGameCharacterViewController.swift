//
//  NoteOtherGameCharacterViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/10.
//

import UIKit

class NoteOtherGameCharacterViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    var openedInfomation: [Infomation] = []
    //테이블 뷰
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let recievedGameCharacter = recievedGameCharacter else { return 0 }
        
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
//        if let recievedGameCharacter = recievedGameCharacter {
//            gameCharacterImageView.image = UIImage(named: recievedGameCharacter.profileImage)
//            gameCharacterDescriptionLabel.text = recievedGameCharacter.description
//
////
////                likabilityProgressWidth.constant = likabilityBackgroundView.frame.width*CGFloat(recievedGameCharacter.likability)/100
//
//        }
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

}

//
//  NoteGameCharacterViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/04.
//

import UIKit



extension UITableView {
    func updateHeaderViewHeight() {
        if let header = self.tableHeaderView {
            let newSize = header.systemLayoutSizeFitting(CGSize(width: self.bounds.width, height: 0))
            header.frame.size.height = newSize.height
        }
    }
}
//-------------------뷰컨-------------
class NoteHeeryeongViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var openedInfomation = [Infomation]()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

           guard let headerView = hwiryeongInfomationTableView.tableHeaderView else { return }

        let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
           var headerFrame = headerView.frame

           if height != headerFrame.size.height {
               headerFrame.size.height = height
               headerView.frame = headerFrame
            hwiryeongInfomationTableView.tableHeaderView = headerView

               if #available(iOS 9.0, *) {
                hwiryeongInfomationTableView.layoutIfNeeded()
               }
           }

           headerView.translatesAutoresizingMaskIntoConstraints = true
    }
    
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
        return returnCell
    }
 
   
    
    //----------------일반 아웃렛, 메소드---------------------------------------------
    var recievedGameCharacter: GameCharacter?
    
    
    
    @IBOutlet var hwiryeongLabel: UILabel!
    @IBOutlet weak var hwiryeongInfomationTableView: UITableView!
    @IBOutlet weak var hwiryeongProfileImageView: UIImageView!
    @IBOutlet weak var hwiryeongBackgroundImageView: UIImageView!
    @IBOutlet weak var hwiryeongDescriptionLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        designObjects()
        
        self.hwiryeongInfomationTableView.delegate = self
        self.hwiryeongInfomationTableView.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if let recievedGameCharacter = recievedGameCharacter {
            updateObjects(recievedGameCharacter: recievedGameCharacter)
        }
    }
    
  
    
    @IBAction func exitButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateObjects(recievedGameCharacter: GameCharacter) {
        hwiryeongLabel.text = recievedGameCharacter.name
        hwiryeongProfileImageView.image = UIImage(named: "\(recievedGameCharacter.profileImage)_noteLarge")
        hwiryeongBackgroundImageView.image = UIImage(named: recievedGameCharacter.backGroundImage)
      
        hwiryeongDescriptionLabel.text = "네가 나의 마지막 희망이다.\n네가 가진 그 1초가 나를, 이 세상을 바꾸는 법.\n부디 이번엔 꼭 성공하길..."
        hwiryeongInfomationTableView.reloadData()
       
    }
    func designObjects() {
      
        hwiryeongProfileImageView.layer.cornerRadius = hwiryeongProfileImageView.frame.width/2
        hwiryeongDescriptionLabel.font = UIFont(name: "GyeonggiBatangB", size: 17)
        hwiryeongDescriptionLabel.setLineSpacing(lineSpacing: 10)
        hwiryeongDescriptionLabel.textAlignment = .center
        hwiryeongLabel.font = UIFont(name: "NanumSquareEB", size: 29)
    }
}


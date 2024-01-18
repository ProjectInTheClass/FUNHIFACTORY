//
//  NoteGameCharacterViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/04.
//

import UIKit

class NoteGameCharacterViewController: UIViewController {
    
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet weak var infomationTableView: UITableView!
  @IBOutlet weak var gameCharacterImageView: UIImageView!
  @IBOutlet weak var gameCharacterDescriptionLabel: UILabel!
  @IBOutlet weak var gameCharacterIsLabel: UILabel!
  
  var openedInfomation = [Infomation]()
  var recievedGameCharacter: GameCharacter?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    designObjects()
    self.infomationTableView.delegate = self
    self.infomationTableView.dataSource = self
  }

  override func viewWillAppear(_ animated: Bool) {
    if let recievedGameCharacter = recievedGameCharacter {
      updateView(gameCharacter: recievedGameCharacter)
    }
  }
  
  @IBAction func exitButton(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  
  func updateView(gameCharacter: GameCharacter) {
    nameLabel.text = gameCharacter.name
    gameCharacterImageView.image = UIImage(named: "\(gameCharacter.profileImage)_noteLarge")
    gameCharacterDescriptionLabel.text = gameCharacter.description
    gameCharacterIsLabel.text = gameCharacter.name.postPositionText
  }
    
  func designObjects() {
    nameLabel.font = UIFont(name: "NanumSquareEB", size: 29)
    gameCharacterDescriptionLabel.setLineSpacing(10)
    gameCharacterDescriptionLabel.textAlignment = .center
    gameCharacterImageView.layer.cornerRadius = gameCharacterImageView.frame.width/2
  }
}

extension NoteGameCharacterViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let character = recievedGameCharacter else { return 0 }
    openedInfomation.removeAll()
    character.infomation.forEach({ if !$0.isLocked { openedInfomation.append($0)} })
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
}

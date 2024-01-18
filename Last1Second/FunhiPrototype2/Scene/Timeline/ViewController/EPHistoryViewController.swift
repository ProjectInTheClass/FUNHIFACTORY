//
//  EPHistoryViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/09.
//

import UIKit




class EPHistoryViewController: UIViewController {
  
  @IBOutlet var mapPopupView: UIView!
  @IBOutlet var mapPopupBoxView: UIView!
  @IBOutlet var mapImageView: UIImageView!
  @IBOutlet weak var chatHistoryTableView: UITableView!
  @IBOutlet var yearLabel: UILabel!
  
  var currentEpisode: Episode?
 
  override func viewDidLoad() {
    super.viewDidLoad()
    self.chatHistoryTableView.delegate = self
    self.chatHistoryTableView.dataSource = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    guard let currentEpisode = currentEpisode else { return }
    mapPresentFromLeft = false
    chatHistoryTableView.reloadData()
    yearLabel.text = "\(currentEpisode.episodeYear)년"
  }
  
  @IBAction func backAction(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func openMap(_ sender: Any) {

    presentWithAnimation(vcIdentifier: "MapVC")
  }

  @IBAction func mapPopupExitButton(_ sender: Any) {
    mapPopupView.removeFromSuperview()
  }
  
  private func openMapPopup() {
    mapPopupView.center = self.view.center
    mapPopupView.bounds = self.view.bounds
    self.view.addSubview(mapPopupView)
    mapPopupBoxView.setBolder(color: .white, width: 4)
  }
  
  private func updateMapImage() {
    guard let currentEpisode = currentEpisode else { return }
    mapImageView.image = UIImage(named:"\(currentEpisode.episodeID)map")
    if currentEpisode.episodeID == "prologue" {
      mapImageView.image = UIImage(named:"2039map")
    }
  }
  
  private func currentHistoryDanhee() -> GameCharacterID {
    switch currentEpisode?.episodeID {
    case "prologue":
      return .danhee
    case "1623":
      return .danhee2
    default:
      return .danhee
    }
  }
  
  private func presentWithAnimation(vcIdentifier: String) {
    guard let VC = storyboard?.instantiateViewController(identifier: vcIdentifier) else {return}
    VC.modalPresentationStyle = .fullScreen
    present(VC, animated: true, completion: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToARView" {
      let destination = segue.destination as! MaingameARViewController
      if let arContent = sender as? ArId {
        destination.recievedAR = arContent
      }
    }
   
    if segue.identifier == "NoteUserVC"{
      let destintation = segue.destination as! NoteUserViewController
      if let targetCharacter = sender as? GameCharacter{
        destintation.recievedGameCharacter = targetCharacter
      }
    }
    
    if segue.identifier == "NoteHwiryeongVC"{
      let destintation = segue.destination as! NoteHeeryeongViewController
      if let targetCharacter = sender as? GameCharacter{
        destintation.recievedGameCharacter = targetCharacter
      }
    }
    
    if segue.identifier == "NoteGameCharacterVC"{
      let destintation = segue.destination as! NoteGameCharacterViewController
      if let targetCharacter = sender as? GameCharacter{
        destintation.recievedGameCharacter = targetCharacter
      }
    }
  }
}

// MARK: UITableView
extension EPHistoryViewController: UITableViewDataSource, UITableViewDelegate, ProfileImageDelegate {
 
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let chatHistory = currentEpisode?.chatHistory else { return 0 }
    return chatHistory.count
  }
  
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let chatHistory = currentEpisode?.chatHistory else { return UITableViewCell() }
    let target = chatHistory[indexPath.row]
    let chatText = chatHistory[indexPath.row].text
    
    if target.type == .onlyText && target.who.info().name == "이단희"{
      let cell = chatHistoryTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! MyTextTableViewCell
      cell.delegate = self
      cell.inputCharacter = target.who.info()
      cell.myTextCellUpdate(name: target.who, chat: chatText, profile: target.characterFace, godchat: target.isGod, currentDanhee: currentHistoryDanhee())
//            cell.layoutIfNeeded()
      return cell
    }
      //상대가 보냈을 때
      else if target.type == .onlyText {
          let cell = chatHistoryTableView.dequeueReusableCell(withIdentifier: "opTextCell", for: indexPath) as! OpTextTableViewCell
          cell.profileNickname.textColor = .white
          cell.delegate = self
          cell.inputCharacter = target.who.info()
          cell.configure(name: target.who, chat: chatText,normalProfile: target.who.info().profileImage, mainProfile: target.characterFace, isLocked: target.who.info().isLocked, godchat: target.isGod)
          cell.contentView.setNeedsDisplay()
          return cell
      }
      //터치할 수 없는 이미지
      else if target.type == .untouchableImage {
          print("메인게임 - 이미지 출력")
          let cell = chatHistoryTableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell
          cell.imageUpdate(mainImage: target.image, godchat: target.isGod)
          return cell
      }
      //행동 표시글 셀
      else if target.type == .sectionHeader{
          print("메인게임 - 섹션헤더 출력")
          let cell = chatHistoryTableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! SectionTableViewCell
          cell.updateStyle(text: chatText, isGod: target.isGod)
          return cell
      }
      else if target.type == .monologue{
          let cell = chatHistoryTableView.dequeueReusableCell(withIdentifier: "monologue", for: indexPath) as! MonologueTableViewCell
          cell.delegate = self
          cell.inputCharacter = target.who.info()
          cell.monologueText.text = chatText
          cell.name.textColor = .white
          cell.chatUpdate(nickname: target.who, profile: target.characterFace, godchat: target.isGod, currentDanhee: currentHistoryDanhee())
          return cell
      }
      else if target.type == .ar{
          let cell = chatHistoryTableView.dequeueReusableCell(withIdentifier: "arTableViewCell", for: indexPath) as! ARTableViewCell
          cell.delegate = self
          if let arContent = target.optionalOption?.arContent {
              cell.currentAR = arContent
          }
          
          return cell
      }
      else if (target.type == .endGodChat || target.type == .startGodChat)
      {
          print("메인게임 - 구분자 채팅 출력")
          let cell = chatHistoryTableView.dequeueReusableCell(withIdentifier: "separatorCell", for: indexPath) as! SeparatorTableViewCell
          cell.separatorUpdate(chatType: target.type)
          return cell
      }
      else {
          print("메인게임 - 오류 발생1")
          return UITableViewCell()
      }
  }
  
  func profileImageTapped(inputCharacter: GameCharacter) {
    if inputCharacter.name == "이단희" {
      performSegue(withIdentifier: "goToDanhee", sender: inputCharacter)
    }
    else if inputCharacter.name == "휘령" && !inputCharacter.isLocked {
      performSegue(withIdentifier: "goToHwiryeong", sender: inputCharacter)
    }
    else if inputCharacter.description != "" && !inputCharacter.isLocked {
      performSegue(withIdentifier: "goToOthers", sender: inputCharacter)
    }
  }
}


extension EPHistoryViewController: ArDelegate {
    
  func goToAR(arid: ArId) {
    print("buttonClicked")
    let dataToSend: ArId
    dataToSend = arid
    performSegue(withIdentifier: "goToARView", sender: dataToSend)
  }
  
  
}

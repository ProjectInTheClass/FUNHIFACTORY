//
//  NoteViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/29.
//

import UIKit

class NoteViewController: UIViewController {

  enum Category {
    case character
    case history
  }
  
  @IBOutlet weak var noteTableView: UITableView!
  @IBOutlet var designTableView: UITableView!
  @IBOutlet var backgroundView: UIView!
  @IBOutlet weak var exitButton: SoundButton!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet weak var noteBackgroundView: UIView!
  @IBOutlet var pageButtons: [SoundButton]!
  @IBOutlet var titleButtons: [SoundButton]!
  @IBOutlet var casePopupBackgroundView: UIView!
  @IBOutlet weak var casePopupBoxView: UIView!
  @IBOutlet weak var casePopopBackgroundViewTopBar: UIView!
  @IBOutlet weak var caseNameLabel: UILabel!
  @IBOutlet weak var caseLongDescriptionLabel: UILabel!
  
  let currentPageButtonTitleColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
  let currentPageButtonBackgroundColor = UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1)
  let otherPageButtonTitledColor = UIColor(red: 0.109, green: 0.201, blue: 0.275, alpha: 1)
  let otherPageButtonBackgroundColor = UIColor(red: 0.341, green: 0.478, blue: 0.604, alpha: 1)
  
  var currentNotePageInt: Int = 0 {
    didSet {
      noteTableView.reloadData()
    }
  }
  
  var category: Category = .character {
    didSet {
      switch category {
      case .character:
        pageButtons[0].isHidden = false
      case .history:
        pageButtons[0].isHidden = true
      }
      noteTableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    noteTableView.delegate = self
    noteTableView.dataSource = self
    designTableView.delegate = self
    designTableView.dataSource = self
    setupStyle()
    
    updateTitle(.character)
    updatePage(0)
  }

  override func viewWillAppear(_ animated: Bool) {
    noteTableView.reloadData()
    setupButtons()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    let time = DispatchTime.now() + .milliseconds(400)
    DispatchQueue.main.asyncAfter(deadline: time) { [weak self] in
      self?.setupTutorial()
    }
  }

  @IBAction func backAction(_ sender: Any) {
    popWithAnimation()
    updateTitle(.character)
    updatePage(0)

  }

  @IBAction func characterButtonAction(_ sender: Any) {
    updateTitle(.character)
  }

  @IBAction func caseButtonAction(_ sender: Any) {
    updateTitle(.history)
  }
  
  @IBAction func page1ButtonAction(_ sender: Any) {
    updatePage(0)
  }
  
  @IBAction func page2ButtonAction(_ sender: Any) {
    updatePage(1)
  }

  @IBAction func page3ButtonAction(_ sender: Any) {
    updatePage(2)
  }
  
  @IBAction func page4ButtonAction(_ sender: Any) {
    updatePage(3)
  }
    
  @IBAction func page5ButtonAction(_ sender: Any) {
    updatePage(4)
  }
    
  @IBAction func exitCasePopupAction(_ sender: Any) {
    popupViewOff(popupView: casePopupBoxView, blackView: casePopupBackgroundView, priviousScale: 1.0, afterScale: 0.3)
  }
  
  private func updateTitle(_ title: Category) {
    self.category = title
    category == .character ? updatePage(0) : updatePage(1)
    if category == .character {
      titleButtons[0].setTitleColor(currentPageButtonTitleColor, for: .normal)
      titleButtons[0].backgroundColor = currentPageButtonBackgroundColor
      titleButtons[1].setTitleColor(otherPageButtonTitledColor, for: .normal)
      titleButtons[1].backgroundColor = otherPageButtonBackgroundColor
    }
    if category == .history {
      titleButtons[1].setTitleColor(currentPageButtonTitleColor, for: .normal)
      titleButtons[1].backgroundColor = currentPageButtonBackgroundColor
      titleButtons[0].setTitleColor(otherPageButtonTitledColor, for: .normal)
      titleButtons[0].backgroundColor = otherPageButtonBackgroundColor
    }
  }
  
  private func setupButtons() {
    for button in pageButtons.enumerated() {
      let currentEpisode = player.currentEpisodes[button.offset]
      currentEpisode.isStarted ? button.element.setTitle(String(currentEpisode.episodeYear), for: .normal) : button.element.setTitle("????", for: .normal)
      button.element.layer.cornerRadius = 10
      button.element.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
      button.element.titleLabel?.font =  UIFont(name: "NanumSquareEB", size: 17)
    }
    
    for button in titleButtons.enumerated() {
      let titles = ["인물", "역사"]
      let currentTitle = titles[button.offset]
      button.element.setTitle(String(currentTitle), for: .normal)
      button.element.layer.cornerRadius = 10
      button.element.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
      button.element.titleLabel?.font =  UIFont(name: "NanumSquareEB", size: 17)
    }
  }
  
  private func updatePage(_ page: Int) {
    currentNotePageInt = page
    pageButtons.enumerated().forEach { index, button in
      if index == currentNotePageInt {
        button.setTitleColor(currentPageButtonTitleColor, for: .normal)
        button.backgroundColor = currentPageButtonBackgroundColor
      } else {
        button.setTitleColor(otherPageButtonTitledColor, for: .normal)
        button.backgroundColor = otherPageButtonBackgroundColor
      }
    }
  }
}


// MARK: TableView DataSource

extension NoteViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var row = 0
    guard tableView == noteTableView else { return 12 }
    let episode = player.currentEpisodes[currentNotePageInt]
    if category == .character { row = episode.currentCharacterNote.count }
    if category == .history { row = episode.currentCaseNote.count }
    return row
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if tableView == designTableView {
      let cell = tableView.dequeueReusableCell(withIdentifier: "SpringCell", for: indexPath) as! SpringCell
      return cell
    }
    
    if tableView == noteTableView {
      let currentEpisode = player.currentEpisodes[currentNotePageInt]
      switch category {
      case .character:
        let character = currentEpisode.currentCharacterNote[indexPath.row]
        print("\(character.name) 잠김: \(character.isLocked)")
        if character.name == "이단희" || character.name == "휘령" {
          let cell = tableView.dequeueReusableCell(withIdentifier: "NoteMainCharacterCell", for: indexPath) as! NoteMainCharacterCell
          cell.configureCell(character: character)
          return cell
        } else {
          let cell = tableView.dequeueReusableCell(withIdentifier: "NoteOtherCharacterCell", for: indexPath) as! NoteOtherCharacterCell
          cell.configureCell(character: character)
          return cell
        }
      case .history:
        let history = currentEpisode.currentCaseNote[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteHistoryCell", for: indexPath) as! NoteHistoryCell
        cell.configureCell(history: history)
        return cell
      }
    } else { return UITableViewCell() }
  }
}

// MARK: TableView Delegate

extension NoteViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView == noteTableView {
      if category == .character {
        let note = player.currentEpisodes[currentNotePageInt].currentCharacterNote[indexPath.row]
        guard !note.isLocked else { return }
        playEffectSound(.buttonClick, type: .mp3)
        player.currentEpisodes[currentNotePageInt].currentCharacterNote[indexPath.row].isChecked = true
        let dataToSend = note
        //이단희 셀일 때
        if note.name == "이단희" {
          performSegue(withIdentifier: "goToUserNoteView", sender: dataToSend)
        //휘령 셀일 때
        } else if note.name == "휘령" {
          performSegue(withIdentifier: "goToHwiryeongNoteView", sender: dataToSend)
        // 그 외 인물 셀일 때
        } else {
          performSegue(withIdentifier: "sibal", sender: dataToSend)
        }
      }
      
      if category == .history {
        let history = player.currentEpisodes[currentNotePageInt].currentCaseNote[indexPath.row]
        guard !history.isLocked else { return }
        playEffectSound(.buttonClick, type: .mp3)
        player.currentEpisodes[currentNotePageInt].currentCaseNote[indexPath.row].isChecked = true
        tableView.reloadRows(at: [indexPath], with: .none)
        caseNameLabel.text = history.title
        caseLongDescriptionLabel.text = history.longDescription
        popupViewOn(blackView: casePopupBackgroundView, popupView: casePopupBoxView, priviousScale: 0.6, afterScale: 1.0)
      }
    }
  }
}

extension NoteViewController {
    
  func setupStyle() {
    noteBackgroundView.backgroundColor = UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1)
    titleLabel.font = UIFont(name: "NanumSquareEB", size: 29)
    noteBackgroundView.layer.cornerRadius = 24
    noteBackgroundView.setShadow(color: UIColor(red: 0.174, green: 0.292, blue: 0.404, alpha: 1), offsetX: 24, offsetY: -15, opacity: 1, radius: 0)
    noteBackgroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    caseLongDescriptionLabel.setLineSpacing(6)
    caseLongDescriptionLabel.textAlignment = .center
    casePopupBoxView.layer.cornerRadius = 14
    casePopupBoxView.setBolder(color: UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1), width: 4)
    casePopopBackgroundViewTopBar.backgroundColor = UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1)
    casePopopBackgroundViewTopBar.layer.cornerRadius = 14
    casePopopBackgroundViewTopBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
  }
    
  func popupViewOn(blackView: UIView, popupView: UIView, priviousScale: CGFloat, afterScale: CGFloat) {
    let backgroundView = self.view!
    backgroundView.addSubview(blackView)
    backgroundView.bringSubviewToFront(blackView)
    blackView.bounds = self.view.bounds
    blackView.center = backgroundView.center
    popupView.isHidden = false
    popupView.alpha = 0
    blackView.alpha = 1
    popupView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
   
    UIView.animate(withDuration: 0.2) {
      popupView.transform = CGAffineTransform(scaleX: afterScale, y: afterScale)
      popupView.alpha = 1
    }
  }

  func popupViewOff(popupView: UIView, blackView: UIView, priviousScale: CGFloat, afterScale: CGFloat) {
    popupView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
   
    UIView.animate(withDuration: 0.2) {
      popupView.transform = CGAffineTransform(scaleX: afterScale, y: afterScale)
      popupView.alpha = 0
    } completion: { (Bool) in
      UIView.animate(withDuration: 0.1) {
        blackView.alpha = 0
      } completion: { (Bool) in
        blackView.removeFromSuperview()
      }
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToUserNoteView" {
      let destination = segue.destination as! NoteUserViewController
      if let gameCharacter = sender as? GameCharacter {
        destination.recievedGameCharacter = gameCharacter
      }
    }
    if segue.identifier == "sibal" {
      let destination = segue.destination as! NoteGameCharacterViewController
      if let gameCharacter = sender as? GameCharacter {
        destination.recievedGameCharacter = gameCharacter
      }
    }
    if segue.identifier == "goToHwiryeongNoteView" {
      let destination = segue.destination as! NoteHeeryeongViewController
      if let gameCharacter = sender as? GameCharacter {
        destination.recievedGameCharacter = gameCharacter
      }
    }
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}

extension NoteViewController {
  func setupTutorial() {
    let items: [TutorialStyle] = [
      .singleFillImage(image: "note_11", desc: "플레이하면서 얻은 정보는 수첩에서 자세히 볼 수 있습니다."),
      .singleFillImage(image: "note_22", desc: "자세히 보고 싶은 인물을 클릭하면 해당 인물의 상세 정보를 볼 수 있습니다."),
      .singleFillImage(image: "note_33", desc: "자세히 보고 싶은 역사 사건을 클릭하면 해당 사건의 상세 정보를 볼 수 있습니다."),
      .singleFillImage(image: "note_44", desc: "플레이한 사건들에 대한 정보를 각각 볼 수 있습니다."),
    ]
    
    TutorialView.showTutorial(inView: view, items: items, type: .note)
  }
}

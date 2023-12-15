//
//  AlbumVC.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/07.
//

import UIKit

class AlbumVC: UIViewController {
    
  @IBOutlet var albumLabel: UILabel!
  @IBOutlet weak var albumTableView: UITableView!
  @IBOutlet weak var designTableView: UITableView!
  @IBOutlet weak var albumBackgroundView: UIView!
  
  @IBOutlet weak var pageButton1: SoundButton!
  @IBOutlet weak var pageButton2: SoundButton!
  @IBOutlet weak var pageButton3: SoundButton!
  @IBOutlet weak var pageButton4: SoundButton!
  @IBOutlet weak var pageButton5: SoundButton!
  @IBOutlet var pageButtons: [SoundButton]!
  
  var currentNotePageInt: Int = 0 {
    didSet {
      albumTableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    setupTableView()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    updatePage(0)
    setupButtons()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    showTutorial()
  }
  
  @IBAction func backAction(_ sender: Any) {
    popWithAnimation()
  }
  
  @IBAction func pageButton1Action(_ sender: Any) {
    updatePage(0)
  }
  
  @IBAction func pageButton2Action(_ sender: Any) {
    updatePage(1)
  }
  
  @IBAction func pageButton3Action(_ sender: Any) {
    updatePage(2)
  }
  
  @IBAction func pageButton4Action(_ sender: Any) {
    updatePage(3)
  }
  
  @IBAction func pageButton5Action(_ sender: Any) {
    updatePage(4)
  }
    
  private func setupTableView() {
    albumTableView.register(UINib(nibName: "AlbumCell", bundle: nil), forCellReuseIdentifier: "AlbumCell")
    designTableView.register(UINib(nibName: "SpringCell", bundle: nil), forCellReuseIdentifier: "SpringCell")
    
    albumTableView.delegate = self
    albumTableView.dataSource = self
    designTableView.delegate = self
    designTableView.dataSource = self
  }
  
  private func setupStyle() {
    albumBackgroundView.backgroundColor = UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1)
    albumBackgroundView.layer.cornerRadius = 24
    albumBackgroundView.setShadow(color: UIColor(red: 0.174, green: 0.292, blue: 0.404, alpha: 1), x: 24, y: -15, opacity: 1, radius: 0)
    albumBackgroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
  }
    
  private func setupButtons() {
    pageButtons.enumerated().forEach { index, button in
      let currentEpisode = player.currentEpisodes[index]
      currentEpisode.isStarted ? button.setTitle(String(currentEpisode.episodeYear), for: .normal) : button.setTitle("????", for: .normal)
      button.layer.cornerRadius = 10
      button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
      button.titleLabel?.font =  UIFont(name: "NanumSquareEB", size: 17)
    }
  }

  private func updatePage(_ page: Int) {
    let currentPageButtonTitleColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    let currentPageButtonBackgroundColor = UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1)
    let otherPageButtonTitledColor = UIColor(red: 0.109, green: 0.201, blue: 0.275, alpha: 1)
    let otherPageButtonBackgroundColor = UIColor(red: 0.341, green: 0.478, blue: 0.604, alpha: 1)
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
  
  private func showPopup(indexPath: IndexPath) {
    let popup = AlbumAlertView()
    let image = player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row]
    
    view.addSubview(popup)
    popup.pinToEdges(inView: view)
    popup.configure(image: image)
  }
}

extension AlbumVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == designTableView {
      return 20
    } else {
      return player.currentEpisodes[currentNotePageInt].currentAlbumImages.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard tableView == albumTableView else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "SpringCell", for: indexPath) as! SpringCell
      return cell
    }
    let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
    cell.configureCell(data: player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row])
    return cell
  }
  
 
}

extension AlbumVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard tableView != designTableView,
          !player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].isLocked else { return }
    
    playEffectSound(.buttonClick, type: .mp3)
    player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].isChecked = true
    showPopup(indexPath: indexPath)
    tableView.reloadData()
  }
}

extension AlbumVC {
  
  func showTutorial() {
    guard !player.userStore.isAlbumTutorialOpened else { return }
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(400)) { [weak self] in
      self?.setupTutorial()
    }
  }
  
  func setupTutorial() {
    let items: [TutorialStyle] = [
      .singleFillImage(image: "album_11", desc: "자세히 보고 싶은 앨범 이미지를 클릭하면 자세히 볼 수 있습니다."),
      .singleFillImage(image: "album_22", desc: "플레이한 사건들에 대한 앨범을 각각 볼 수 있습니다.")
    ]
    
    TutorialView.showTutorial(inView: view, items: items, type: .album)
    player.userStore.isAlbumTutorialOpened = true
  }
}

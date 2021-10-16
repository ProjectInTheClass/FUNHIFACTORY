//
//  AlbumViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/07.
//

import UIKit

class AlbumViewController: UIViewController {
    
  @IBOutlet var albumLabel: UILabel!
  @IBOutlet weak var albumTableView: UITableView!
  @IBOutlet weak var designTableView: UITableView!
  @IBOutlet weak var albumBackgroundView: UIView!
  
  @IBOutlet var albumPopupBackgroundView: UIView!
  @IBOutlet weak var albumPopupBoxTopBarView: UIView!
  @IBOutlet var albumPopupBoxView: UIView!
  @IBOutlet weak var albumPoopupTitleLabel: UILabel!
  @IBOutlet weak var albumPopupImageView: UIImageView!
  @IBOutlet weak var albumPopupDescriptionLabel: UILabel!
  
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
    super.viewDidLoad()
    self.albumTableView.delegate = self
    self.albumTableView.dataSource = self
    self.designTableView.delegate = self
    self.designTableView.dataSource = self
    setupXib()
    setupPopup()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    updatePage(0)
    setupButtons()
  }
  
  @IBAction func backAction(_ sender: Any) {
    popWithAnimation()

  }

  @IBAction func popupExitButton(_ sender: Any) {
    popupViewOff(popupView: albumPopupBoxView, blackView: albumPopupBackgroundView, priviousScale: 1.0, afterScale: 0.2)
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
    
  private func setupXib() {
    albumTableView.register(UINib(nibName: "AlbumCell", bundle: nil), forCellReuseIdentifier: "AlbumCell")
  }
  
  private func setupStyle() {
    albumBackgroundView.backgroundColor = UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1)
    albumBackgroundView.layer.cornerRadius = 24
    albumBackgroundView.setShadow(color: UIColor(red: 0.174, green: 0.292, blue: 0.404, alpha: 1), offsetX: 24, offsetY: -15, opacity: 1, radius: 0)
    albumBackgroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
  }
  
  private func setupPopup() {
    albumPoopupTitleLabel.font = UIFont(name: "NanumSquareEB", size: 23)
    albumPopupDescriptionLabel.setLineSpacing(lineSpacing: 6)
    albumPopupDescriptionLabel.textAlignment = .center
    albumPopupBoxTopBarView.layer.cornerRadius = 16
    albumPopupBoxTopBarView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    albumPopupBoxView.layer.cornerRadius = 16
    albumPopupBoxView.setBolder(color: UIColor(red: 0.616, green: 0.71, blue: 0.796, alpha: 1), width: 4)
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
  
  private func popupViewOn(blackView: UIView, popupView: UIView,titleLabel: UILabel, descriptionLabel: UILabel, imageView: UIImageView, priviousScale: CGFloat, afterScale: CGFloat, indexPath: IndexPath) {
    let backgroundView = self.view!
    let currentAlbumImage = player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row]
    titleLabel.text = currentAlbumImage.title
    imageView.image = UIImage(named: currentAlbumImage.image)
    descriptionLabel.text = currentAlbumImage.description
    backgroundView.addSubview(blackView)
    backgroundView.bringSubviewToFront(blackView)
    blackView.bounds = self.view.bounds
    blackView.center = self.view.center
    popupView.isHidden = false
    popupView.alpha = 0
    blackView.alpha = 1
    popupView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
   
    UIView.animate(withDuration: 0.2) {
      popupView.transform = CGAffineTransform(scaleX: afterScale, y: afterScale)
      popupView.alpha = 1
    }
  }
    
  private func popupViewOff(popupView: UIView, blackView: UIView, priviousScale: CGFloat, afterScale: CGFloat) {
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
}

extension AlbumViewController: UITableViewDataSource {
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

extension AlbumViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard tableView != designTableView else { return }
    guard !player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].isLocked else { return }
    player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].isChecked = true
    
    popupViewOn(blackView: albumPopupBackgroundView,popupView: albumPopupBoxView, titleLabel: albumPoopupTitleLabel, descriptionLabel: albumPopupDescriptionLabel, imageView: albumPopupImageView, priviousScale: 0.5, afterScale: 1.0, indexPath: indexPath)
    tableView.reloadData()
  }
}

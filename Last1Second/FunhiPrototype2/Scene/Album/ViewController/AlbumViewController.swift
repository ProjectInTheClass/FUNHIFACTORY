//
//  AlbumViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/07.
//

import UIKit
//---------------뷰컨--------------------------------------------------------
class AlbumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//--------------------테이블 뷰------------------------------------------------
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == designTableView {
      return 20
    } else {
      return player.currentEpisodes[currentNotePageInt].currentAlbumImages.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard tableView == albumTableView else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "designTableViewCell", for: indexPath) as! DesignTableViewCell
      cell.springImageView.image = UIImage(named: "note ring image")
      return cell
    }
    let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
    cell.configureCell(data: player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard tableView != designTableView else { return }
    guard !player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].isLocked else { return }
    popupViewOn(blackView: albumPopupBackgroundView,popupView: albumPopupBoxView, titleLabel: albumPoopupTitleLabel, descriptionLabel: albumPopupDescriptionLabel, imageView: albumPopupImageView, priviousScale: 0.5, afterScale: 1.0, indexPath: indexPath)
  }
  
//------------------------------일반----------------------------------------
  
  var currentNotePageInt: Int = 0 {
    didSet {
      albumTableView.reloadData()
    }
  }
  
  @IBOutlet var albumLabel: UILabel!
  @IBOutlet weak var albumTableView: UITableView!
  @IBOutlet weak var designTableView: UITableView!
  @IBOutlet weak var albumBackgroundView: UIView!
  
  @IBAction func backAction(_ sender: Any) {
    let transition:CATransition = CATransition()
    transition.duration = 0.4
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    transition.type = CATransitionType.reveal
    transition.subtype = CATransitionSubtype.fromTop
    self.navigationController!.view.layer.add(transition, forKey: kCATransition)
    self.navigationController?.popViewController(animated: false)
    audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.albumTableView.delegate = self
    self.albumTableView.dataSource = self
    self.designTableView.delegate = self
    self.designTableView.dataSource = self
    setupXib()
    albumBackgroundView.backgroundColor = UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1)
    albumBackgroundView.layer.cornerRadius = 24
    albumBackgroundView.setShadow(color: UIColor(red: 0.174, green: 0.292, blue: 0.404, alpha: 1), offsetX: 24, offsetY: -15, opacity: 1, radius: 0)
    albumBackgroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    designPopup()
  }
  
  private func setupXib() {
    albumTableView.register(UINib(nibName: "AlbumCell", bundle: nil), forCellReuseIdentifier: "AlbumCell")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    updatePage(newPageNumber: 0)
    buttonDesign()
  }
  
    //---------------------------팝업뷰-------------------------------
    @IBOutlet var albumPopupBackgroundView: UIView!
    @IBOutlet weak var albumPopupBoxTopBarView: UIView!
    @IBOutlet var albumPopupBoxView: UIView!
    @IBOutlet weak var albumPoopupTitleLabel: UILabel!
    @IBOutlet weak var albumPopupImageView: UIImageView!
    @IBOutlet weak var albumPopupDescriptionLabel: UILabel!
    @IBAction func popupExitButton(_ sender: Any) {
        popupViewOff(popupView: albumPopupBoxView, blackView: albumPopupBackgroundView, priviousScale: 1.0, afterScale: 0.2)
    }
    
    func designPopup() {
        albumPoopupTitleLabel.font = UIFont(name: "NanumSquareEB", size: 23)
        albumPopupDescriptionLabel.setLineSpacing(lineSpacing: 6)
        albumPopupDescriptionLabel.textAlignment = .center
        albumPopupBoxTopBarView.layer.cornerRadius = 16
        
        albumPopupBoxTopBarView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        albumPopupBoxView.layer.cornerRadius = 16
        albumPopupBoxView.setBolder(color: UIColor(red: 0.616, green: 0.71, blue: 0.796, alpha: 1), width: 4)
            
    }
    
   
    
    //------------버튼-------------------------------------
    @IBOutlet weak var pageButton1: UIButton!
    @IBOutlet weak var pageButton2: UIButton!
    @IBOutlet weak var pageButton3: UIButton!
    @IBOutlet weak var pageButton4: UIButton!
    @IBOutlet weak var pageButton5: UIButton!

    
    @IBOutlet var pageButtons: [UIButton]!

    
    @IBAction func pageButton1Action(_ sender: Any) {
        updatePage(newPageNumber: 0)
    }
    
    @IBAction func pageButton2Action(_ sender: Any) {
        updatePage(newPageNumber: 1)
    }
    
    @IBAction func pageButton3Action(_ sender: Any) {
        updatePage(newPageNumber: 2)
    }
    
    @IBAction func pageButton4Action(_ sender: Any) {
        updatePage(newPageNumber: 3)
    }
    
    @IBAction func pageButton5Action(_ sender: Any) {
        updatePage(newPageNumber: 4)
    }
    

    func buttonDesign() {
        
        for button in pageButtons.enumerated() {
            
            let currentEpisode = player.currentEpisodes[button.offset]
            
            currentEpisode.isStarted ? button.element.setTitle(String(currentEpisode.episodeYear), for: .normal) : button.element.setTitle("????", for: .normal)
            
            button.element.layer.cornerRadius = 10
            button.element.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            button.element.titleLabel?.font =  UIFont(name: "NanumSquareEB", size: 17)
        }
    }


    func updatePage(newPageNumber: Int) {
        
        currentNotePageInt = newPageNumber
        
        _ = pageButtons[currentNotePageInt]
        
        let currentPageButtonTitleColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        let currentPageButtonBackgroundColor = UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1)
        let otherPageButtonTitledColor = UIColor(red: 0.109, green: 0.201, blue: 0.275, alpha: 1)
        let otherPageButtonBackgroundColor = UIColor(red: 0.341, green: 0.478, blue: 0.604, alpha: 1)
        
        for button in pageButtons.enumerated() {
            if button.offset == currentNotePageInt {
                button.element.setTitleColor(currentPageButtonTitleColor, for: .normal)
                button.element.backgroundColor = currentPageButtonBackgroundColor
            } else {
                button.element.setTitleColor(otherPageButtonTitledColor, for: .normal)
                button.element.backgroundColor = otherPageButtonBackgroundColor
            }
      }
  }
    
//--------------------함수-------------------------
    
    func popupViewOn(blackView: UIView, popupView: UIView,titleLabel: UILabel, descriptionLabel: UILabel, imageView: UIImageView, priviousScale: CGFloat, afterScale: CGFloat, indexPath: IndexPath) {
        let backgroundView = self.view!
        let currentAlbumImage = player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row]
        
        //뷰 두 개(이미지, 글씨) 서브뷰로 추가
        titleLabel.text = currentAlbumImage.title
        imageView.image = UIImage(named: currentAlbumImage.image)
        descriptionLabel.text = currentAlbumImage.description
        
        backgroundView.addSubview(blackView)
        backgroundView.bringSubviewToFront(blackView)
        
        //이미지뷰만 히든 풀고, 뷰들 정렬함. 텍스트뷰는 서서히 나타나는 애니메이션을 위해 알파 0으로 설정해둠.
        blackView.bounds = self.view.bounds
        blackView.center = self.view.center
        popupView.isHidden = false
        popupView.alpha = 0
        blackView.alpha = 1
        popupView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
       
        //애니메이션
        UIView.animate(withDuration: 0.2) {
            popupView.transform = CGAffineTransform(scaleX: afterScale, y: afterScale)
            popupView.alpha = 1
        }
    }
    
    func popupViewOff(popupView: UIView, blackView: UIView, priviousScale: CGFloat, afterScale: CGFloat) {
        _ = self.view!
       
     
        popupView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
        
        //애니메이션
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
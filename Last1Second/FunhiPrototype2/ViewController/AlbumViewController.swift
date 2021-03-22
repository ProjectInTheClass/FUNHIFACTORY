//
//  AlbumViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/07.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumImageNameLabel: UILabel!
    @IBOutlet weak var lockedView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        albumImageNameLabel.font = UIFont(name: "NanumSquareEB", size: 15)
        albumImageView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        albumImageView.layer.borderWidth = 4
        albumImageView.layer.cornerRadius = 7
        
        lockedView.layer.cornerRadius = 7
        lockedView.layer.borderWidth = 4
        lockedView.layer.borderColor = UIColor(red: 0.314, green: 0.471, blue: 0.6, alpha: 1).cgColor
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
       
    }
}
//---------------뷰컨------------------
class AlbumViewController: UIViewController,UITableViewDelegate,UITableViewDataSource   {
    
    
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
            cell.springImageView.image = UIImage(named: "spring image")
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumTableViewCell
        cell.albumImageView.image = UIImage(named: player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].image)
        cell.albumImageNameLabel.text = player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].title
        if player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].isLocked {
            cell.lockedView.isHidden = false
        } else {
            cell.lockedView.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard !player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].isLocked else { return }
        popupViewOn(blackView: albumPopupBackgroundView,popupView: albumPopupBoxView, titleLabel: albumPoopupTitleLabel, descriptionLabel: albumPopupDescriptionLabel, imageView: albumPopupImageView, priviousScale: 0.5, afterScale: 1.0, indexPath: indexPath)
        
    }
  
  
    
//-----------------일반--------------------
    

    
    @IBOutlet var albumLabel: UILabel!
    @IBOutlet weak var albumTableView: UITableView!
    @IBOutlet weak var designTableView: UITableView!
    
    @IBOutlet weak var albumBackgroundView: UIView!
    @IBOutlet weak var pageButton1: UIButton!
    @IBOutlet weak var pageButton2: UIButton!
    @IBOutlet weak var pageButton3: UIButton!
    @IBOutlet weak var pageButton4: UIButton!
    @IBOutlet weak var pageButton5: UIButton!

    
    @IBOutlet var pageButtons: [UIButton]!
    //팝업뷰
    @IBOutlet var albumPopupBackgroundView: UIView!
    @IBOutlet weak var albumPopupBoxTopBarView: UIView!
    @IBOutlet var albumPopupBoxView: UIView!
    @IBOutlet weak var albumPoopupTitleLabel: UILabel!
    @IBOutlet weak var albumPopupImageView: UIImageView!
    @IBOutlet weak var albumPopupDescriptionLabel: UILabel!
    @IBAction func backAction(_ sender: Any) {
        let transition:CATransition = CATransition()
          transition.duration = 0.35
          transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromTop
          self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.popViewController(animated: false)
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    @IBAction func popupExitButton(_ sender: Any) {
        popupViewOff(popupView: albumPopupBoxView, blackView: albumPopupBackgroundView, priviousScale: 1.0, afterScale: 0.2)
    }
    
    var currentNotePageInt: Int = 1 {
        didSet {
            albumTableView.reloadData()
            
        }
    }
    
   
    
    @IBAction func pageButton1Action(_ sender: Any) {
 
        setButtonTitleColor(newPageNumber: 1)
    }
    @IBAction func pageButton2Action(_ sender: Any) {
      
        setButtonTitleColor(newPageNumber: 2)
    }
    @IBAction func pageButton3Action(_ sender: Any) {
      
        setButtonTitleColor(newPageNumber: 3)
    }
    @IBAction func pageButton4Action(_ sender: Any) {
   
        setButtonTitleColor(newPageNumber: 4)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.albumTableView.delegate = self
        self.albumTableView.dataSource = self
        self.designTableView.delegate = self
        self.designTableView.dataSource = self
        albumBackgroundView.layer.cornerRadius = 24
        albumBackgroundView.layer.shadowColor = UIColor(red: 0.174, green: 0.292, blue: 0.404, alpha: 1).cgColor
        albumBackgroundView.layer.shadowOffset = CGSize(width: 26, height: -17)
        albumBackgroundView.layer.shadowOpacity = 1
        albumBackgroundView.layer.shadowRadius = 0
        albumBackgroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        buttonBarDesign()
        designPopup()
        currentNotePageInt = 1
        for button in pageButtons {
            button.layer.cornerRadius = 10
            button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        currentNotePageInt = 1
        albumTableView.reloadData()
        buttonBarDesign()
      
    }
    

    func buttonBarDesign() {
        
        pageButton1.setTitle(String(player.currentEpisodes[1].episodeYear), for: .normal)
        pageButton2.setTitle(String(player.currentEpisodes[2].episodeYear), for: .normal)
        pageButton3.setTitle(String(player.currentEpisodes[3].episodeYear), for: .normal)
        pageButton4.setTitle(String(player.currentEpisodes[4].episodeYear), for: .normal)
        pageButton1.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        pageButton2.setTitleColor(UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), for: .normal)
        pageButton3.setTitleColor(UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), for: .normal)
        pageButton4.setTitleColor(UIColor(red: 0.471, green: 0.471, blue: 0.471, alpha: 1), for: .normal)
        
    }
    func designPopup() {
        albumLabel.font = UIFont(name: "NanumSquareEB", size: 29)

        
        albumPopupBoxTopBarView.layer.cornerRadius = 16
        albumPopupBoxTopBarView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
  
    func setButtonTitleColor(newPageNumber: Int) {
        let buttons = [pageButton5, pageButton1, pageButton2, pageButton3, pageButton4]
        if let button = buttons[currentNotePageInt] {
            button.setTitleColor(UIColor(red: 0.109, green: 0.201, blue: 0.275, alpha: 1), for: .normal)
            button.backgroundColor = UIColor(red: 0.341, green: 0.478, blue: 0.604, alpha: 1)
            currentNotePageInt = newPageNumber
        }
        if let button = buttons[currentNotePageInt] {
            button.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            button.backgroundColor = UIColor(red: 157/255, green: 181/255, blue: 203/255, alpha: 1)
        }
        
    }
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
        blackView.center = backgroundView.center
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
        let backgroundView = self.view!
       
     
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

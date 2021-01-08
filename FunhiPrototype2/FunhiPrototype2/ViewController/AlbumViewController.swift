//
//  AlbumViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/07.
//

import UIKit
class LeftAlbumCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var lockedView: UIView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    override func awakeFromNib() {
        designCell()
    }
    func designCell() {
        albumImageView.layer.cornerRadius = 5
        albumImageView.layer.borderWidth = 3
        albumImageView.layer.borderColor = UIColor(red: 0.123, green: 0.201, blue: 0.271, alpha: 1).cgColor
        lockedView.layer.cornerRadius = 5
    }
    
}
class RightAlbumCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var lockedView: UIView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    override func awakeFromNib() {
        designCell()
    }
    func designCell() {
        albumImageView.layer.cornerRadius = 5
        albumImageView.layer.borderWidth = 3
        albumImageView.layer.borderColor = UIColor(red: 0.123, green: 0.201, blue: 0.271, alpha: 1).cgColor
        lockedView.layer.cornerRadius = 5
    }
}
//---------------뷰컨------------------
class AlbumViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout   {
    
  
  //--------------콜렉션 뷰----------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return player.currentEpisodes[currentNotePageInt].currentAlbumImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if Int(indexPath.row) % 2 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "leftAlbumCollectionViewCell", for: indexPath) as! LeftAlbumCollectionViewCell
            cell.albumImageView.image = UIImage(named: player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].image)
            cell.albumTitleLabel.text = player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].title
            if player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].isLocked {
                cell.lockedView.isHidden = false
            } else {
                cell.lockedView.isHidden = true
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rightAlbumCollectionViewCell", for: indexPath) as! RightAlbumCollectionViewCell
            cell.albumImageView.image = UIImage(named: player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].image)
            cell.albumTitleLabel.text = player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].title
            if player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].isLocked {
                cell.lockedView.isHidden = false
            } else {
                cell.lockedView.isHidden = true
            }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard !player.currentEpisodes[currentNotePageInt].currentAlbumImages[indexPath.row].isLocked else { return }
        popupViewOn(popupView: albumPopupView, titleLabel: albumPoopupTitleLabel, descriptionLabel: albumPopupDescriptionLabel, imageView: albumPopupImageView, priviousScale: 0.5, afterScale: 1.0, indexPath: indexPath)
        
    }
    
//-----------------일반--------------------
    
    @IBOutlet weak var albumCollectionView: UICollectionView!
    
    @IBOutlet weak var pageButton1: UIButton!
    @IBOutlet weak var pageButton2: UIButton!
    @IBOutlet weak var pageButton3: UIButton!
    @IBOutlet weak var pageButton4: UIButton!
    @IBOutlet weak var pageButtonLine1: UIView!
    @IBOutlet weak var pageButtonLine2: UIView!
    @IBOutlet weak var pageButtonLine3: UIView!
    @IBOutlet weak var pageButtonLine4: UIView!
    //팝업뷰
    @IBOutlet var albumPopupView: UIView!
    @IBOutlet weak var albumPoopupTitleLabel: UILabel!
    @IBOutlet weak var albumPopupImageView: UIImageView!
    @IBOutlet weak var albumPopupDescriptionLabel: UILabel!
    @IBAction func exitButton(_ sender: Any) {
        popupViewOff(popupView: albumPopupView, priviousScale: 1.0, afterScale: 0.2)
    }
    
    var currentNotePageInt: Int = 0 {
        didSet {
            albumCollectionView.reloadData()
            
        }
    }
    
   
    
    @IBAction func pageButton1Action(_ sender: Any) {
        currentNotePageInt = 0
        pageButton1.setTitleColor(UIColor(red: 0.312, green: 0.208, blue: 0.134, alpha: 1), for: .normal)
        pageButton2.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        pageButton3.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        pageButton4.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        pageButtonLine1.backgroundColor = .black
        pageButtonLine2.backgroundColor = .clear
        pageButtonLine3.backgroundColor = .clear
        pageButtonLine4.backgroundColor = .clear
    }
    @IBAction func pageButton2Action(_ sender: Any) {
        currentNotePageInt = 1
        pageButton1.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        pageButton2.setTitleColor(UIColor(red: 0.312, green: 0.208, blue: 0.134, alpha: 1), for: .normal)
        pageButton3.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        pageButton4.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        pageButtonLine1.backgroundColor = .clear
        pageButtonLine2.backgroundColor = .black
        pageButtonLine3.backgroundColor = .clear
        pageButtonLine4.backgroundColor = .clear
    }
    @IBAction func pageButton3Action(_ sender: Any) {
        currentNotePageInt = 2
        pageButton1.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        pageButton2.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        pageButton3.setTitleColor(UIColor(red: 0.312, green: 0.208, blue: 0.134, alpha: 1), for: .normal)
        pageButton4.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        pageButtonLine1.backgroundColor = .clear
        pageButtonLine2.backgroundColor = .clear
        pageButtonLine3.backgroundColor = .black
        pageButtonLine4.backgroundColor = .clear
    }
    @IBAction func pageButton4Action(_ sender: Any) {
        currentNotePageInt = 3
        pageButton1.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        pageButton2.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        pageButton3.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        pageButton4.setTitleColor(UIColor(red: 0.312, green: 0.208, blue: 0.134, alpha: 1), for: .normal)
        pageButtonLine1.backgroundColor = .clear
        pageButtonLine2.backgroundColor = .clear
        pageButtonLine3.backgroundColor = .clear
        pageButtonLine4.backgroundColor = .black
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.albumCollectionView.delegate = self
        self.albumCollectionView.dataSource = self
        self.albumCollectionView.isUserInteractionEnabled = true
        buttonBarDesign()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        currentNotePageInt = 0
        albumCollectionView.reloadData()
        buttonBarDesign()
      
    }
    

    func buttonBarDesign() {
        
        pageButton1.setTitle(player.currentEpisodes[1].episodeName, for: .normal)
        pageButton2.setTitle(player.currentEpisodes[2].episodeName, for: .normal)
        pageButton3.setTitle(player.currentEpisodes[3].episodeName, for: .normal)
        pageButton4.setTitle(player.currentEpisodes[4].episodeName, for: .normal)
        pageButton1.setTitleColor(UIColor(red: 0.312, green: 0.208, blue: 0.134, alpha: 1), for: .normal)
        pageButton2.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        pageButton3.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        pageButton4.setTitleColor(UIColor(red: 0.538, green: 0.437, blue: 0.437, alpha: 1), for: .normal)
        pageButtonLine1.backgroundColor = .black
        pageButtonLine2.backgroundColor = .clear
        pageButtonLine3.backgroundColor = .clear
        pageButtonLine4.backgroundColor = .clear
    }
    func designPopup() {
        
    }
  
    func popupViewOn(popupView: UIView,titleLabel: UILabel, descriptionLabel: UILabel, imageView: UIImageView, priviousScale: CGFloat, afterScale: CGFloat, indexPath: IndexPath) {
        let backgroundView = self.view!
        let currentAlbumImage = currentDay().currentAlbumImages[indexPath.row]
        //뷰 두 개(이미지, 글씨) 서브뷰로 추가
        titleLabel.text = currentAlbumImage.title
        imageView.image = UIImage(named: currentAlbumImage.image)
        descriptionLabel.text = currentAlbumImage.description
        
        backgroundView.addSubview(popupView)
        backgroundView.bringSubviewToFront(popupView)
        
        //이미지뷰만 히든 풀고, 뷰들 정렬함. 텍스트뷰는 서서히 나타나는 애니메이션을 위해 알파 0으로 설정해둠.
        popupView.center = backgroundView.center
        popupView.isHidden = false
        popupView.alpha = 0
      
        popupView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
       
        //애니메이션
        UIView.animate(withDuration: 0.2) {
            popupView.transform = CGAffineTransform(scaleX: afterScale, y: afterScale)
            popupView.alpha = 1
        }
    }
    func popupViewOff(popupView: UIView, priviousScale: CGFloat, afterScale: CGFloat) {
        let backgroundView = self.view!
       
     
        popupView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
        
        //애니메이션
        UIView.animate(withDuration: 0.2) {
            popupView.transform = CGAffineTransform(scaleX: afterScale, y: afterScale)
            popupView.alpha = 0
        } completion: { (Bool) in
            popupView.removeFromSuperview()
        }
        
    }

}

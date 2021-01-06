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
        
    }
}
class RightAlbumCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var lockedView: UIView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    override func awakeFromNib() {
        
    }
}
//---------------뷰컨------------------
class AlbumViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout   {
    
  
  //--------------콜렉션 뷰----------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentDay().currentAlbumImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if Int(indexPath.row) % 2 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "leftAlbumCollectionViewCell", for: indexPath) as! LeftAlbumCollectionViewCell
            cell.albumImageView.image = UIImage(named: currentDay().currentAlbumImages[indexPath.row].image)
            cell.albumTitleLabel.text = currentDay().currentAlbumImages[indexPath.row].title
            if currentDay().currentAlbumImages[indexPath.row].isLocked {
                cell.lockedView.isHidden = false
            } else {
                cell.lockedView.isHidden = true
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rightAlbumCollectionViewCell", for: indexPath) as! RightAlbumCollectionViewCell
            cell.albumImageView.image = UIImage(named: currentDay().currentAlbumImages[indexPath.row].image)
            cell.albumTitleLabel.text = currentDay().currentAlbumImages[indexPath.row].title
            if currentDay().currentAlbumImages[indexPath.row].isLocked {
                cell.lockedView.isHidden = false
            } else {
                cell.lockedView.isHidden = true
            }
            return cell
        }
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
        currentNotePageInt = 0
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
        currentNotePageInt = 0
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
        currentNotePageInt = 0
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

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        currentNotePageInt = 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

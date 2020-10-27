//
//  GameOverViewController.swift
//  FUNHIPROTOTYPE
//
//  Created by 최서연 on 2020/10/23.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var restartFromChapter: UIButton!
    @IBOutlet weak var restartFromBack: UIButton!
    @IBOutlet weak var faidBlackVIew: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonDesign()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.faidBlackVIew.isHidden = true
    }
    func buttonDesign() {
        restartFromChapter.layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
        restartFromChapter.layer.shadowRadius = 6
        restartFromChapter.layer.shadowOpacity = 0.4
        restartFromChapter.layer.shadowOffset = CGSize(width: 0, height: 0)
        
       
        restartFromChapter.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 255/255, green: 255/255, blue: 255/255, alpha: 1.0))
        restartFromChapter.setTitle("에피소드부터 다시 시작하기", for: .normal)
        
        restartFromChapter.setTitleColor(UIColor.black, for: .normal)
        
        restartFromChapter.layer.cornerRadius = 7.0
        restartFromChapter.layer.borderWidth = 1.0
        restartFromChapter.layer.borderColor = CGColor(srgbRed: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
        
        
        restartFromBack.layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
        restartFromBack.layer.shadowRadius = 6
        restartFromBack.layer.shadowOpacity = 0.4
        restartFromBack.layer.shadowOffset = CGSize(width: 0, height: 0)
        
       
        restartFromBack.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 255/255, green: 255/255, blue: 255/255, alpha: 1.0))
        restartFromBack.setTitle("에피소드부터 다시 시작하기", for: .normal)
        
        restartFromBack.setTitleColor(UIColor.black, for: .normal)
        
        restartFromBack.layer.cornerRadius = 7.0
        restartFromBack.layer.borderWidth = 1.0
        restartFromBack.layer.borderColor = CGColor(srgbRed: 112/255, green: 112/255, blue: 112/255, alpha: 1.0)
    }

   
    @IBAction func restartFromChapterAction(_ sender: Any) {
        self.faidBlackVIew.isHidden = false
        self.faidBlackVIew.alpha = 0
        endingIS = "restartFromChapter"
        // 메인 뷰
    
    
    // 첫 애니메이션
    UIView.animate(withDuration: 2.0) {
        self.faidBlackVIew.alpha = 1
   
    // 두번째 애니메이션
    } completion: { (i) in
        self.navigationController?.popViewController(animated: false)
    }
        
        
        
    }
    
    @IBAction func restartFromBackAction(_ sender: Any) {
        self.faidBlackVIew.isHidden = false
        self.faidBlackVIew.alpha = 0
        endingIS = "restartFromBack"
        self.navigationController?.popViewController(animated: false)
    }
    
}

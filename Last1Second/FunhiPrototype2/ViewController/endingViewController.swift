//
//  endingViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/27.
//

import UIKit

class endingViewController: UIViewController {

    // MARK: 게임오버 뷰 OUTLET
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var gameOverImageView: UIImageView!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var scriptLabel: UILabel!
    @IBOutlet var sandglassImageView: UIImageView!
    
    @IBOutlet var firstButtonImageView: UIImageView!
    @IBOutlet var secondButtonImageView: UIImageView!
    @IBOutlet var thirdButtonImageView: UIImageView!
    
//MARK: 팝업 뷰 OUTLET
    
    @IBOutlet var popupView: UIView!
    @IBOutlet var popupBox: UIView!
    @IBOutlet var popupLabel: UILabel!
    @IBOutlet var popupButton1: UIButton!
    @IBOutlet var popupButton2: UIButton!
    @IBOutlet var popupButton1Shadow: UIView!
    @IBOutlet var popupButton2Shadow: UIView!
    
    
    
    
    
//MARK: 코드
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func restartButton(_ sender: Any) {
        //업적 초기화
        player.currentChatId = "001"
        dismiss(animated: true, completion: nil)
    }
}

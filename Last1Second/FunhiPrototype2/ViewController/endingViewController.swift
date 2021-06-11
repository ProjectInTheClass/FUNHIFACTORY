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
    
    @IBOutlet var insideButtonViews: [UIView]!
    @IBOutlet var floatingButtons: [UIButton]!
    
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
        endingDesign()
    }
    
    func endingDesign()
    {
        let ending = checkEnding(id: player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex)
        
        backgroundImageView.image = UIImage(named: "\(player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex)Background")
        gameOverImageView.image = UIImage(named: "\(player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex)GameOver")
        sandglassImageView.image = UIImage(named: "\(player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex)Sandglass")
        firstButtonImageView.image = UIImage(named: "\(player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex)1stButton")
        secondButtonImageView.image = UIImage(named: "\(player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex)2ndButton")
        thirdButtonImageView.image = UIImage(named: "\(player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex)3rdButton")
        yearLabel.text = "\(player.currentEpisodes[strToIndex(str: player.dayId)].episodeYear)년"
        descriptionLabel.text = ending.name
        scriptLabel.text = ending.comment
        for target in insideButtonViews {
            target.backgroundColor = ending.buttonUIColor[1]
        }
        for target in floatingButtons {
            target.backgroundColor = ending.buttonUIColor[3]
        }
    }
    
    @IBAction func restartButton(_ sender: Any) {
        //업적 초기화
        player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex = "001"
        dismiss(animated: true, completion: nil)
    }
}

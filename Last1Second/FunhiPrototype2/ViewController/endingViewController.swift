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
    @IBOutlet var popupButtonShadows: [UIView]!
    @IBOutlet var popupButtons: [UIButton]!
//MARK: 코드

    var buttonInput = 0
    
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
        popupBox.frame = popupBox.frame.insetBy(dx: -6, dy: -6)
        popupBox.layer.borderWidth = 6
        popupBox.layer.borderColor = ending.buttonUIColor[0].cgColor
        for target in popupButtons {
            target.backgroundColor = ending.buttonUIColor[3]
        }
        for target in popupButtonShadows {
            target.backgroundColor = ending.buttonUIColor[1]
        }
    }
    
    @IBAction func restartEpisode(_ sender: Any) {
        buttonInput = 0
        self.view!.addSubview(popupView)
        popupView.fullScreen(to: self.view!)
    }
    @IBAction func restartPrologue(_ sender: Any) {
        buttonInput = 1
        self.view!.addSubview(popupView)
        popupView.fullScreen(to: self.view!)
    }
    @IBAction func goToTimeLine(_ sender: Any) {
        buttonInput = 2
        self.view!.addSubview(popupView)
        popupView.fullScreen(to: self.view!)
    }
    
}

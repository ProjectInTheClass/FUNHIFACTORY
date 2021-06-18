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
        let ending = checkEnding(id: currentEpisode().currentStoryBlockIndex)
        
        backgroundImageView.image = UIImage(named: "\(currentEpisode().currentStoryBlockIndex)Background")
        gameOverImageView.image = UIImage(named: "\(currentEpisode().currentStoryBlockIndex)GameOver")
        sandglassImageView.image = UIImage(named: "\(currentEpisode().currentStoryBlockIndex)Sandglass")
        firstButtonImageView.image = UIImage(named: "\(currentEpisode().currentStoryBlockIndex)1stButton")
        secondButtonImageView.image = UIImage(named: "\(currentEpisode().currentStoryBlockIndex)2ndButton")
        thirdButtonImageView.image = UIImage(named: "\(currentEpisode().currentStoryBlockIndex)3rdButton")
        yearLabel.text = "\(currentEpisode().episodeYear)년"
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
        popupLabel.text = "현재 \(currentEpisode().episodeYear)년 에피소드를\n처음부터 진행합니다."
    }
    @IBAction func restartPrologue(_ sender: Any) {
        buttonInput = 1
        self.view!.addSubview(popupView)
        popupView.fullScreen(to: self.view!)
        popupLabel.text = "프롤로그부터 다시 재시작하여\n이전 사건 기록이 사라집니다."
    }
    @IBAction func goToTimeLine(_ sender: Any) {
        buttonInput = 2
        self.view!.addSubview(popupView)
        popupView.fullScreen(to: self.view!)
        popupLabel.text = "지금까지 진행한\n사건 타임라인을 보러 갑니다."
    }
    @IBAction func popupContinue(_ sender: Any) {
        switch buttonInput {
        case 0:
            player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex = "001"
            performSegue(withIdentifier: "unwindToMain", sender: nil)
        case 1:
            player.dayId = "prologue"
            initializePlayer(paraPlayer: &player)
            performSegue(withIdentifier: "unwindToMain", sender: nil)
        case 2:
            popupView.removeFromSuperview()
            performSegue(withIdentifier: "endingToTimeline", sender: nil)
        default:
            return
        }
    }
    @IBAction func popupCancel(_ sender: Any) {
        popupView.removeFromSuperview()
    }
}

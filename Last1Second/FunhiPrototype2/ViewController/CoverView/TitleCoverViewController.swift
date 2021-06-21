//
//  TitleCoverViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/30.
//

import UIKit
import AVFoundation
class TitleCoverViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        testLabel.setCharacterSpacing(characterSpacing: 5)
        alertPopupLabel.text = "게임 데이터를 불러오지 못했습니다.\n네트워크 상태를 확인해주세요."
        
        checkForSuccessfulDownloadOfJson()
    
    }
    
    func checkForSuccessfulDownloadOfJson() {
        
        let successDownload = !player.currentEpisodes[0].storyBlocks.isEmpty && !player.currentEpisodes[2].storyBlocks.isEmpty
        
        if successDownload {
            print("**0, 2챕터 들어옴**")
            light()
            startButton.isHidden = false
        } else {
            print("**0, 2챕터 들어오지 않음, 재시도 필요**")
            startButton.isHidden = true
            openAlertPopupView()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        audioConfigure(bgmName: "coverBGM", isBGM: true, ofType: "mp3")
        print("현재 currentChatArray: \(player.currentChatArray)")
        print("현재 dayId: \(player.dayId)")
        print("현재 currentChatId: \(player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex)")
        print("현재 dayIndex: \(player.dayIndex)")
        
    }
    
    @IBOutlet var alertPopupView: UIView!
    @IBOutlet var elertPopupBoxView: UIView!
    @IBOutlet var alertPopupLabel: UILabel!
    
    
    @IBAction func startAction(_ sender: Any) {
        
        testLabel.layer.removeAllAnimations()
        
        let didntStartEpisode = player.currentChatArray.isEmpty
        let didntStartPrologue = !player.currentEpisodes[0].isStarted
        
        if didntStartEpisode && didntStartPrologue {
                player.dayId = player.currentEpisodes[0].episodeID
                player.indexNumber = 0
                //player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex = "014"
                performSegue(withIdentifier: "fromCoverToChapterCover", sender: nil)
        }
        
        if didntStartEpisode && !didntStartPrologue {
            performSegue(withIdentifier: "goToSelectSelectSegue", sender: nil)
        }
    
        if !didntStartEpisode {
            performSegue(withIdentifier: "fromCoverToHomeSegue", sender: nil)
        }
    }
    
    func openAlertPopupView() {
        alertPopupView.center = self.view.center
        alertPopupView.bounds = self.view.bounds
        self.view.addSubview(alertPopupView)
    }
    @IBAction func exitPopupView(_ sender: Any) {
        
        downloadData(targetURL: "https://raw.githubusercontent.com/ProjectInTheClass/FUNHIFACTORYGameData/master/prologue_story.json", targetEpisodeIndex: 0)
        downloadData(targetURL: "https://raw.githubusercontent.com/ProjectInTheClass/FUNHIFACTORYGameData/master/case2_story.json", targetEpisodeIndex: 2)
        alertPopupView.removeFromSuperview()
        checkForSuccessfulDownloadOfJson()
    }
    
    func designButton() {
        startButton.layer.cornerRadius = 3
        startButton.layer.borderWidth = 1.5
        startButton.layer.borderColor = UIColor(red: 0.106, green: 0.157, blue: 0.22, alpha: 1).cgColor
        let shadowPath0 = UIBezierPath(roundedRect: startButton.bounds, cornerRadius: 8)
        startButton.layer.shadowPath = shadowPath0.cgPath
        startButton.layer.shadowColor = UIColor(red: 0.106, green: 0.157, blue: 0.22, alpha: 1).cgColor
        startButton.layer.shadowOpacity = 1
        startButton.layer.shadowRadius = 0
        startButton.layer.shadowOffset = CGSize(width: 7, height: 7)
        testLabel.setShadow(color: UIColor(red: 0, green: 0, blue: 0, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 5)
    }

    
    func light() {
        UILabel.animate(withDuration: 0.7, delay: 0.5, options: [.repeat, .autoreverse], animations: {[self]  in
                testLabel.alpha = 0.1

            }, completion: nil)
    }
    @IBAction func unwindToCover(_ unwindSegue: UIStoryboardSegue) {
        _ = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
}

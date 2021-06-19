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
//        for family: String in UIFont.familyNames
//             {
//                 print(family)
//                 for names: String in UIFont.fontNames(forFamilyName: family)
//                 {
//                     print("== \(names)")
//                 }
//             }
        testLabel.setCharacterSpacing(characterSpacing: 5)
        light()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        audioConfigure(bgmName: "coverBGM", isBGM: true, ofType: "mp3")
        print("현재 currentChatArray: \(player.currentChatArray)")
        print("현재 dayId: \(player.dayId)")
        print("현재 currentChatId: \(player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex)")
        print("현재 dayIndex: \(player.dayIndex)")
        
    }
    @IBAction func startAction(_ sender: Any) {
        
        testLabel.layer.removeAllAnimations()
        
        let didntStartEpisode = player.currentChatArray.isEmpty
        let didntStartPrologue = !player.currentEpisodes[0].isStarted
        
        if didntStartEpisode && didntStartPrologue {
                player.dayId = player.currentEpisodes[0].episodeID
                player.indexNumber = 0
                player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex = "014"
                performSegue(withIdentifier: "fromCoverToChapterCover", sender: nil)
        }
        
        if didntStartEpisode && !didntStartPrologue {
            performSegue(withIdentifier: "goToSelectSelectSegue", sender: nil)
        }
    
        if !didntStartEpisode {
            performSegue(withIdentifier: "fromCoverToHomeSegue", sender: nil)
        }
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

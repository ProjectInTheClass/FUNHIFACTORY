//
//  MainViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/27.
//

import UIKit
import AVFoundation
class MainViewController: UIViewController {

    
    @IBOutlet weak var chapterTitleLabel: UILabel!
    @IBOutlet weak var chapterDetailTextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        chapterTitleLabel.text = "\(currentDay().chapter.chapterNumber)일: \(currentDay().chapter.chapterName)"
        chapterDetailTextLabel.text = currentDay().chapter.chapterInfo
    }

    override func viewDidAppear(_ animated: Bool) {
        audioConfigure()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       
    }
    @IBAction func goToGameView(_ sender: UIButton) {
        audioPlayer?.pause()
        player.dayId = "day0"
        player.currentChatId = "001"
        player.dayIndex = 0
        
        let mainGameStoryBoard = UIStoryboard(name: "MainGame", bundle: nil)
        let second = mainGameStoryBoard.instantiateViewController(withIdentifier: "mainGame")
        second.modalPresentationStyle = .fullScreen
        present(second, animated: true, completion: nil)
        //performSegue(withIdentifier: "goToGameViewSegue", sender: nil)
        
    }
    
    @IBAction func goToHistoryView(_ sender: Any) {
        let dataToSend: [History]
        dataToSend = player.currentHistories
        performSegue(withIdentifier: "goToHistoryViewSegue", sender: dataToSend)
    }
    @IBAction func goToAchievementView(_ sender: Any) {
        let dataToSendA: [Achievement]
        dataToSendA = player.currentAchievements
        performSegue(withIdentifier: "goToHistoryViewSegue", sender: dataToSendA)
    }
    
    @IBAction func goToTimelineView(_ sender: Any) {
        performSegue(withIdentifier: "goToTimelineViewSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "goToHistoryViewSegue" {
            let destination = segue.destination as! MainHistoryAchieveViewController
            if let history = sender as? [History] {
                destination.receivedHistory = history
                destination.isHistory = true
            }
            if let achievement = sender as? [Achievement] {
                destination.receivedAchievement = achievement
                destination.isHistory = false
            }
       }
    }
   
    func audioConfigure() {
        let bgmName = "song3"

        let urlString = Bundle.main.path(forResource: bgmName, ofType: "mp3")

        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            guard let urlString = urlString else {
                print("urlstring is nil")
                return
            }

            audioPlayer = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

            guard let audioPlayer = audioPlayer else {
                print("player is nil")
                return
            }
            audioPlayer.volume = player.setting.bgmVolume
            audioPlayer.play()
        }
        catch {
            print("error occurred")
        }
    }

}


//
//  MainViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/27.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var chapterTitleLabel: UILabel!
    @IBOutlet weak var chapterDetailTextLabel: UILabel!
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func goToGameView(_ sender: UIButton) {
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
    /*@IBAction func goToSettingView(_ sender: Any) {
        performSegue(withIdentifier: "goToSettingViewSegue", sender: nil)
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}


//
//  MainViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/27.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    let mainGameStoryBoard = UIStoryboard(name: "MainGame", bundle: nil)

    
    @IBAction func goToGameView(_ sender: UIButton) {
        performSegue(withIdentifier: "goToGameViewSegue", sender: nil)
        
    }
    
    @IBAction func goToHistoryAchievementView(_ sender: Any) {
        performSegue(withIdentifier: "goToHistoryAchievementViewSegue", sender: nil)
    }
    
    @IBAction func goToTimelineView(_ sender: Any) {
        performSegue(withIdentifier: "goToTimelineViewSegue", sender: nil)
    }
    
    @IBAction func goToSettingView(_ sender: Any) {
        performSegue(withIdentifier: "goToSettingViewSegue", sender: nil)
        
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

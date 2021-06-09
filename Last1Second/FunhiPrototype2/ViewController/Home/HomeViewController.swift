//
//  HomeViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/06/07.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var episodeYearLabel: UILabel!
    @IBOutlet var episodeNameLabel: UILabel!
    @IBOutlet var episodeDescriptionLabel: UILabel!
    
    @IBOutlet var startGameButtonView: UIView!
    @IBOutlet var selectNewEPButtonView: UIView!
    
    @IBOutlet var buttonViews: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        player.dayId = prologueChapter.episodeID
        episodeYearLabel.text = "\(currentDay().episodeYear)년"
        episodeNameLabel.text = currentDay().episodePlace
        episodeDescriptionLabel.text = currentDay().episodeDesciption
        episodeDescriptionLabel.setLineSpacing(lineSpacing: 16)
        episodeDescriptionLabel.textAlignment = .center
        
        
        
        startGameButtonView.layer.cornerRadius = startGameButtonView.frame.height/2
        selectNewEPButtonView.layer.cornerRadius = selectNewEPButtonView.frame.height/2
        startGameButtonView.setShadow(color: UIColor(red: 0.784, green: 0.871, blue: 0.941, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 10)
        selectNewEPButtonView.setShadow(color: UIColor(red: 0.592, green: 0.706, blue: 0.82, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 10)
        
        for view in buttonViews {
            view.layer.borderWidth = 3
            view.layer.borderColor = UIColor(red: 0.524, green: 0.646, blue: 0.75, alpha: 1).cgColor
            view.layer.backgroundColor = UIColor.white.cgColor
        }
        
        
        
        
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
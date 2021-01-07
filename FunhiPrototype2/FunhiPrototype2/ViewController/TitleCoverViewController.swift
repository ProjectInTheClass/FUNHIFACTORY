//
//  TitleCoverViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/30.
//

import UIKit

class TitleCoverViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        designButton()
        // Do any additional setup after loading the view.
        guard let ex = readLocalFile(forName: "storyInstance") else {return}
        parse(jsonData: ex)
        
       
        
    }
    @IBAction func startAction(_ sender: Any) {
        //에피 끝난 상태면
        if currentChatArray.count == 0 {
            performSegue(withIdentifier: "goToSelectSelectSegue", sender: nil)
        //에피 진행중이면
        } else {
            performSegue(withIdentifier: "fromCoverToMaingameSegue", sender: nil)
            
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

 

}

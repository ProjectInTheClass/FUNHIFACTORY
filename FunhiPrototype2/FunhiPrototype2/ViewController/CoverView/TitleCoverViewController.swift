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
      light()
        // Do any additional setup after loading the view.
        /*
         guard let ex = readLocalFile(forName: "storyInstance") else {return}
         parse(jsonData: ex)
         */
        
         loadJson(fromURLString: urlString) { (result) in
              switch result {
              case .success(let data):
                  parse(jsonData: data)
                print("********json 불러오기 성공*********")
              case .failure(let error):
                  print(error)
              }
          }
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        audioConfigure(bgmName: "coverBGM", isBGM: true, ofType: "mp3")
    }
    @IBAction func startAction(_ sender: Any) {
        
        testLabel.layer.removeAllAnimations()
        if player.currentChatArray.count == 0 {
            //게임 처음 시작하는 거면
            if !player.currentEpisodes[0].isCleared {
            player.dayId = player.currentEpisodes[0].episodeID
            indexNumber = 0
                player.currentChatId = "001"
            performSegue(withIdentifier: "fromCoverToChapterCover", sender: nil)
            //새 에피 선택해야 하면
            } else {
            performSegue(withIdentifier: "goToSelectSelectSegue", sender: nil)
            }
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

    func light() {
        UILabel.animate(withDuration: 0.7, delay: 0.5, options: [.repeat, .autoreverse], animations: {[self]  in
                testLabel.alpha = 0.1

            }, completion: nil)
       
        
        
    }
 

}

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
        designButton()
       
        alertPopupLabel.text = "게임 데이터를 다운로드합니다.\n 아래 버튼을 눌러주세요!\n\n네트워크 연결이 필요합니다."
        alertPopupLabel.setLineSpacing(lineSpacing: 6)
        alertPopupLabel.textAlignment = .center
      
    
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
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tapLabel.removeFromSuperview()
        self.view.layoutIfNeeded()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let number = Int.random(in: 0..<1)
        if number == 1{
            playBgm(put: "cover1")
        }
        else{
            playBgm(put: "cover2")
        }
        print("현재 currentChatArray: \(player.currentChatArray)")
        print("현재 dayId: \(player.dayId)")
        print("현재 currentChatId: \(player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex)")
        print("현재 dayIndex: \(player.dayIndex)")
        checkForSuccessfulDownloadOfJson()
       
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       
    }
    @IBOutlet var alertPopupView: UIView!
    @IBOutlet var elertPopupBoxView: UIView!
    @IBOutlet var alertPopupLabel: UILabel!
    
    
    @IBAction func startAction(_ sender: Any) {
        
      
        
        let startedCurrentEpisode = player.currentEpisodes[strToIndex(str: player.dayId)].isStarted
        let isPrologue = strToIndex(str: player.dayId) == 0
        let cleardCurrentEpisode = player.currentEpisodes[strToIndex(str: player.dayId)].isCleared
        
        if !startedCurrentEpisode && isPrologue {
                player.dayId = player.currentEpisodes[0].episodeID
                player.indexNumber = 0
                //player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex = "014"
                performSegue(withIdentifier: "fromCoverToChapterCover", sender: nil)
        }
        
        if cleardCurrentEpisode || (!cleardCurrentEpisode && !startedCurrentEpisode && !isPrologue) {
            performSegue(withIdentifier: "goToSelectSelectSegue", sender: nil)
        }
    
        if !cleardCurrentEpisode && startedCurrentEpisode {
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
    
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    func designButton() {
        elertPopupBoxView.setBolder(color: UIColor(red: 0.647, green: 0.737, blue: 0.812, alpha: 1), width: 6)
        
       
    }
    
    
    var tapLabel = UILabel()
    
    func light() {
        
        tapLabel = UILabel()
        tapLabel.text = "탭하여 시작하기"
        tapLabel.font = UIFont(name: "NanumSquareR", size: 15)
        tapLabel.setCharacterSpacing(characterSpacing: 5)
        tapLabel.setShadow(color: UIColor(red: 0, green: 0, blue: 0, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 5)
        
        tapLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tapLabel)
        tapLabel.textAlignment = .center
        tapLabel.textColor = .white
        tapLabel.lineBreakMode = .byWordWrapping
        tapLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tapLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -64).isActive = true
        
        UILabel.animate(withDuration: 0.7, delay: 0.5, options: [.repeat, .autoreverse], animations: {[self]  in
                tapLabel.alpha = 0.1

            }, completion: nil)
    }
    @IBAction func unwindToCover(_ unwindSegue: UIStoryboardSegue) {
        _ = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
}

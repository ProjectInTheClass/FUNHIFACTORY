//
//  TitleCoverViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/30.
//

import UIKit
import AVFoundation
import Gifu

class TitleCoverViewController: UIViewController {
  
  @IBOutlet weak var startButton: SoundButton!
  @IBOutlet weak var alertPopupView: UIView!
  @IBOutlet weak var elertPopupBoxView: UIView!
  @IBOutlet weak var alertPopupLabel: UILabel!
  @IBOutlet weak var coverImageView: GIFImageView!
  
  var downloadAccept = false
  var tapLabel = UILabel()
  var audioLabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupStyle()
    player.currentEpisodes.forEach {
      print("*\($0.episodeYear ) 데이터")
      print("- ", $0.isStarted)
      print("- ", $0.isCleared)
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    tapLabel.removeFromSuperview()
    self.view.layoutIfNeeded()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupCoverGif()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    playRandomBgm()
    printLog()
    checkForSuccessfulDownloadOfJson()
    //    testData()
  }
  
  @IBAction func startAction(_ sender: Any) {
    let successDownload = !player.currentEpisodes[0].storyBlocks.isEmpty && !player.currentEpisodes[2].storyBlocks.isEmpty
    
    if successDownload {
      let episode = player.currentEpisodes[strToIndex(str: player.dayId)]
      let isStarted = episode.isStarted
      let isCleared = episode.isCleared
      let isPrologue = strToIndex(str: player.dayId) == 0
      
      if !isStarted && isPrologue {
        player.dayId = player.currentEpisodes[0].episodeID
        player.indexNumber = 0
        performSegue(withIdentifier: "fromCoverToChapterCover", sender: nil)
      }
      if isCleared || (!isCleared && !isStarted && !isPrologue) {
        performSegue(withIdentifier: "goToSelectSelectSegue", sender: nil)
      }
      if !isCleared && isStarted {
        performSegue(withIdentifier: "fromCoverToHomeSegue", sender: nil)
      }
    } else { openAlert() }
  }
  
  @IBAction func exitPopupView(_ sender: Any) {
    downloadData(targetURL: "https://raw.githubusercontent.com/ProjectInTheClass/FUNHIFACTORYGameData/master/prologue_story.json", targetEpisodeIndex: 0)
    downloadData(targetURL: "https://raw.githubusercontent.com/ProjectInTheClass/FUNHIFACTORYGameData/master/case2_story.json", targetEpisodeIndex: 2)
    alertPopupView.removeFromSuperview()
    checkForSuccessfulDownloadOfJson()
  }
  
  @IBAction func cancelDownload(_ sender: Any) {
    alertPopupView.removeFromSuperview()
  }
  
  @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
    _ = unwindSegue.source
  }
  
  func openAlert() {
    view.addSubview(alertPopupView)
    alertPopupView.pinToEdges(inView: view)
  }
  
  private func checkForSuccessfulDownloadOfJson() {
    let successDownload = !player.currentEpisodes[0].storyBlocks.isEmpty && !player.currentEpisodes[2].storyBlocks.isEmpty
    if successDownload {
      print("**0, 2챕터 들어옴**")
      setupAudioLabel()
      animateLight()
    } else {
      print("**0, 2챕터 들어오지 않음, 재시도 필요**")
      openAlert()
    }
  }
  
  private func playRandomBgm() {
    let number = Int.random(in: 0..<1)
    if number == 1 {
      playBgm(put: "cover1")
    } else {
      playBgm(put: "cover2")
    }
  }
  
  private func setupStyle() {
    elertPopupBoxView.setBolder(color: UIColor(red: 0.647, green: 0.737, blue: 0.812, alpha: 1), width: 6)
    alertPopupLabel.text = "게임 데이터를 다운로드합니다.\n 아래 버튼을 눌러주세요!\n\n네트워크 연결이 필요합니다. \n2.7 MB"
    alertPopupLabel.setLineSpacing(6)
    alertPopupLabel.textAlignment = .center
  }
  
  private func printLog() {
    print("현재 currentChatArray: \(player.currentChatArray)")
    print("현재 dayId: \(player.dayId)")
    print("현재 currentChatId: \(player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex)")
    print("현재 dayIndex: \(player.dayIndex)")
  }
  
  private func setupAudioLabel() {
    audioLabel = AudioLabel()
    self.view.addSubview(audioLabel)
    audioLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    audioLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -108).isActive = true
  }
  
  private func animateLight() {
    tapLabel = TapAndStartLabel()
    self.view.addSubview(tapLabel)
    tapLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    tapLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -64).isActive = true
    UILabel.animate(withDuration: 0.7, delay: 0.5, options: [.repeat, .autoreverse], animations: { [weak self] in
      self?.tapLabel.alpha = 0.1
    }, completion: nil)
  }
  
  private func setupCoverGif() {
    self.coverImageView.animate(withGIFNamed: "twenty")
  }
  
  private func disappearCoverGif() {
    self.coverImageView.animate(withGIFNamed: "")
  }
}

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
  @IBOutlet weak var splashScreen: UIView!
  @IBOutlet var releaseAlert: UIView!
  @IBOutlet weak var releaseAlertDesc: UILabel!
  
  
  lazy var splashLogo: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(named: "splash_logo")
    image.contentMode = .scaleAspectFit
    NSLayoutConstraint.activate([
      image.widthAnchor.constraint(equalToConstant: 134),
      image.heightAnchor.constraint(equalToConstant: 158)
    ])
    return image
  }()
  
  lazy var splashSoundCharacter: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(named: "splash_soundCharacter")
    image.contentMode = .scaleAspectFill
    NSLayoutConstraint.activate([
      image.widthAnchor.constraint(equalTo: image.heightAnchor, multiplier: 414/538)
    ])
    return image
  }()
  
  lazy var splashSoundDesc: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(named: "splash_soundLabel")
    image.contentMode = .scaleAspectFit
    NSLayoutConstraint.activate([
      image.widthAnchor.constraint(equalToConstant: 242),
      image.heightAnchor.constraint(equalToConstant: 55)
    ])
    return image
  }()
  
  lazy var splashPictionDesc: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(named: "splash_pictionLabel")
    image.contentMode = .scaleAspectFit
    NSLayoutConstraint.activate([
      image.widthAnchor.constraint(equalTo: image.heightAnchor, multiplier: 380/52)
    ])
    return image
  }()
  
  var downloadAccept = false
  var tapLabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupStyle()
    player.currentEpisodes.forEach {
      print("*\($0.episodeYear ) 데이터")
      print("- ", $0.isStarted)
      print("- ", $0.isCleared)
    }
    playSplashScreen() {
      self.checkForSuccessfulDownloadOfJson()
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupCoverGif()
    if player.userStore.isGameRestarted {
      player.userStore.isGameRestarted = false
      checkForSuccessfulDownloadOfJson()
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    playRandomBgm()
    printLog()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    tapLabel.removeFromSuperview()
    self.view.layoutIfNeeded()
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
      animateLight()
      if !player.userStore.isTitleCoverViewReleaseAlertOpened {
        self.openReleaseAlert()
      }
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
    releaseAlertDesc.setLineSpacing(6)
  }
  
  private func printLog() {
    print("현재 currentChatArray: \(player.currentChatArray)")
    print("현재 dayId: \(player.dayId)")
    print("현재 currentChatId: \(player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex)")
    print("현재 dayIndex: \(player.dayIndex)")
  }
  
  @IBAction func closeReleaseAlert(_ sender: Any) {
    closeReleaseAlert()
  }
  
  private func animateLight() {
    tapLabel = TapAndStartLabel()
    self.coverImageView.addSubview(tapLabel)
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
  
  private func playSplashScreen( completion: @escaping () -> Void) {
    splashScreen.addSubview(splashLogo)
    splashScreen.addSubview(splashPictionDesc)
    splashScreen.addSubview(splashSoundDesc)
    splashScreen.addSubview(splashSoundCharacter)
    
    NSLayoutConstraint.activate([
      splashLogo.centerXAnchor.constraint(equalTo: splashScreen.centerXAnchor),
      splashLogo.centerYAnchor.constraint(equalTo: splashScreen.centerYAnchor),
      
      splashPictionDesc.centerXAnchor.constraint(equalTo: splashScreen.centerXAnchor),
      splashPictionDesc.centerYAnchor.constraint(equalTo: splashScreen.centerYAnchor),
      
      splashSoundCharacter.leadingAnchor.constraint(equalTo: splashScreen.leadingAnchor),
      splashSoundCharacter.trailingAnchor.constraint(equalTo: splashScreen.trailingAnchor),
      splashSoundCharacter.bottomAnchor.constraint(equalTo: splashScreen.bottomAnchor),
      
      splashSoundDesc.centerXAnchor.constraint(equalTo: splashScreen.centerXAnchor),
      splashSoundDesc.bottomAnchor.constraint(equalTo: splashSoundCharacter.topAnchor, constant: -59)
    ])
    
    splashLogo.alpha = 1
    splashSoundCharacter.alpha = 0
    splashSoundDesc.alpha = 0
    splashPictionDesc.alpha = 0
    
    UIView.animate(withDuration: 1.5, delay: 3) {
      self.splashLogo.alpha = 0
    } completion: { _ in
      
      UIView.animate(withDuration: 1.5, delay: 0) {
        self.splashPictionDesc.alpha = 1
      } completion: { _ in
        
        UIView.animate(withDuration: 1.5, delay: 3) {
          self.splashPictionDesc.alpha = 0
        } completion: { _ in
          
          UIView.animate(withDuration: 1.5, delay: 00) {
            self.splashSoundCharacter.alpha = 1
            self.splashSoundDesc.alpha = 1
          } completion: { _ in
            
            UIView.animate(withDuration: 1.5, delay: 3) {
              self.splashSoundCharacter.alpha = 0
              self.splashSoundDesc.alpha = 0
            } completion: { _ in
              UIView.animate(withDuration: 3.0) {
                
              } completion: { _ in
                self.splashScreen.removeFromSuperview()
                completion()
              }
            }
          }
        }
      }
    }
  }
  
  func openReleaseAlert() {
    self.view.addSubview(releaseAlert)
    releaseAlert.pinToEdges(inView: view)
    releaseAlertDesc.text = "안녕하세요! [마지막 1초] 개발팀입니다.\n저희 게임을 즐겨주셔서 정말 감사합니다. 그리고 스토리 업데이트가 늦어지는 점 진심으로 죄송합니다.\n\n[마지막 1초]는 예산 등의 문제로 이후 제작이 중단되었으나, 다행스럽게도 최근에 다시 제작할 수 있는 기회를 얻었습니다. 저희 개발팀은 18-19세 청소년 시기부터 시작하여 20-21세의 사회 초년생이 되었습니다. 현재 각자의 필드에서 활동하고 있어 내년 초까지 스토리 업데이트하는 것을 목표로 두고 작업하고 있습니다.\n\n다른 스토리를 플레이하고 싶어도 하실 수 없는 상황, 저희도 충분히 인지하고 있으며 조금만 기다려주시면 저희가 최대한 빠른 시일 내에 다시 찾아뵐 수 있도록 노력하겠습니다.감사합니다."
  }
  
  private func closeReleaseAlert() {
    player.userStore.isTitleCoverViewReleaseAlertOpened = true
    releaseAlert.removeFromSuperview()
  }
}

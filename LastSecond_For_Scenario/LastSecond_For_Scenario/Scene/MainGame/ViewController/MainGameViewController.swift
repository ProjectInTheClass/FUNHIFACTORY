//
//  mainGameViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import AudioToolbox
import AVFoundation
import UIKit

class MainGameViewController: UIViewController, UITableViewDelegate {
  // MARK: varible
  
  var alertTimer = Timer()
  var isShowBlackView: Bool = false
  var indexOfCellBeforeDragging = 0
  var animator: UIViewPropertyAnimator?
  
  var notePopupItemArray: [(a: String, b: String)] = [] {
    didSet {
      if notePopupItemArray.count >= 1, !isNotePopupAnimationRunning {
        animateNotePopup()
      }
    }
  }
  
  var episode: Episode!
  var chatList: [Chat] = []
  // TODO: 아래 정체 알아야 함...
  var indexNumber: Int = 0
  
  var currentBlock: BlockOfDayEpisode {
    return episode.storyBlocks[episode.currentStoryBlockIndex]!
  }
  
  
  convenience init(episode: Episode) {
    self.init()
    self.episode = episode
  }
  
  // MARK: @IBOutlet var
  
  @IBOutlet var choiceBarLine: UIView!
  @IBOutlet var normalChoiceCollectionViewLayout: UICollectionViewFlowLayout!
  @IBOutlet var currentYear: UILabel!
  @IBOutlet var wholeView: UIView!
  
  @IBOutlet var safeAreaBottom: UIView!
  @IBOutlet var safeAreaTop: UIView!
  @IBOutlet var choiceHeight: NSLayoutConstraint!
  @IBOutlet var mainGameTableView: UITableView!
  @IBOutlet var choiceBar: UIView!
  @IBOutlet var topBar: UIView!
  @IBOutlet var notePopupView: NotePopupView!
  @IBOutlet weak var notePopupViewTitle: UILabel!
  @IBOutlet weak var notePopupViewDescriptionLabel: UILabel!
  @IBOutlet var pauseBar: UIView!
  @IBOutlet var blackView: UIView!
  @IBOutlet var collectionBar: UIView!
  @IBOutlet var pageControl: UIPageControl!
  @IBOutlet var choiceCollectionView: UICollectionView!
  @IBOutlet var myChoiceText: UILabel!
  
  @IBOutlet weak var home: FloatingButton!
  @IBOutlet weak var note: FloatingButton!
  @IBOutlet weak var album: FloatingButton!
  @IBOutlet weak var setting: FloatingButton!
  @IBOutlet weak var menu: FloatingButton!
  @IBOutlet weak var map: FloatingButton!
  
  // MARK: View Lifecycle
  
  func stopTimerIfTutorialNotShowed() {
    if !player.userStore.isMainGameTutorialOpened {
      pauseTimer()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupCollectionView()
    setupButtons()
    setupNotepopup()
    
    if let page = episode.storyBlocks[episode.currentStoryBlockIndex]?.choices.count {
      initializePageControl(collectionView: choiceCollectionView, choiceBar: choiceBar, numberOfPages: page)
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    guard pauseBar.isHidden else { return }
    print("chatupdatetimer is executed")
    runTimer()
    closeChoiceBar()
    print("ischoice = \(isChoiceOn)")
    audioConfigure(bgmName: "mainGameBGM", isBGM: true, ofType: .mp3)
//    stopTimerIfTutorialNotShowed()
//    setupTutorial()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    pauseTimer()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    mapPresentFromLeft = true
    closeChoiceBar()
    updateButtons()
    if let isGodChat = episode.storyBlocks[episode.currentStoryBlockIndex]?.isGodChat {
      if isGodChat {
        myChoiceText.textColor = .black
        choiceBarLine.backgroundColor = UIColor(red: 0.243, green: 0.357, blue: 0.459, alpha: 1)
        mainGameTableView.backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1)
        view.backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1)
      }
      else {
        myChoiceText.textColor = .white
        view.backgroundColor = UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
        choiceBarLine.backgroundColor = UIColor(red: 0.484, green: 0.581, blue: 0.671, alpha: 1)
        mainGameTableView.backgroundColor = UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
      }
    }
    if isShowBlackView {
      fadeOut()
    }
    if !pauseBar.isHidden {
      safeAreaTop.isHidden = true
      pauseBar.isHidden = true
    }
    scrollToBottom()
    currentYear.text = episode.fileName ?? ""
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    pauseTimer()
    timer = nil
  }
  
  // MARK: @IBAction func
  
  @IBAction func goToHome(_ sender: Any) {
//    pushWithFadeIn(segue: "mainToHome")
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func goToNote(_ sender: Any) {
    pushWithAnimation(segue: "noteSegue")
  }
  
  @IBAction func goToAlbum(_ sender: Any) {
    pushWithAnimation(segue: "albumSegue")
  }
  
  @IBAction func goToTimeline(_ sender: Any) {
    pushWithAnimationFromLeft(segue: "timelineSegue")
  }
  
  @IBAction func goToSetting(_ sender: Any) {
    presentWithAnimation(vcIdentifier: "settings")
  }
  
  @IBAction func goToMap(_ sender: Any) {
    presentWithAnimation(vcIdentifier: "MapVC")
  }
  
  @IBAction func touchPageControl(_ sender: Any) {
    print(pageControl.currentPage)
    let rect = choiceCollectionView.layoutAttributesForItem(at: IndexPath(item: pageControl.currentPage, section: 0))?.frame
    choiceCollectionView.scrollRectToVisible(rect!, animated: true)
  }
  
  @IBAction func pauseTapped(_ sender: Any) {
    pauseBar.isHidden = false
    safeAreaTop.isHidden = false
    pauseTimer()
  }
  
  @IBAction func resumeTapped(_ sender: Any) {
    pauseBar.isHidden = true
    safeAreaTop.isHidden = true
    
    if !isChoiceOn {
      runTimer()
    }
  }
  
  // MARK: Function
  
  private func pushWithFadeIn(segue: String) {
    fadeIn(segue: "mainToHome")
  }
  
  private func presentWithAnimation(vcIdentifier: String) {
    guard let VC = storyboard?.instantiateViewController(identifier: vcIdentifier) else { return }
    VC.modalPresentationStyle = .fullScreen
    present(VC, animated: true, completion: nil)
  }
  
  private func vibrate(vibrateIsOn: Bool) {
    guard vibrateIsOn == true else { return }
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
  }
  
  private func setupTableView() {
    mainGameTableView.delegate = self
    mainGameTableView.dataSource = self
    mainGameTableView.reloadData()
    mainGameTableView.estimatedRowHeight = 2.0
    let tvcTouchGesture = UITapGestureRecognizer(target: self, action: #selector(instantChatUpdate(_:)))
    mainGameTableView.addGestureRecognizer(tvcTouchGesture)
    mainGameTableView.contentInset.bottom = 82
  }
  
  private func setupCollectionView() {
    choiceCollectionView.delegate = self
    choiceCollectionView.dataSource = self
    choiceCollectionView.isPagingEnabled = true
    choiceCollectionViewBorder(choiceView: collectionBar)
  }
  
  private func setupButtons() {
    home.setImages(nor: "HomeNormal", not: "HomeNormal")
    note.setImages(nor: "NoteNormal", not: "NoteHighlighted")
    album.setImages(nor: "AlbumNormal", not: "AlbumHighlighted")
    setting.setImages(nor: "SettingNormal", not: "SettingNormal")
    map.setImages(nor: "MapNormal", not: "MapNormal")
    menu.setImages(nor: "MenuNormal", not: "MenuHighlighted")
  }
  
  private func setupNotepopup() {
    view.addSubview(notePopupView)
    notePopupView.translatesAutoresizingMaskIntoConstraints = false
    notePopupView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    notePopupView.topAnchor.constraint(equalTo: view.topAnchor, constant: -70).isActive = true
  }
  
  func updateButtons() {
    readAllNotes ? (note.isNormal = true) : (note.isNormal = false)
    readAllAlbums ? (album.isNormal = true) : (album.isNormal = false)
    readAllNotification ? (menu.isNormal = true) : (menu.isNormal = false)
  }
  
  private func initializePageControl(collectionView: UICollectionView, choiceBar: UIView, numberOfPages: Int) {
    collectionView.contentInsetAdjustmentBehavior = .never
    collectionView.decelerationRate = .fast
    pageControl.hidesForSinglePage = true
    collectionView.showsHorizontalScrollIndicator = false
    pageControl.currentPageIndicatorTintColor = UIColor.white
  }
  
  private func fadeOut() {
    isShowBlackView = false
    blackView.bounds = view.bounds
    blackView.center = view.center
    view.addSubview(blackView)
    blackView.alpha = 1
    
    UIView.animate(withDuration: 1.0) {
      self.blackView.alpha = 0
    } completion: { Bool in
      self.blackView.removeFromSuperview()
    }
  }
  
  private func fadeIn(segue: String) {
    isShowBlackView = false
    blackView.bounds = view.bounds
    blackView.center = view.center
    view.addSubview(blackView)
    blackView.alpha = 0
    
    UIView.animate(withDuration: 1.0) {
      self.blackView.alpha = 1
    } completion: { Bool in
      self.blackView.removeFromSuperview()
      self.performSegue(withIdentifier: segue, sender: nil)
    }
  }
  
  // 가장 밑으로 스크롤해주는 함수
  func scrollToBottom() {
    guard chatList.count != 0 else { return }
    guard isChoiceOn == false else { return }
    guard pauseBar.isHidden == true else { return }
    let indexPath = IndexPath(row: chatList.count - 1, section: 0)
    mainGameTableView.scrollToRow(at: indexPath, at: .bottom, animated: false) // true로 바꾸면 좀 더 천천히 내려가긴 하는데, 못 따라오는 경우도 있다.
  }
  
  func just() {
    if mainGameTableView.contentSize.height > 608 {
      let expandedOffSetY = CGFloat(52)
      let collapsedBottomOffSet = CGFloat(608 + 18)
      let expandedBottomOffset = min(CGFloat(320), mainGameTableView.contentSize.height) + expandedOffSetY
      mainGameTableView.frame.origin.y = (collapsedBottomOffSet - expandedBottomOffset) + expandedOffSetY
    }
  }
  
  func choiceAnimUp() {
    UIView
      .animate(
        withDuration: 0.5, animations: { self.just() },
        completion: { _ in
          self.mainGameTableView.frame.origin.y = 105
          self.mainGameTableView.heightAnchor.constraint(equalToConstant: 608).isActive = true
          self.mainGameTableView.layoutIfNeeded()
        })
  }
  
  private func animateNotePopup() {
    isNotePopupAnimationRunning = true
    notePopupViewTitle.text = notePopupItemArray[0].a
    notePopupViewDescriptionLabel.text = notePopupItemArray[0].b
    UIView.animate(withDuration: 0.7, delay: 1, usingSpringWithDamping: 4, initialSpringVelocity: 5, options: .curveEaseInOut) {
      self.notePopupView.transform = CGAffineTransform(translationX: 0, y: 200)
    } completion: { Bool in
      UIView.animate(withDuration: 0.7, delay: 2, options: .allowAnimatedContent) {
        self.notePopupView.transform = CGAffineTransform.identity
      } completion: { Bool in
        self.notePopupItemArray.remove(at: 0)
        if self.notePopupItemArray.count != 0 {
          self.animateNotePopup()
        }
        else {
          isNotePopupAnimationRunning = false
        }
      }
    }
  }
  
  @objc func instantChatUpdate(_ gesture: UITapGestureRecognizer) {
    if !isChoiceOn {
      chatUpdate()
    }
  }
}

// MARK: AR, Prepare

extension MainGameViewController: ArDelegate {
  func goToAR(arid: ArId) {
    performSegue(withIdentifier: "goToARView", sender: arid)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "timelineSegue" {
      let destination = segue.destination as! TimeLineViewController
      destination.backButtonState = .arrow
    }
    
    if segue.identifier == "mainToHome" {
      let destination = segue.destination as! HomeViewController
      destination.isShowBlackView = true
    }
    
    if segue.identifier == "goToARView" {
      let destination = segue.destination as! MaingameARViewController
      if let arContent = sender as? ArId {
        destination.recievedAR = arContent
      }
    }
    
    if segue.identifier == "NoteUserVC" {
      let destintation = segue.destination as! NoteUserViewController
      if let targetCharacter = sender as? GameCharacter {
        destintation.recievedGameCharacter = targetCharacter
      }
    }
    
    if segue.identifier == "NoteHwiryeongVC" {
      let destintation = segue.destination as! NoteHeeryeongViewController
      if let targetCharacter = sender as? GameCharacter {
        destintation.recievedGameCharacter = targetCharacter
      }
    }
    
    if segue.identifier == "NoteGameCharacterVC" {
      let destintation = segue.destination as! NoteGameCharacterViewController
      if let targetCharacter = sender as? GameCharacter {
        destintation.recievedGameCharacter = targetCharacter
      }
    }
  }
}

// MARK: UICollectionViewDelegate

extension MainGameViewController: UICollectionViewDelegate {
  func insertNewChat(choiceRow: Int) {
    let isGodChat = currentBlock.isGodChat
    let choice = currentBlock.choices[choiceRow]
    chatList.append(
      Chat(
        text_: choice.text,
        image_: "",
        type_: choice.chatType,
        who_: choice.who,
        characterFace_: choice.characterFace,
        optionalOption_: choice.optionalOption,
        animationOption_: .none,
        isGodChat_: isGodChat))
    mainGameTableView.insertRows(at: [IndexPath(row: chatList.count - 1, section: 0)], with: .none)
  }
  
  func updateGodChatColor() {}

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard pauseBar.isHidden == true else { return }
    
    insertNewChat(choiceRow: indexPath.row)
    
    let isGodChat = currentBlock.isGodChat
    let choice = currentBlock.choices[indexPath.row]
    let isStartOrEndPoint = isGodChat != episode.storyBlocks[choice.nextTextIndex]!.isGodChat
    if isStartOrEndPoint {
      chatList.append(Chat(text_: "", image_: "", type_: isGodChat ? .endGodChat : .startGodChat, who_: .danhee, characterFace_: .none, optionalOption_: nil, animationOption_: .none, isGodChat_: isGodChat))
      
      if isGodChat {
        let bgColor = UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
        myChoiceText.textColor = .white
        mainGameTableView.backgroundColor = bgColor
        view.backgroundColor = bgColor
        choiceBarLine.backgroundColor = UIColor(red: 0.484, green: 0.581, blue: 0.671, alpha: 1)
      }
      else {
        let bgColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1) // 하늘색
        myChoiceText.textColor = .black
        mainGameTableView.backgroundColor = bgColor
        view.backgroundColor = bgColor
        choiceBarLine.backgroundColor = UIColor(red: 0.243, green: 0.357, blue: 0.459, alpha: 1) // 짙은 파랑
      }
      
      mainGameTableView.insertRows(at: [IndexPath(row: chatList.count - 1, section: 0)], with: .none)
    }
    
    print("현재 ChatId : \(episode.currentStoryBlockIndex), 선택한 선택지 : \(currentBlock.choices[indexPath.row])")
    
//    checkAlbumImageInChoice(choiceIndex: indexPath.row)
//    checkCaseInChoice(choiceIndex: indexPath.row)
//    checkAchievementInChoice(choiceIndex: indexPath.row)
//    checkGameCharacterInChoice(choiceIndex: indexPath.row)
//    checkgameCharacterInfomationInChoice(choiceIndex: indexPath.row)
    
    updateButtons()
    
    episode.currentStoryBlockIndex = currentBlock.choices[indexPath.row].nextTextIndex
    
    indexNumber = 0
    
    playEffectSound(.buttonClick, type: .mp3)
    
    closeChoiceBar()
    
    runTimer()
  }
}

// MARK: UICollectionViewDataSource

extension MainGameViewController: UICollectionViewDataSource {
  // 선택지 collectionView
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    episode.storyBlocks[episode.currentStoryBlockIndex]!.choices.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == choiceCollectionView {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "choiceCell", for: indexPath) as! choiceCollectionViewCell
      cell.choiceUpdate(choiceText: episode.storyBlocks[episode.currentStoryBlockIndex]!.choices[indexPath.row].text)
      pageControl.numberOfPages = episode.storyBlocks[episode.currentStoryBlockIndex]!.choices.count
      return cell
    }
    else {
      return UICollectionViewCell()
    }
  }
}

// MARK: UICollectionViewDelegateFlowLayout

extension MainGameViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.bounds.width, height: 99)
  }
}

// MARK: UITableView DataSource

extension MainGameViewController: UITableViewDataSource {
  // 스토리 테이블 뷰
  func numberOfSections(in tableView: UITableView) -> Int {
    1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    chatList.count
  }
  
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let target = chatList[indexPath.row]
    let chatText = chatList[indexPath.row].text
    // 텍스트 채팅이 나올 때
    // 자신이 보냈을 때
    if target.type == .onlyText, target.who.info().name == "이단희" {
      print("자신텍스트 : \(chatList[indexPath.row].text)")
      let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! MyTextTableViewCell
      cell.delegate = self
      cell.inputCharacter = target.who.info()
      cell.myTextCellUpdate(name: target.who, chat: chatText, profile: target.characterFace, godchat: target.isGodChat, currentDanhee: currentMainGameDanhee())
      //            cell.layoutIfNeeded()
      return cell
    }
    // 상대가 보냈을 때
    else if target.type == .onlyText {
      print("상대텍스트 : \(chatList[indexPath.row].text)")
      let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "opTextCell", for: indexPath) as! OpTextTableViewCell
      cell.profileNickname.textColor = .white
      cell.delegate = self
      cell.inputCharacter = target.who.info()
      cell.opTextCellUpdate(name: target.who, chat: chatText, normalProfile: target.who.info().profileImage, mainProfile: target.characterFace, isLocked: target.who.info().isLocked, godchat: target.isGodChat)
      cell.contentView.setNeedsDisplay()
      return cell
    }
    // 터치할 수 없는 이미지
    else if target.type == .untouchableImage {
      print("메인게임 - 이미지 출력")
      let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell
      cell.imageUpdate(mainImage: target.image, godchat: target.isGodChat)
      return cell
    }
    // 행동 표시글 셀
    else if target.type == .sectionHeader {
      print("메인게임 - 섹션헤더 출력")
      let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! SectionTableViewCell
      cell.sectionUpdate(text: chatText, godchat: target.isGodChat)
      return cell
    }
    else if target.type == .monologue {
      print("속마음채팅 - \(chatList[indexPath.row].text)")
      
      let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "monologue", for: indexPath) as! MonologueTableViewCell
      cell.delegate = self
      cell.inputCharacter = target.who.info()
      cell.monologueText.text = chatText
      cell.name.textColor = .white
      cell.chatUpdate(nickname: target.who, profile: target.characterFace, godchat: target.isGodChat, currentDanhee: currentMainGameDanhee())
      return cell
    }
    else if target.type == .ar {
      let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "arTableViewCell", for: indexPath) as! ARTableViewCell
      cell.delegate = self
      if let arContent = target.optionalOption?.arContent {
        cell.currentAR = arContent
      }
      
      return cell
    }
    else if target.type == .endGodChat || target.type == .startGodChat {
      print("메인게임 - 구분자 채팅 출력")
      let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "separatorCell", for: indexPath) as! SeparatorTableViewCell
      cell.separatorUpdate(chatType: target.type)
      return cell
    }
    else {
      print("메인게임 - 오류 발생1")
      return UITableViewCell()
    }
  }
}

// MARK: ProfileImageDelegate

extension MainGameViewController: ProfileImageDelegate {
  func profileImageTapped(inputCharacter: GameCharacter) {
    if inputCharacter.name == "이단희" || inputCharacter.name == "휘령" {
      if inputCharacter.name == "이단희" {
        performSegue(withIdentifier: "NoteUserVC", sender: inputCharacter)
      }
      else {
        if !inputCharacter.isLocked {
          performSegue(withIdentifier: "NoteHwiryeongVC", sender: inputCharacter)
        }
      }
    }
    else {
      if inputCharacter.description != "", !inputCharacter.isLocked {
        performSegue(withIdentifier: "NoteGameCharacterVC", sender: inputCharacter)
      }
    }
  }
}

// MARK: Tutorial

extension MainGameViewController {
  func setupTutorial() {
    let items: [TutorialStyle] = [
      .singleImage(image: "maingame_11", desc: "화면을 스와이프하여 선택지를 고를 수 있습니다."),
      .singleFillImage(image: "maingame_22", desc: "캐릭터를 누르면 해당 캐릭터의 상세 정보를 볼 수 있습니다."),
      .singleImage(image: "maingame_33", desc: "게임을 플레이하면서 얻은 정보들을 메뉴에서 찾아볼 수 있습니다."),
      .singleFillImage(image: "maingame_44", desc: "현재 플레이하고 있는 사건을 보여줍니다."),
    ]
    
    TutorialView.showTutorial(inView: view, items: items, type: .maingame, closeHandler: { [weak self] in self?.runTimer() })
    player.userStore.isMainGameTutorialOpened = true
  }
}

extension MainGameViewController {
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    configureCollectionViewLayoutItemSize(layout: normalChoiceCollectionViewLayout)
  }
    
  private func calculateSectionInset(layout: UICollectionViewFlowLayout) -> CGFloat {
    let cellBodyWidth: CGFloat = layout.itemSize.width
        
    // let inset = (layout.collectionView!.frame.width - cellBodyWidth + buttonWidth) / 4
    let inset = layout.collectionView!.frame.width - cellBodyWidth / 2
    return inset
  }
    
  private func configureCollectionViewLayoutItemSize(layout: UICollectionViewFlowLayout) {
    let inset: CGFloat = calculateSectionInset(layout: layout) // This inset calculation is some magic so the next and the previous cells will peek from the sides. Don't worry about it
    /*
     //width에 layout.collectionView!.frame.size.width + layout.minimumLineSpacing - 100 도 낫배드
     layout.itemSize = CGSize(width: layout.collectionView!.frame.size.width - inset * 2, height: layout.collectionView!.frame.size.height)
     //left는 0을 넣는 게 좋아보임.
     layout.sectionInset = UIEdgeInsets(top: 0, left: 0 bottom: 0, right: inset)
     */
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: inset)
    layout.itemSize = CGSize(width: layout.collectionView!.frame.size.width + layout.minimumLineSpacing - 100, height: layout.collectionView!.frame.size.height)
  }
    
  func indexOfMajorCell(layout: UICollectionViewFlowLayout) -> Int {
    let itemWidth = layout.itemSize.width
    let proportionalOffset = layout.collectionView!.contentOffset.x / itemWidth
    let index = Int(round(proportionalOffset))
    let safeIndex = max(0, min(episode.storyBlocks[episode.currentStoryBlockIndex]!.choices.count - 1, index))
    if layout == normalChoiceCollectionViewLayout {
      pageControl.currentPage = safeIndex
    }
    return safeIndex
  }
    
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    if scrollView == choiceCollectionView {
      indexOfCellBeforeDragging = indexOfMajorCell(layout: normalChoiceCollectionViewLayout)
    }
  }

  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let page = Int(targetContentOffset.pointee.x / view.frame.width)
    pageControl.currentPage = page
  }
}

extension MainGameViewController {
  // MARK: Timer
  
  func pauseTimer() {
    timer?.invalidate()
  }
  
  func runTimer() {
    pauseTimer()
    print("chatUpdateTimer 실행")
    timer = Timer.scheduledTimer(withTimeInterval: player.setting.textSpeed, repeats: true, block: { timer in
      self.chatUpdate()
      print(timer)
    })
  }
  
  func chatUpdate() {
    print("스토리 \(indexNumber)/\(episode.currentChatAmount)")
    playBgm(put: currentBlock.backGroundMusic.info())
    if indexNumber != episode.currentChatAmount {
      checkEnterAnimation()
    }
    // 게임 오버 시 뜰 배드엔딩 창 띄우기.
    if indexNumber == episode.currentChatAmount, currentBlock.choices[0].nextTextIndex.hasPrefix("ending") {
      episode.currentStoryBlockIndex = currentBlock.choices[0].nextTextIndex
      print("타이머 여부 :\(timer == nil)")
      if timer != nil {
        print("timer invalidate")
        timer!.invalidate()
        timer = nil
      }
      blackView.bounds = view.bounds
      blackView.center = view.center
      view.addSubview(blackView)
      blackView.alpha = 0
      UIView.animate(withDuration: 2.0) {
        self.blackView.alpha = 1
      } completion: { [self] _ in
        indexNumber = 0
        chatList.removeAll()
        self.mainGameTableView.reloadData()
        self.performSegue(withIdentifier: "badEnding", sender: nil)
        blackView.removeFromSuperview()
      }
      return
    }
    // 에피소드를 깼을 때
    else if indexNumber == episode.currentChatAmount, currentBlock.choices[0].nextTextIndex == "episodeSuccess" {
      pauseTimer()
      episode.isCleared = true
      print("\(episode.episodeID) 클리어")
      episode.chatHistory = chatList
      
      navigationController?.popViewController(animated: true)
    }
    else if indexNumber < episode.currentChatAmount, currentBlock.chats[indexNumber].type != .ar {
      // 일반적인 채팅
      chatList.append(currentBlock.chats[indexNumber])
      mainGameTableView.insertRows(at: [IndexPath(row: chatList.count - 1, section: 0)], with: .none)
    }
    else if indexNumber == episode.currentChatAmount, currentBlock.choiceSkip == false {
      // 선택지가 나올 때
      pauseTimer()
      print("invalidate")
      guard chatList.last?.type != .choice else { return }
      choiceUpdate()
      return
    }
    else if indexNumber == episode.currentChatAmount, currentBlock.choiceSkip == true {
      // 선택지 없이 바로 다음 스토리블럭으로 갈 때
      if currentBlock.isGodChat != episode.storyBlocks[currentBlock.choices[0].nextTextIndex]!.isGodChat
      {
        if currentBlock.isGodChat == true {
          chatList.append(Chat(text_: "", image_: "", type_: .endGodChat, who_: .danhee, characterFace_: .none, optionalOption_: nil, animationOption_: .none, isGodChat_: false))
          myChoiceText.textColor = .white
          view.backgroundColor = UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
          mainGameTableView.backgroundColor = UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
          choiceBarLine.backgroundColor = UIColor(red: 0.484, green: 0.581, blue: 0.671, alpha: 1)
        }
        else {
          mainGameTableView.backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1)
          chatList.append(Chat(text_: "", image_: "", type_: .startGodChat, who_: .danhee, characterFace_: .none, optionalOption_: nil, animationOption_: .none, isGodChat_: true))
          view.backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1)
          myChoiceText.textColor = .black
          choiceBarLine.backgroundColor = UIColor(red: 0.243, green: 0.357, blue: 0.459, alpha: 1)
        }
        mainGameTableView.insertRows(at: [IndexPath(row: chatList.count - 1, section: 0)], with: .none)
      }
      episode.currentStoryBlockIndex = currentBlock.choices[0].nextTextIndex
      indexNumber = 0
      chatUpdate()
      scrollToBottom()
      return
    }
    else if indexNumber < episode.currentChatAmount, currentBlock.chats[indexNumber].type == .ar
    {
      pauseTimer()
      chatList.append(currentBlock.chats[indexNumber])
      mainGameTableView.insertRows(at: [IndexPath(row: chatList.count - 1, section: 0)], with: .none)
    }
    
    // 아래 네 개 각각 지금 챗에 새 업적/새 인물/새 역사 사건/새 인물 정보 있나 확인한 뒤 있는 경우 팝업창 띄우기/노트 정보 수정하는 코드입니다
    // 그 아래는 앨범 이미지 확인하는 함수예요
//    checkAchievementInChat()
//    checkGameCharacterInChat()
//    checkCaseInChat()
//    checkgameCharacterInfomationInChat()
//    checkAlbumImageInChat()
//    checkCheckPointInChat()
    updateButtons()
    indexNumber += 1
    scrollToBottom()
  }
  
  func choiceUpdate() {
    isChoiceOn = true
    myChoiceText.isHidden = false
    choiceBarLine.isHidden = false
    pauseTimer()
    choiceCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: false)
    pageControl.currentPage = 0
    choiceHeight.constant = 150
    choiceBar.setNeedsUpdateConstraints()
    choiceBar.isHidden = false
    safeAreaBottom.isHidden = false
    choiceCollectionView.reloadData()
    mainGameTableView.layoutIfNeeded()
    if !(chatList.count == 1), !chatList.isEmpty {
      mainGameTableView.contentOffset.y += 149
    }
    scrollToBottom()
  }

  func closeChoiceBar() {
    myChoiceText.isHidden = true
    choiceBarLine.isHidden = true
    isChoiceOn = false
    choiceHeight.constant = 0
    choiceBar.isHidden = true
    safeAreaBottom.isHidden = true
    choiceBar.setNeedsUpdateConstraints()
    mainGameTableView.layoutIfNeeded()
  }
  
  func checkEnterAnimation() {
    if let animation = episode.storyBlocks[episode.currentStoryBlockIndex]?.chats[indexNumber].animationOption
    {
      if animation != .none {
        pauseTimer()
      }
      switch animation {
      case .none:
        return
      case .fadeIn:
        blackView.bounds = view.bounds
        blackView.center = view.center
        view.addSubview(blackView)
        blackView.alpha = 1
        UIView.animate(withDuration: 2.0) {
          self.blackView.alpha = 0
        } completion: { _ in
          self.blackView.removeFromSuperview()
          self.runTimer()
        }
      case .fadeOut:
        blackView.bounds = view.bounds
        blackView.center = view.center
        view.addSubview(blackView)
        blackView.alpha = 0
        UIView.animate(withDuration: 2.0) {
          self.blackView.alpha = 1
        } completion: { _ in
          self.blackView.removeFromSuperview()
          self.runTimer()
        }
      }
    }
  }

  func alertTargetView(targetView: UIView, timeInterval: Double, firstColor: UIColor, secondColor: UIColor) {
    alertTimer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: { timer in
      if targetView.backgroundColor == firstColor {
        targetView.backgroundColor = secondColor
      }
      else {
        targetView.backgroundColor = firstColor
      }
    })
  }
}
//
//// MARK: Achievement
//
//extension MainGameViewController {
//  func checkAchievementInChoice(choiceIndex: Int) {
//    let currentChoice = episode.storyBlocks[episode.currentStoryBlockIndex]!.choices[choiceIndex]
//    guard let currentChoiceOptionalOption = currentChoice.optionalOption else { return }
//    let currentChoiceAchievement = currentChoiceOptionalOption.achievementToUnlock
//
//    if currentChoiceAchievement != nil {
//      for achievement in player.currentAchievementInfo.enumerated() {
//        if achievement.element.id == currentChoiceAchievement {
//          player.currentAchievementInfo[achievement.offset].isLocked = false
//          player.currentAchievementInfo[achievement.offset].isLocked = false
//          print("업적 '\(player.currentAchievementInfo[achievement.offset].name)' 달성됨")
//          player.currentAchievementInfo[achievement.offset].isChecked = false
//          let achievementPopupInfo = ("업적", player.currentAchievementInfo[achievement.offset].name)
//          notePopupItemArray.append(achievementPopupInfo)
//        }
//      }
//    }
//  }
//
//  func checkAchievementInChat() {
//    let currentChat = episode.storyBlocks[episode.currentStoryBlockIndex]!.chats[indexNumber]
//    guard let currentChatOptionalOption = currentChat.optionalOption else { return }
//    let currentChatAchievement = currentChatOptionalOption.achievementToUnlock
//    // 팝업에 띄울 게 있다면
//    if currentChatAchievement != nil {
//      for achievement in player.currentAchievementInfo.enumerated() {
//        if achievement.element.id == currentChatAchievement {
//          player.currentAchievementInfo[achievement.offset].isLocked = false
//          player.currentAchievementInfo[achievement.offset].isChecked = false
//          print("업적 '\(player.currentAchievementInfo[achievement.offset].name)' 달성됨")
//
//          let achievementPopupInfo = ("업적", player.currentAchievementInfo[achievement.offset].name)
//          notePopupItemArray.append(achievementPopupInfo)
//        }
//      }
//    }
//  }
//}
//
//// MARK: Note
//
//extension MainGameViewController {
//  func checkGameCharacterInChoice(choiceIndex: Int) {
//    let currentChoice = episode.storyBlocks[episode.currentStoryBlockIndex]!.choices[choiceIndex]
//    guard let currentChoiceOptionalOption = currentChoice.optionalOption else { return }
//    let currentChatGameCharacter = currentChoiceOptionalOption.gameCharacterToUnlock
//
//    if let currentChatGameCharacter = currentChatGameCharacter {
//      for gameCharacter in episode.currentCharacterNote.enumerated() {
//        if gameCharacter.element.name == currentChatGameCharacter.info().name {
//          episode.currentCharacterNote[gameCharacter.offset].isLocked = false
//          episode.currentCharacterNote[gameCharacter.offset].isChecked = false
//          print("캐릭터 '\(episode.currentCharacterNote[gameCharacter.offset].isLocked)' 해금됨")
//          let gameCharacterPopupInfo = ("수첩 - 인물", episode.currentCharacterNote[gameCharacter.offset].name)
//          notePopupItemArray.append(gameCharacterPopupInfo)
//        }
//      }
//    }
//  }
//
//  func checkCaseInChoice(choiceIndex: Int) {
//    let currentChoice = episode.storyBlocks[episode.currentStoryBlockIndex]!.choices[choiceIndex]
//    guard let currentChoiceOptionalOption = currentChoice.optionalOption else { return }
//    let currentChatCase = currentChoiceOptionalOption.caseToUnlock
//
//    if currentChatCase != nil {
//      for caseNote in episode.currentCaseNote.enumerated() {
//        if caseNote.element.id == currentChatCase {
//          episode.currentCaseNote[caseNote.offset].isLocked = false
//          episode.currentCaseNote[caseNote.offset].isChecked = false
//          print("사건 노트 '\(episode.currentCaseNote[caseNote.offset].isLocked)' 해금됨")
//
//          let casePopupInfo = ("수첩 - 사건", episode.currentCaseNote[caseNote.offset].title)
//          notePopupItemArray.append(casePopupInfo)
//        }
//      }
//    }
//  }
//
//  // mainGame에서 currentChat 정보 읽어서 알맞는 등장인물의 infomation 해금하기
//  func checkgameCharacterInfomationInChoice(choiceIndex: Int) {
//    let currentChoice = episode.storyBlocks[episode.currentStoryBlockIndex]!.choices[choiceIndex]
//    guard let currentChoiceOptionalOption = currentChoice.optionalOption else { return }
//    let currentChatInfomation = currentChoiceOptionalOption.infomationToUnlock
//
//    if currentChatInfomation != nil {
//      for gameCharacter in episode.currentCharacterNote.enumerated() {
//        for infomation in gameCharacter.element.infomation.enumerated() {
//          if infomation.element.infomationID == currentChatInfomation {
//            episode.currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].isLocked = false
//            print("'\(episode.currentCharacterNote[gameCharacter.offset].isLocked)' 정보 해금됨")
//            let gameCharacterInfomationInfo = ("수첩 - 인물 정보", episode.currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].text)
//            notePopupItemArray.append(gameCharacterInfomationInfo)
//          }
//        }
//      }
//    }
//  }
//
//  func checkGameCharacterInChat() {
//    let currentChat = episode.storyBlocks[episode.currentStoryBlockIndex]!.chats[indexNumber]
//    guard let currentChatOptionalOption = currentChat.optionalOption else { return }
//    let currentChatGameCharacter = currentChatOptionalOption.gameCharacterToUnlock
//
//    if let currentChatGameCharacter = currentChatGameCharacter {
//      for gameCharacter in episode.currentCharacterNote.enumerated() {
//        if gameCharacter.element.name == currentChatGameCharacter.info().name {
//          episode.currentCharacterNote[gameCharacter.offset].isLocked = false
//          episode.currentCharacterNote[gameCharacter.offset].isChecked = false
//          print("캐릭터 '\(episode.currentCharacterNote[gameCharacter.offset].isLocked)' 해금됨")
//
//          let gameCharacterPopupInfo = ("수첩 - 인물", episode.currentCharacterNote[gameCharacter.offset].name)
//          notePopupItemArray.append(gameCharacterPopupInfo)
//        }
//      }
//    }
//  }
//
//  // mainGame에서 currentChat 정보 읽어서 알맞는 수첩 속 사건 금하기
//  func checkCaseInChat() {
//    let currentChat = episode.storyBlocks[episode.currentStoryBlockIndex]!.chats[indexNumber]
//    guard let currentChatOptionalOption = currentChat.optionalOption else { return }
//    let currentChatCase = currentChatOptionalOption.caseToUnlock
//
//    if currentChatCase != nil {
//      for caseNote in episode.currentCaseNote.enumerated() {
//        if caseNote.element.id == currentChatCase {
//          episode.currentCaseNote[caseNote.offset].isLocked = false
//          episode.currentCaseNote[caseNote.offset].isChecked = false
//          print("사건 노트 '\(episode.currentCaseNote[caseNote.offset].isLocked)' 해금됨")
//
//          let casePopupInfo = ("수첩 - 사건", episode.currentCaseNote[caseNote.offset].title)
//          notePopupItemArray.append(casePopupInfo)
//        }
//      }
//    }
//  }
//
//  // mainGame에서 currentChat 정보 읽어서 알맞는 등장인물의 infomation 해금하기
//  func checkgameCharacterInfomationInChat() {
//    let currentChat = episode.storyBlocks[episode.currentStoryBlockIndex]!.chats[indexNumber]
//    guard let currentChatOptionalOption = currentChat.optionalOption else { return }
//    let currentChatInfomation = currentChatOptionalOption.infomationToUnlock
//
//    if currentChatInfomation != nil {
//      for gameCharacter in episode.currentCharacterNote.enumerated() {
//        for infomation in gameCharacter.element.infomation.enumerated() {
//          if infomation.element.infomationID == currentChatInfomation {
//            episode.currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].isLocked = false
//            print("'\(episode.currentCharacterNote[gameCharacter.offset].isLocked)' 정보 해금됨")
//
//            let gameCharacterInfomationInfo = ("수첩 - 인물 정보", episode.currentCharacterNote[gameCharacter.offset].infomation[infomation.offset].text)
//            notePopupItemArray.append(gameCharacterInfomationInfo)
//          }
//        }
//      }
//    }
//  }
//}
//
//// MARK: Album
//
//extension MainGameViewController {
//  func checkAlbumImageInChoice(choiceIndex: Int) {
//    let currentChoice = episode.storyBlocks[episode.currentStoryBlockIndex]!.choices[choiceIndex]
//    guard let currentChoiceOptionalOption = currentChoice.optionalOption else { return }
//    let currentChatAlbumImage = currentChoiceOptionalOption.albumImageToUnlock
//
//    if currentChatAlbumImage != nil {
//      for albumImage in episode.currentAlbumImages.enumerated() {
//        if albumImage.element.id == currentChatAlbumImage {
//          episode.currentAlbumImages[albumImage.offset].isLocked = false
//          episode.currentAlbumImages[albumImage.offset].isChecked = false
//          print("'\(episode.currentAlbumImages[albumImage.offset].isLocked)' 앨범 이미지 해금됨")
//
//          let albumImageInfo = ("앨범", episode.currentAlbumImages[albumImage.offset].title)
//          notePopupItemArray.append(albumImageInfo)
//        }
//      }
//    }
//  }
//
//  func checkAlbumImageInChat() {
//    let currentChat = episode.storyBlocks[episode.currentStoryBlockIndex]!.chats[indexNumber]
//    guard let currentChatOptionalOption = currentChat.optionalOption else { return }
//    let currentChatAlbumImage = currentChatOptionalOption.albumImageToUnlock
//
//    if currentChatAlbumImage != nil {
//      for albumImage in episode.currentAlbumImages.enumerated() {
//        if albumImage.element.id == currentChatAlbumImage {
//          episode.currentAlbumImages[albumImage.offset].isLocked = false
//          episode.currentAlbumImages[albumImage.offset].isChecked = false
//          print("'\(episode.currentAlbumImages[albumImage.offset].isLocked)' 앨범 이미지 해금됨")
//
//          let albumImageInfo = ("앨범", episode.currentAlbumImages[albumImage.offset].title)
//          notePopupItemArray.append(albumImageInfo)
//        }
//      }
//    }
//  }
//}
//
//// MARK: Checkpoint
//
//extension MainGameViewController {
//  func checkCheckPointInChat() {
//    let currentChat = episode.storyBlocks[episode.currentStoryBlockIndex]!.chats[indexNumber]
//    guard let currentChatOptionalOption = currentChat.optionalOption else { return }
//    let currentChatCheckPoint = currentChatOptionalOption.checkPointToUnlock
//
//    if currentChatCheckPoint != nil {
//      for checkPointSection in episode.timelineCheckPoint.enumerated() {
//        for checkPoint in checkPointSection.element.enumerated() {
//          if checkPoint.element.id == currentChatCheckPoint {
//            episode.timelineCheckPoint[checkPointSection.offset][checkPoint.offset].isLocked = false
//            print("'\(episode.timelineCheckPoint[checkPointSection.offset][checkPoint.offset].name): 해금\(!episode.timelineCheckPoint[checkPointSection.offset][checkPoint.offset].isLocked)임' 앨범 이미지 해금됨")
//          }
//        }
//      }
//    }
//  }
//}

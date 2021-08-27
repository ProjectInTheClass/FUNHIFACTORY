//
//  mainGameViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import UIKit
import AVFoundation
import AudioToolbox

class mainGameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    //Outlet
    
    var alertTimer = Timer()
    var isStartOfEpisode: Bool = false
    var indexOfCellBeforeDragging = 0
    
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
    @IBOutlet var notePopupView: UIView!
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
  @IBOutlet weak var timeline: FloatingButton!
  @IBOutlet weak var setting: FloatingButton!
  @IBOutlet weak var menu: FloatingButton!
  @IBOutlet weak var map: FloatingButton!
  

  private func setupButtons() {
    home.setImages(nor: "HomeNormal", not: "HomeNormal")
    note.setImages(nor: "NoteNormal", not: "NoteHighlighted")
    album.setImages(nor: "AlbumNormal", not: "AlbumHighlighted")
    timeline.setImages(nor: "TimelineNormal", not: "TimelineNormal")
    setting.setImages(nor: "SettingNormal", not: "SettingNormal")
    map.setImages(nor: "MapNormal", not: "MapNormal")
    menu.setImages(nor: "MenuNormal", not: "MenuHighlighted")

  }

   func updateButtons() {
    readAllNotes ? (note.isNormal = true) : (note.isNormal = false)
    readAllAlbums ? (album.isNormal = true) : (album.isNormal = false)
    readAllNotification ? (menu.isNormal = true) : (menu.isNormal = false)
  }

    var animator : UIViewPropertyAnimator?

    //스토리 테이블 뷰
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        player.currentChatArray.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let target = player.currentChatArray[indexPath.row]
        let chatText = player.currentChatArray[indexPath.row].text
        //텍스트 채팅이 나올 때
        //자신이 보냈을 때
        if target.type == .onlyText && target.who.info().name == "이단희"{
            print("자신텍스트 : \(player.currentChatArray[indexPath.row].text)")
            let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! myTextTableViewCell
            cell.delegate = self
            cell.inputCharacter = target.who.info()
            cell.myTextCellUpdate(name: target.who, chat: chatText, profile: target.characterFace, godchat: target.isGodChat, currentDanhee: currentMainGameDanhee())
//            cell.layoutIfNeeded()
            return cell
        }
        //상대가 보냈을 때
        else if target.type == .onlyText {
            print("상대텍스트 : \(player.currentChatArray[indexPath.row].text)")
            let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "opTextCell", for: indexPath) as! opTextTableViewCell
            cell.profileNickname.textColor = .white
            cell.delegate = self
            cell.inputCharacter = target.who.info()
            cell.opTextCellUpdate(name: target.who, chat: chatText,normalProfile: target.who.info().profileImage, mainProfile: target.characterFace, isLocked: target.who.info().isLocked, godchat: target.isGodChat)
            cell.contentView.setNeedsDisplay()
            return cell
        }
        //터치할 수 없는 이미지
        else if target.type == .untouchableImage {
            print("메인게임 - 이미지 출력")
            let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell
            cell.imageUpdate(mainImage: target.image, godchat: target.isGodChat)
            return cell
        }
        //행동 표시글 셀
        else if target.type == .sectionHeader{
            print("메인게임 - 섹션헤더 출력")
            let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! sectionTableViewCell
            cell.sectionUpdate(text:chatText, godchat: target.isGodChat)
            return cell
        }
        else if target.type == .monologue{
            print("속마음채팅 - \(player.currentChatArray[indexPath.row].text)")
                    
            let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "monologue", for: indexPath) as! monologueTableViewCell
            cell.delegate = self
            cell.inputCharacter = target.who.info()
            cell.monologueText.text = chatText
            cell.name.textColor = .white
            cell.chatUpdate(nickname: target.who, profile: target.characterFace, godchat: target.isGodChat, currentDanhee: currentMainGameDanhee())
            return cell
        }
        else if target.type == .ar{
            let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "arTableViewCell", for: indexPath) as! ARTableViewCell
            cell.delegate = self
            if let arContent = target.optionalOption?.arContent {
                cell.currentAR = arContent
            }
            
            return cell
        }
        else if (target.type == .endGodChat || target.type == .startGodChat)
        {
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
    
    //선택지 collectionView
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            player.currentEpisodes[strToIndex(str: player.dayId)].storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices.count
        }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width, height: 99)
    }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if collectionView == choiceCollectionView{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "choiceCell", for: indexPath) as! choiceCollectionViewCell
                cell.choiceUpdate(choiceText : player.currentEpisodes[strToIndex(str: player.dayId)].storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices[indexPath.row].text)
                pageControl.numberOfPages = player.currentEpisodes[strToIndex(str: player.dayId)].storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]!.choices.count
                return cell
            }else{
                return UICollectionViewCell()
            }
        }
        func initializePageControl(collectionView : UICollectionView, choiceBar : UIView, numberOfPages: Int){
            collectionView.contentInsetAdjustmentBehavior = .never
            collectionView.decelerationRate = .fast
            pageControl.hidesForSinglePage = true
            collectionView.showsHorizontalScrollIndicator = false
            pageControl.currentPageIndicatorTintColor = UIColor.white
        }
        
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
            
            if currentBlockOfDay().isGodChat == true
            {
                player.currentChatArray.append(Chat(text_: currentBlockOfDay().choices[indexPath.row].text, image_: "", type_: currentBlockOfDay().choices[indexPath.row].chatType, who_: currentBlockOfDay().choices[indexPath.row].who, characterFace_: currentBlockOfDay().choices[indexPath.row].characterFace, optionalOption_: currentBlockOfDay().choices[indexPath.row].optionalOption, animationOption_: .none, isGodChat_: true))
            }
            else
            {
                player.currentChatArray.append(Chat(text_: currentBlockOfDay().choices[indexPath.row].text, image_: "", type_: currentBlockOfDay().choices[indexPath.row].chatType, who_: currentBlockOfDay().choices[indexPath.row].who, characterFace_: currentBlockOfDay().choices[indexPath.row].characterFace, optionalOption_: currentBlockOfDay().choices[indexPath.row].optionalOption, animationOption_: .none, isGodChat_: false))
            }
                mainGameTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)
           
            if (currentBlockOfDay().isGodChat != currentEpisode().storyBlocks[currentBlockOfDay().choices[indexPath.row].nextTextIndex]!.isGodChat)
            {
                
                if (currentBlockOfDay().isGodChat == true)
                {
                    myChoiceText.textColor = .white
                    mainGameTableView.backgroundColor =  UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
                    choiceBarLine.backgroundColor = UIColor(red: 0.484, green: 0.581, blue: 0.671, alpha: 1)
                    self.view.backgroundColor = UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
                    player.currentChatArray.append(Chat(text_: "", image_: "", type_: .endGodChat, who_: .danhee, characterFace_: .none, optionalOption_: nil, animationOption_: .none, isGodChat_: false))
                }
                else
                {
                    player.currentChatArray.append(Chat(text_: "", image_: "", type_: .startGodChat, who_: .danhee, characterFace_: .none, optionalOption_: nil, animationOption_: .none, isGodChat_: true))
                    choiceBarLine.backgroundColor = UIColor(red: 0.243, green: 0.357, blue: 0.459, alpha: 1)    //짙은 파랑
                    myChoiceText.textColor = .black
                    self.view.backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1) //하늘색
                    mainGameTableView.backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1) //하늘색
                }
                mainGameTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)
            }
            print("현재 ChatId : \(player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex), 선택한 선택지 : \(currentBlockOfDay().choices[indexPath.row])")
            checkAlbumImageInChoice(choiceIndex: indexPath.row)

            checkCaseInChoice(choiceIndex: indexPath.row)
            checkAchievementInChoice(choiceIndex: indexPath.row)
            checkGameCharacterInChoice(choiceIndex: indexPath.row)
            checkgameCharacterInfomationInChoice(choiceIndex: indexPath.row)
            updateButtons()

            player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex = currentBlockOfDay().choices[indexPath.row].nextTextIndex
            player.indexNumber = 0
            closeChoiceBar()
            chatUpdateTimer()
        }
    
    override func viewDidAppear(_ animated: Bool) {
        print("퍼즈바 꺼졌는가? :\(pauseBar.isHidden), 초이스 켜졌는가? :\(isChoiceOn), 타이머 꺼졌는가? :\(timer==nil)")
//        if !player.currentChatArray.isEmpty
//        {
//            scrollToBottom()
//        }
        if timer == nil{
            guard pauseBar.isHidden == true else {return}
            print("chatupdatetimer is executed")
            chatUpdateTimer()
            closeChoiceBar()
            audioConfigure(bgmName: "mainGameBGM", isBGM: true, ofType: "mp3")
        } else {
            print("chatupdatetimer isn't executed")
            audioConfigure(bgmName: "mainGameBGM", isBGM: true, ofType: "mp3")
          return
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        while timer != nil {
            timer.invalidate()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        closeChoiceBar()
        updateButtons()
        if let story = player.currentEpisodes[strToIndex(str: player.dayId)].storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]?.isGodChat
        {
            if story == true
            {
                myChoiceText.textColor = .black
                choiceBarLine.backgroundColor = UIColor(red: 0.243, green: 0.357, blue: 0.459, alpha: 1)
                mainGameTableView.backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1)
                self.view.backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1)
            }
            else
            {
                myChoiceText.textColor = .white
                self.view.backgroundColor = UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
                choiceBarLine.backgroundColor = UIColor(red: 0.484, green: 0.581, blue: 0.671, alpha: 1)
                mainGameTableView.backgroundColor =  UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
            }
        }
        if isStartOfEpisode {
            if let previousEpisodeID = previousEpisodeID {
                if player.currentChatArray.count != 0 {
                    player.currentEpisodes[strToIndex(str: previousEpisodeID)].chatHistory = player.currentChatArray
                }
            }
           
            player.currentChatArray.removeAll()
            isStartOfEpisode = false
            blackView.bounds = self.view.bounds
            blackView.center = self.view.center
            self.view.addSubview(blackView)
            blackView.alpha = 1
            
            UIView.animate(withDuration: 1.0) {
                self.blackView.alpha = 0
            } completion: { (Bool) in
                self.blackView.removeFromSuperview()
            }
        }
        currentYear.text = "\(player.currentEpisodes[strToIndex(str: player.dayId)].episodeYear)년"
    }
    override func viewWillDisappear(_ animated: Bool) {
        if timer != nil {
            timer!.invalidate()
            timer = nil
          }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainGameTableView.delegate = self
        self.mainGameTableView.dataSource = self
        self.choiceCollectionView.delegate = self
        self.choiceCollectionView.dataSource = self
        mainGameTableView.reloadData()
        mainGameTableView.estimatedRowHeight = 2.0;
        let TVCtouchGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(instantChatUpdate(_:)))
        mainGameTableView.addGestureRecognizer(TVCtouchGesture)
        choiceCollectionView.isPagingEnabled = true
        if let page = player.currentEpisodes[strToIndex(str: player.dayId)].storyBlocks[player.currentEpisodes[strToIndex(str: player.dayId)].currentStoryBlockIndex]?.choices.count{
            initializePageControl(collectionView : choiceCollectionView, choiceBar : choiceBar, numberOfPages:page)
        }
        self.mainGameTableView.contentInset.bottom = 82
        choiceCollectionViewBorder(choiceView: collectionBar)
        setupButtons()
        maingameNotepopupViewDesign(popupView: notePopupView, parentView: self.view!)
    }
    
    
    @IBAction func notePushAction(_ sender: Any) {
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
        let transition:CATransition = CATransition()
          transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        transition.type = CATransitionType.moveIn
          transition.subtype = CATransitionSubtype.fromBottom
          self.navigationController!.view.layer.add(transition, forKey: kCATransition)
      
        performSegue(withIdentifier: "noteSegue", sender: nil)
    }
    
    @IBAction func albumPushAction(_ sender: Any) {
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
        let transition:CATransition = CATransition()
          transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        transition.type = CATransitionType.moveIn
          transition.subtype = CATransitionSubtype.fromBottom
          self.navigationController!.view.layer.add(transition, forKey: kCATransition)
       
        performSegue(withIdentifier: "albumSegue", sender: nil)
    }
    
    @IBAction func timelinePushAction(_ sender: Any) {
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
        let transition:CATransition = CATransition()
          transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        transition.type = CATransitionType.moveIn
          transition.subtype = CATransitionSubtype.fromBottom
          self.navigationController!.view.layer.add(transition, forKey: kCATransition)
       
        performSegue(withIdentifier: "timelineSegue", sender: nil)
    }
    
    func vibrate(vibrateIsOn : Bool){
        if vibrateIsOn == true{
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }else {
         return
        }
    }
    
    //가장 밑으로 스크롤해주는 함수
    func scrollToBottom(){
        guard player.currentChatArray.count != 0 else {return}
        guard isChoiceOn == false else {return}
        guard topBar.isHidden == true else {return}
        let indexPath = IndexPath(row: player.currentChatArray.count-1, section: 0)
        self.mainGameTableView.scrollToRow(at: indexPath, at: .bottom, animated: false) //true로 바꾸면 좀 더 천천히 내려가긴 하는데, 못 따라오는 경우도 있다.
    }
    
    @IBAction func settingTapped(_ sender: Any) {
        guard let VC = storyboard?.instantiateViewController(identifier: "settings") else {return}
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true, completion: nil)
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    @IBAction func mapOpen(_ sender: Any) {
//        map.transform = CGAffineTransform(scaleX: 0, y: 0)
//        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, options: [], animations: {
//                                                                    let scaleDown = CGAffineTransform(scaleX: 1, y: 1)
//                                                                    self.map.transform = scaleDown})
//        map.translatesAutoresizingMaskIntoConstraints = false
//        map.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 36).isActive = true
//        map.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        map.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
        guard let mapVC = storyboard?.instantiateViewController(identifier: "MapVC") else {return}
        mapVC.modalPresentationStyle = .fullScreen
        present(mapVC, animated: true, completion: nil)
    }
    @IBAction func closeMap(_ sender: Any) {
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, options: [], animations: {
          
            self.blackView.alpha = 0
        }, completion: {_ in
            print("퍼즈바 :\(self.pauseBar.isHidden), 초이스 :\(isChoiceOn), 타이머 :\(timer==nil)")
            
            self.blackView.removeFromSuperview()
            if isChoiceOn == false// && timer == nil
            {
                guard self.pauseBar.isHidden == true else {return}
                self.chatUpdateTimer()
            }
        })
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    @IBAction func pauseTapped(_ sender: Any) {
        pauseBar.isHidden = false
        safeAreaTop.isHidden = false
        if timer != nil{
            timer.invalidate()
        }
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    @IBAction func resumeTapped(_ sender: Any) {
        pauseBar.isHidden = true
        safeAreaTop.isHidden = true
//        if timer == nil {
            chatUpdateTimer()
//        }
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    func just(){
        if mainGameTableView.contentSize.height > 608{
            let expandedOffSetY = CGFloat(52)
            let collapsedBottomOffSet = CGFloat(608+18)
            let expandedBottomOffset = min(CGFloat(320), mainGameTableView.contentSize.height) + expandedOffSetY
            mainGameTableView.frame.origin.y = (collapsedBottomOffSet - expandedBottomOffset) + expandedOffSetY
        }
    }
    func choiceAnimUp(){
        UIView.animate(withDuration: 0.5, animations: {self.just()},
                       completion: {_ in self.mainGameTableView.frame.origin.y = 105
                        self.mainGameTableView.heightAnchor.constraint(equalToConstant: 608).isActive = true
                        self.mainGameTableView.layoutIfNeeded()
        })
    }
    @IBAction func touchPageControl(_ sender: Any) {
        print(pageControl.currentPage)
        //choiceCollectionView.scrollToItem(at: IndexPath(item: pageControl.currentPage, section: 0), at: .centeredHorizontally, animated: true)
        let rect = self.choiceCollectionView.layoutAttributesForItem(at: IndexPath(item: pageControl.currentPage, section: 0))?.frame
        self.choiceCollectionView.scrollRectToVisible(rect!, animated: true)
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "mainToHome", sender: nil)
    }
    

    
    var notePopupItemArray: [(a: String, b: String)] = [] {
        didSet {
            // 현재 팝업 띄울 것 1개 이상일 때
            if notePopupItemArray.count >= 1 && !isNotePopupAnimationRunning {
                notePopupAnimation()
            }
        }
    }
    
    func notePopupAnimation() {
        isNotePopupAnimationRunning = true
        notePopupViewTitle.text = notePopupItemArray[0].a
        notePopupViewDescriptionLabel.text = notePopupItemArray[0].b

        UIView.animate(withDuration: 0.7, delay: 1, usingSpringWithDamping: 4, initialSpringVelocity: 5, options: .curveEaseInOut) {
    
            self.notePopupView.transform = CGAffineTransform(translationX: 0, y: 200)
        } completion: { (Bool) in
            UIView.animate(withDuration: 0.7, delay: 2, options: .allowAnimatedContent) {
                self.notePopupView.transform = CGAffineTransform.identity
               
            } completion: { (Bool) in
                self.notePopupItemArray.remove(at: 0)
                if self.notePopupItemArray.count != 0 {
                    self.notePopupAnimation()
                } else {
                    isNotePopupAnimationRunning = false
                }
            }
        }
    }
    
    @IBAction func unwindToMainGame(_ unwindSegue: UIStoryboardSegue) {
        _ = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
    @objc func instantChatUpdate(_ gesture : UITapGestureRecognizer)
    {
        chatUpdate()
    }
}



func popupViewDesign(popupView: UIView) {

    popupView.layer.cornerRadius = 4

    popupView.layer.borderWidth = 1.3

    popupView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
}


extension mainGameViewController : arDelegate {
    func goToAR(arid: ARID) {
        print("buttonClicked")

        let dataToSend: ARID
        dataToSend = arid
        performSegue(withIdentifier: "goToARView", sender: dataToSend)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToARView" {
            let destination = segue.destination as! MaingameARViewController
            if let arContent = sender as? ARID {
                destination.recievedAR = arContent
            }
        }
        else if segue.identifier == "NoteUserVC" || segue.identifier == "NoteHwiryeongVC" || segue.identifier == "NoteGameCharacterVC"{
            if segue.identifier == "NoteUserVC"{
                let destintation = segue.destination as! NoteUserViewController
                if let targetCharacter = sender as? GameCharacter{
                    destintation.recievedGameCharacter = targetCharacter
                }
            }
            else if segue.identifier == "NoteHwiryeongVC"{
                let destintation = segue.destination as! NoteHeeryeongViewController
                if let targetCharacter = sender as? GameCharacter{
                    destintation.recievedGameCharacter = targetCharacter
                }
            }
            else if segue.identifier == "NoteGameCharacterVC"{
                let destintation = segue.destination as! NoteGameCharacterViewController
                if let targetCharacter = sender as? GameCharacter{
                    destintation.recievedGameCharacter = targetCharacter
                }
            }
        }
    }
}

extension mainGameViewController : ProfileImageDelegate{
    func profileImageTapped(inputCharacter: GameCharacter) {
        if inputCharacter.name == "이단희" || inputCharacter.name == "휘령"{
            if inputCharacter.name == "이단희" {
                performSegue(withIdentifier: "NoteUserVC", sender: inputCharacter)
            }
            else{
                if !inputCharacter.isLocked{
                    performSegue(withIdentifier: "NoteHwiryeongVC", sender: inputCharacter)
                }
            }
        }
        else{
            if inputCharacter.description != "" && !inputCharacter.isLocked{
                performSegue(withIdentifier: "NoteGameCharacterVC", sender: inputCharacter)
            }
        }
    }
}

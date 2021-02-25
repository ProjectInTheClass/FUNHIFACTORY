//
//  mainGameViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import UIKit
import AVFoundation
import AudioToolbox

class mainGameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    //Outlet
    
    var alertTimer = Timer()
    var isStartOfEpisode: Bool = false
    var indexOfCellBeforeDragging = 0
    
    @IBOutlet var normalChoiceCollectionViewLayout: UICollectionViewFlowLayout!
    @IBOutlet var godChatCollectionViewLayout: UICollectionViewFlowLayout!
    @IBOutlet var godChatChoiceHeight: NSLayoutConstraint!
    @IBOutlet var godChatChoiceBar: UIView!
    @IBOutlet var godChatTableView: UITableView!
    @IBOutlet var godChatPageControl: UIPageControl!
    @IBOutlet var godChatCollectionView: UICollectionView!
    @IBOutlet var godChat: UIView!
    @IBOutlet var currentYear: UILabel!
    @IBOutlet var wholeView: UIView!
    @IBOutlet var choiceHeight: NSLayoutConstraint!
    @IBOutlet var mainGameTableView: UITableView!
    @IBOutlet var choiceBar: UIView!
    @IBOutlet var map: UIView!
    @IBOutlet var topBar: UIView!
    @IBOutlet var notePopupView: UIView!
    @IBOutlet weak var notePopupViewTitle: UILabel!
    @IBOutlet weak var notePopupViewDescriptionLabel: UILabel!
    @IBOutlet var pauseBar: UIView!
    @IBOutlet var blackView: UIView!
    @IBOutlet var collectionBar: UIView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var chatToGodView: UIView!
    @IBOutlet var chatToGodViewTopbar: UIView!
    @IBOutlet var choiceCollectionView: UICollectionView!
    @IBOutlet var myChoiceText: UILabel!
    @IBAction func notePopupViewXButton(_ sender: Any) {
        popupOpen = false
        globalPopupOpen = false
    }
    //노트 팝업 켜고 꺼질 때 애니메이션 담당하는 변수
    var popupOpen: Bool = false {
        didSet {
            //팝업 켜질 때
            if popupOpen {
                UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 4, initialSpringVelocity: 5, options: .curveEaseInOut) {
                  
                    self.notePopupView.transform = CGAffineTransform(translationX: 0, y: 200)
                }
            //팝업 꺼질 때
            } else {
                UIView.animate(withDuration: 0.15) {
                    self.notePopupView.transform = CGAffineTransform.identity
                } completion: { (Bool) in
                   
                }
            }
        }
    }

    var animator : UIViewPropertyAnimator?

    //스토리 테이블 뷰
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == mainGameTableView{
            return player.currentChatArray.count
        }else if tableView == godChatTableView{
            return player.currentGodChatArray.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == mainGameTableView{
            let chatText = player.currentChatArray[indexPath.row].text
            //텍스트 채팅이 나올 때
                //자신이 보냈을 때
            if player.currentChatArray[indexPath.row].type == .onlyText && player.currentChatArray[indexPath.row].who.info().name == "이단희"{
                print("메인게임 - 자신 텍스트 출력")
                        let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! myTextTableViewCell
                cell.myTextCellUpdate(name: player.currentChatArray[indexPath.row].who.info().name, chat: chatText, profile: player.currentChatArray[indexPath.row].characterFace)
                        return cell
                    }
                //상대가 보냈을 때
                    else if player.currentChatArray[indexPath.row].type == .onlyText {
                        print("메인게임 - 상대 텍스트 출력")
                        let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "opTextCell", for: indexPath) as! opTextTableViewCell
                        cell.opTextCellUpdate(name: player.currentChatArray[indexPath.row].who.info().name, chat: chatText,normalProfile: player.currentChatArray[indexPath.row].who.info().profileImage, mainProfile: player.currentChatArray[indexPath.row].characterFace, isLocked: player.currentChatArray[indexPath.row].who.info().isLocked, profileBackGroundColor: player.currentChatArray[indexPath.row].who.info().profileBackgroundColor)
                        return cell
                    }
                //터치할 수 없는 이미지
                else if player.currentChatArray[indexPath.row].type == .untouchableImage {
                    print("메인게임 - 이미지 출력")
                    let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell

                    cell.imageUpdate(mainImage: player.currentChatArray[indexPath.row].image)
                    return cell
                    }
                //행동 표시글 셀
                else if player.currentChatArray[indexPath.row].type == .sectionHeader{
                    print("메인게임 - 섹션헤더 출력")
                    let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! sectionTableViewCell
                    cell.sectionUpdate(text:chatText)
                    return cell
                }
                else if player.currentChatArray[indexPath.row].type == .monologue{
                    print("메인게임 - 속마음 채팅 출력")
                    let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "monologue", for: indexPath) as! monologueTableViewCell
                    cell.monologueText.text = chatText
                    cell.chatUpdate(nickname: player.currentChatArray[indexPath.row].who.info().name, profile: player.currentChatArray[indexPath.row].characterFace)
                    return cell
                }else if player.currentChatArray[indexPath.row].type == .ar{
                    let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "arTableViewCell", for: indexPath) as! ARTableViewCell
                    cell.delegate = self
                    return cell
                }
                else {
                   print("메인게임 - 오류 발생1")
                    return UITableViewCell()
                }
        }else if tableView == godChatTableView{
            let chatText = player.currentGodChatArray[indexPath.row].text
            if player.currentGodChatArray[indexPath.row].type == .onlyText && player.currentGodChatArray[indexPath.row].who.info().name == "이단희"{
                print("신 - 자신 텍스트 출력")
                        let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! myTextTableViewCell
                cell.myTextCellUpdate(name: player.currentGodChatArray[indexPath.row].who.info().name, chat: chatText, profile: player.currentGodChatArray[indexPath.row].characterFace)
                        return cell
                    }
                    else if player.currentGodChatArray[indexPath.row].type == .onlyText {
                        print("신 - 상대 텍스트 출력")
                        let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "opTextCell", for: indexPath) as! opTextTableViewCell
                        cell.opTextCellUpdate(name: player.currentGodChatArray[indexPath.row].who.info().name, chat: chatText,normalProfile: player.currentGodChatArray[indexPath.row].who.info().profileImage, mainProfile: player.currentGodChatArray[indexPath.row].characterFace, isLocked: player.currentGodChatArray[indexPath.row].who.info().isLocked, profileBackGroundColor: player.currentGodChatArray[indexPath.row].who.info().profileBackgroundColor)
                        return cell
                    }
                //터치할 수 없는 이미지
                else if player.currentGodChatArray[indexPath.row].type == .untouchableImage {
                    print("신 - 이미지 출력")
                    let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell

                    cell.imageUpdate(mainImage: player.currentGodChatArray[indexPath.row].image)
                    return cell
                    }
                //행동 표시글 셀
                else if player.currentGodChatArray[indexPath.row].type == .sectionHeader{
                    print("신 - 섹션헤더 출력")
                    let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! sectionTableViewCell
                    cell.sectionUpdate(text:chatText)
                    return cell
                }
                else if player.currentGodChatArray[indexPath.row].type == .monologue{
                    print("신 - 속마음 채팅 출력")
                    let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "monologue", for: indexPath) as! monologueTableViewCell
                    cell.monologueText.text = chatText
                    cell.chatUpdate(nickname: player.currentGodChatArray[indexPath.row].who.info().name, profile: player.currentGodChatArray[indexPath.row].characterFace)
                    return cell
                }else {
                   print("신 - 오류 발생2")
                    return UITableViewCell()
                }
        } else {
            print("테이블뷰 - 오류 발생3")
            return UITableViewCell()
        }
    }
    
    //선택지 collectionView
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            dummyData.stories[player.dayId]!.storyBlocks[player.currentChatId]!.choices.count
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if collectionView == godChatCollectionView{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "godChatChoiceCell", for: indexPath) as! godChatCollectionViewCell
                cell.choiceUpdate(choiceText : dummyData.stories[player.dayId]!.storyBlocks[player.currentChatId]!.choices[indexPath.row].text)
                godChatPageControl.numberOfPages = dummyData.stories[player.dayId]!.storyBlocks[player.currentChatId]!.choices.count
                return cell
            }else if collectionView == choiceCollectionView{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "choiceCell", for: indexPath) as! choiceCollectionViewCell
                cell.choiceUpdate(choiceText : dummyData.stories[player.dayId]!.storyBlocks[player.currentChatId]!.choices[indexPath.row].text)
                pageControl.numberOfPages = dummyData.stories[player.dayId]!.storyBlocks[player.currentChatId]!.choices.count
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
            pageControl.currentPageIndicatorTintColor = UIColor.black
        }

    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
            if collectionView == choiceCollectionView{
                player.currentChatArray.append(Chat(text: currentBlockOfDay().choices[indexPath.row].text, image: "", type: currentBlockOfDay().choices[indexPath.row].chatType, who: .danhee, characterFace: currentBlockOfDay().choices[indexPath.row].characterFace, achievementToUnlock: currentBlockOfDay().choices[indexPath.row].achievementToUnlock, infomationToUnlock: currentBlockOfDay().choices[indexPath.row].infomationToUnlock, gameCharacterToUnlock: currentBlockOfDay().choices[indexPath.row].gameCharacterToUnlock, caseToUnlock: currentBlockOfDay().choices[indexPath.row].caseToUnlock, albumImageToUnlock: currentBlockOfDay().choices[indexPath.row].albumImageToUnlock))
                mainGameTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)
            }else if collectionView == godChatCollectionView{
                player.currentGodChatArray.append(Chat(text: currentBlockOfDay().choices[indexPath.row].text, image: "", type: currentBlockOfDay().choices[indexPath.row].chatType, who: .danhee, characterFace: currentBlockOfDay().choices[indexPath.row].characterFace, achievementToUnlock: currentBlockOfDay().choices[indexPath.row].achievementToUnlock, infomationToUnlock: currentBlockOfDay().choices[indexPath.row].infomationToUnlock, gameCharacterToUnlock: currentBlockOfDay().choices[indexPath.row].gameCharacterToUnlock, caseToUnlock: currentBlockOfDay().choices[indexPath.row].caseToUnlock, albumImageToUnlock: currentBlockOfDay().choices[indexPath.row].albumImageToUnlock))
                godChatTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)
            }
            
            print("현재 ChatId : \(player.currentChatId), 선택한 선택지 : \(currentBlockOfDay().choices[indexPath.row])")
            checkAlbumImageInChoice(choiceIndex: indexPath.row)
            checkLikability(choiceNumber: indexPath.row)

            checkCaseInChoice(choiceIndex: indexPath.row)
            checkAchievementInChoice(choiceIndex: indexPath.row)
            checkGameCharacterInChoice(choiceIndex: indexPath.row)
            checkgameCharacterInfomationInChoice(choiceIndex: indexPath.row)

            player.currentChatId = currentBlockOfDay().choices[indexPath.row].nextTextIndex
            
            scrollToBottom(input: 0)
            scrollToBottom(input: 1)
            player.indexNumber = 0
            closeChoiceBar()
            //다음 페이지가 신 채팅일 경우, 타이머를 멈추고, 신 채팅을 들어갈 수 있도록 해야할 듯.
            //다음 페이지가 신 채팅일 경우
            if dummyData.stories[player.dayId]?.storyBlocks[currentBlockOfDay().choices[indexPath.row].nextTextIndex]?.isGodChat == .on{
                //진동 울리기 및 색 변경이나 알림(아이템 뱃지와 같은) 등이 떠야 함.
                if timer != nil{
                    timer.invalidate()
                }
                vibrate(vibrateIsOn: playerSetting.vibration)
                alertTargetView(targetView: chatToGodView, timeInterval: 0.7, firstColor: UIColor.black, secondColor: UIColor(red: 0.792, green: 0.086, blue: 0.043, alpha: 1))
            }
            //다음 페이지가 신 채팅이 아닐 경우
            else{
                chatUpdateTimer()
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainGameTableView.delegate = self
        self.mainGameTableView.dataSource = self
        self.choiceCollectionView.delegate = self
        self.choiceCollectionView.dataSource = self
        self.godChatTableView.dataSource = self
        self.godChatCollectionView.dataSource = self
        self.godChatTableView.delegate = self
        self.godChatCollectionView.delegate = self
        self.transitioningDelegate = self
        godChatChoiceHeight.constant = 0
        godChatChoiceBar.isHidden = true
        godChatChoiceBar.setNeedsUpdateConstraints()
        godChatTableView.layoutIfNeeded()
        chatToGodViewTopbar.layer.cornerRadius = 10
        chatToGodViewTopbar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMinYCorner]
        //initialize()
        if let page = dummyData.stories[player.dayId]!.storyBlocks[player.currentChatId]?.choices.count{
            initializePageControl(collectionView : choiceCollectionView, choiceBar : choiceBar, numberOfPages:page)
            initializePageControl(collectionView: godChatCollectionView, choiceBar: godChatChoiceBar, numberOfPages: page)
        }
        self.mainGameTableView.contentInset.bottom = 82
        self.godChatTableView.contentInset.bottom = 82
        choiceCollectionViewBorder(choiceView: collectionBar)
        chatToGodUIUpdate(hwiryeong: chatToGodView)
        map.layer.borderColor = UIColor.white.cgColor
        //지우지 말아주세요
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
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        if isChoiceOn == false && timer == nil{
            guard pauseBar.isHidden == true else {return}
            print("퍼즈바 :\(pauseBar.isHidden), 초이스 :\(isChoiceOn), 타이머 :\(timer==nil)")
            chatUpdateTimer()
            closeChoiceBar()
            audioConfigure(bgmName: "mainGameBGM", isBGM: true, ofType: "mp3")
        } else {
            print("퍼즈바 :\(pauseBar.isHidden), 초이스 :\(isChoiceOn), 타이머 :\(timer==nil)")
            audioConfigure(bgmName: "mainGameBGM", isBGM: true, ofType: "mp3")
          return
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if isStartOfEpisode {
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
        currentYear.text = "\(dummyData.stories[player.dayId]!.episodeYear)년"
    }
    override func viewWillDisappear(_ animated: Bool) {
        if timer != nil {
            timer!.invalidate()
            timer = nil
          }
    }
    //가장 밑으로 스크롤해주는 함수
    func scrollToBottom(input:Int){
        
        
        DispatchQueue.main.async {
            if input==0{
                guard player.currentChatArray.count != 0 else {return}
                //메인 게임 테이블뷰 전용
                let indexPath = IndexPath(row: player.currentChatArray.count-1, section: 0)
                self.mainGameTableView.scrollToRow(at: indexPath, at: .bottom, animated: false) //true로 바꾸면 좀 더 천천히 내려가긴 하는데, 못 따라오는 경우도 있다.
            }else if input==1{
                //휘령 채팅 테이블뷰 전용
                guard player.currentGodChatArray.count != 0 else {return}
                let indexPath = IndexPath(row: player.currentGodChatArray.count-1, section: 0)
                self.godChatTableView.scrollToRow(at: indexPath, at: .bottom, animated: false) //true로 바꾸면 좀 더 천천히 내려가긴 하는데, 못 따라오는 경우도 있다.
            }else{
                print("ScrollToBottom에 잘못된 값이 들어갔음.")
            }
        }
    }
    
    @IBAction func settingTapped(_ sender: Any) {
        let setting = storyboard?.instantiateViewController(identifier: "setting")
        setting?.modalPresentationStyle = .fullScreen
        setting?.modalTransitionStyle = .crossDissolve
        present(setting!, animated: true, completion: nil)
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    @IBAction func mapOpen(_ sender: Any) {
        if timer != nil{
            timer.invalidate()
        }
        blackView.bounds = self.view.bounds
        blackView.center = self.view.center
        self.view.addSubview(blackView)
        blackView.alpha = 1
        UIView.animate(withDuration: 0.2) {
            self.blackView.alpha = 0.7
        }
        wholeView.addSubview(map)
        map.transform = CGAffineTransform(scaleX: 0, y: 0)
        map.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 77).isActive = true
        map.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        //map.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        //map.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, options: [], animations: {
                                                                    let scaleDown = CGAffineTransform(scaleX: 1, y: 1)
                                                                    self.map.transform = scaleDown})
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    @IBAction func closeMap(_ sender: Any) {
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, options: [], animations: {
            self.map.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.blackView.alpha = 0
        }, completion: {_ in
            self.map.removeFromSuperview()
            self.blackView.removeFromSuperview()
            if isChoiceOn == false && timer == nil{
                guard self.pauseBar.isHidden == true else {return}
                self.chatUpdateTimer()
            }
        })
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    @IBAction func pauseTapped(_ sender: Any) {
        pauseBar.isHidden = false
        if timer != nil{
            timer.invalidate()
        }
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    @IBAction func resumeTapped(_ sender: Any) {
        pauseBar.isHidden = true
        if timer == nil {
            chatUpdateTimer()
        }
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    @IBAction func chatWithGod(_ sender: Any) {
        isGodChatOn = true
        alertTimer.invalidate()
        chatToGodView.backgroundColor = UIColor.black
        if timer != nil{
            timer.invalidate()
        }
        blackView.bounds = self.view.bounds
        blackView.center = self.view.center
        self.view.addSubview(blackView)
        blackView.alpha = 1
        UIView.animate(withDuration: 0.2) {
            self.blackView.alpha = 0.7
        }
        wholeView.addSubview(godChat)
        godChat.transform = CGAffineTransform(scaleX: 0, y: 0)
        godChat.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        godChat.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, options: [], animations: {
                                                                    let scaleDown = CGAffineTransform(scaleX: 1, y: 1)
                                                                    self.godChat.transform = scaleDown})
        chatUpdateTimer()
    }
    @IBAction func closeGodChat(_ sender: Any) {
        isGodChatOn = false
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, options: [], animations: {
            self.godChat.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.blackView.alpha = 0
        }, completion: {_ in
            self.godChat.removeFromSuperview()
            self.chatUpdateTimer()
            self.blackView.removeFromSuperview()
        })
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
    func godChatButtonFirstAppear(){
        
    }
}


func popupViewDesign(popupView: UIView) {

    popupView.layer.cornerRadius = 4

    popupView.layer.borderWidth = 1.3

    popupView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
}

extension mainGameViewController : arDelegate{
    func goToAR() {
        print("buttonClicked")
        performSegue(withIdentifier: "goToARView", sender: nil)
    }
}

extension mainGameViewController : UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController)-> UIViewControllerAnimatedTransitioning?{
        return AnimationController(animationDuration: 3.5, animationType: .present)
    }
}

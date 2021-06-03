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
    @IBOutlet var choiceCollectionView: UICollectionView!
    @IBOutlet var myChoiceText: UILabel!
    @IBAction func notePopupViewXButton(_ sender: Any) {
       
        globalPopupOpen = false
    }
    
    @IBOutlet var floatingButtons: [UIView]!
    
    
    
    
//    //노트 팝업 켜고 꺼질 때 애니메이션 담당하는 변수
//    var popupOpen: Bool = false {
//        didSet {
//            //팝업 켜질 때
//            if popupOpen {
//                UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 4, initialSpringVelocity: 5, options: .curveEaseInOut) {
//
//                    self.notePopupView.transform = CGAffineTransform(translationX: 0, y: 200)
//                }
//            //팝업 꺼질 때
//            } else {
//                UIView.animate(withDuration: 0.15) {
//                    self.notePopupView.transform = CGAffineTransform.identity
//                } completion: { (Bool) in
//
//                }
//            }
//        }
//    }

    var animator : UIViewPropertyAnimator?

    //스토리 테이블 뷰
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        player.currentChatArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let chatText = player.currentChatArray[indexPath.row].text
            //텍스트 채팅이 나올 때
                //자신이 보냈을 때
            if player.currentChatArray[indexPath.row].type == .onlyText && player.currentChatArray[indexPath.row].who.info().name == "이단희"{
                print("메인게임 - 자신 텍스트 출력")
                        let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! myTextTableViewCell
                cell.myTextCellUpdate(name: player.currentChatArray[indexPath.row].who.info().name, chat: chatText, profile: player.currentChatArray[indexPath.row].characterFace)
                cell.profileNickname.textColor = .white
                        return cell
                    }
                //상대가 보냈을 때
                    else if player.currentChatArray[indexPath.row].type == .onlyText {
                        print("메인게임 - 상대 텍스트 출력")
                        let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "opTextCell", for: indexPath) as! opTextTableViewCell
                        cell.profileNickname.textColor = .white
                        cell.opTextCellUpdate(name: player.currentChatArray[indexPath.row].who.info().name, chat: chatText,normalProfile: player.currentChatArray[indexPath.row].who.info().profileImage, mainProfile: player.currentChatArray[indexPath.row].characterFace, isLocked: player.currentChatArray[indexPath.row].who.info().isLocked)
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
                    cell.name.textColor = .white
                    cell.chatUpdate(nickname: player.currentChatArray[indexPath.row].who.info().name, profile: player.currentChatArray[indexPath.row].characterFace)
                    return cell
                }
                else if player.currentChatArray[indexPath.row].type == .ar{
                     let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "arTableViewCell", for: indexPath) as! ARTableViewCell
                    cell.delegate = self
                    return cell
                }
                else {
                   print("메인게임 - 오류 발생1")
                    return UITableViewCell()
                }
    }
    
    //선택지 collectionView
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            dummyData.stories[player.dayId]!.storyBlocks[player.currentChatId]!.choices.count
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if collectionView == choiceCollectionView{
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
            pageControl.currentPageIndicatorTintColor = UIColor.white
        }

    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
            
                player.currentChatArray.append(Chat(text: currentBlockOfDay().choices[indexPath.row].text, image: "", type: currentBlockOfDay().choices[indexPath.row].chatType, who: .danhee, characterFace: currentBlockOfDay().choices[indexPath.row].characterFace, optionalOption: currentBlockOfDay().choices[indexPath.row].optionalOption, animationOption: .none))

                mainGameTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)
            print("현재 ChatId : \(player.currentChatId), 선택한 선택지 : \(currentBlockOfDay().choices[indexPath.row])")
            checkAlbumImageInChoice(choiceIndex: indexPath.row)

            checkCaseInChoice(choiceIndex: indexPath.row)
            checkAchievementInChoice(choiceIndex: indexPath.row)
            checkGameCharacterInChoice(choiceIndex: indexPath.row)
            checkgameCharacterInfomationInChoice(choiceIndex: indexPath.row)

            player.currentChatId = currentBlockOfDay().choices[indexPath.row].nextTextIndex
            
            scrollToBottom()
            player.indexNumber = 0
            closeChoiceBar()
            //다음 페이지가 신 채팅일 경우
            if isGodChatOn == false && dummyData.stories[player.dayId]?.storyBlocks[currentBlockOfDay().choices[indexPath.row].nextTextIndex]?.isGodChat == .on
            {
                //진동 울리기 및 색 변경이나 알림(아이템 뱃지와 같은) 등이 떠야 함.
//                if timer != nil{
//                    timer.invalidate()
//                }
//                vibrate(vibrateIsOn: playerSetting.vibration)
                chatUpdateTimer()
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
        mainGameDesign()
        //initialize()
        if let page = dummyData.stories[player.dayId]!.storyBlocks[player.currentChatId]?.choices.count{
            initializePageControl(collectionView : choiceCollectionView, choiceBar : choiceBar, numberOfPages:page)
        }
        self.mainGameTableView.contentInset.bottom = 82
        choiceCollectionViewBorder(choiceView: collectionBar)
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
    func scrollToBottom(){
        guard player.currentChatArray.count != 0 else {return}
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
        if timer != nil{
            print("map : timer invalidate")
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
        map.center = self.view.center
        map.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        map.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
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
            print("퍼즈바 :\(self.pauseBar.isHidden), 초이스 :\(isChoiceOn), 타이머 :\(timer==nil)")
            self.map.removeFromSuperview()
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
    func mainGameDesign() {
        for button in floatingButtons {
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor(red: 0.524, green: 0.646, blue: 0.75, alpha: 1).cgColor
            button.layer.backgroundColor = UIColor(red: 0.743, green: 0.817, blue: 0.879, alpha: 1).cgColor
            myChoiceText.font = UIFont(name: "NanumSquareEB", size: 16)
        }
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

        UIView.animate(withDuration: 0.2, delay: 1, usingSpringWithDamping: 4, initialSpringVelocity: 5, options: .curveEaseInOut) {
    
            self.notePopupView.transform = CGAffineTransform(translationX: 0, y: 200)
        } completion: { (Bool) in
            UIView.animate(withDuration: 0.2, delay: 1, options: .allowAnimatedContent) {
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

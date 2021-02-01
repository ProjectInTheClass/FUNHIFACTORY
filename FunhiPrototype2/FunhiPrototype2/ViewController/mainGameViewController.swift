//
//  mainGameViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import UIKit
import AVFoundation

class mainGameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    //Outlet
    
    var isStartOfEpisode: Bool = false
    var isChoiceOn = false
    
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
                    // 여기서 translationX는 애니메이션 이전의 팝업창 x값 그대로 유지하는 거임. 그냥 위에서 똑바로 아래로 내려오게. 가로로 팝업 하나도 안 움직이고. 그 값 표현 방식이 좀 많이 지저분한데 깔끄미 방법 찾아야 함.
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
        player.currentChatArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatText = player.currentChatArray[indexPath.row].text
        print("cellForRowAt")
        //텍스트 채팅이 나올 때
            //자신이 보냈을 때
        if player.currentChatArray[indexPath.row].type == .onlyText && player.currentChatArray[indexPath.row].who.info().name == "이단희"{
            print("자신 텍스트 출력")
                    let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! myTextTableViewCell
            cell.myTextCellUpdate(name: player.currentChatArray[indexPath.row].who.info().name, chat: chatText, profile: player.currentChatArray[indexPath.row].characterFace)
                    return cell
                }
            //상대가 보냈을 때
                else if player.currentChatArray[indexPath.row].type == .onlyText {
                    print("상대 텍스트 출력")
                    let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "opTextCell", for: indexPath) as! opTextTableViewCell
                    cell.opTextCellUpdate(name: player.currentChatArray[indexPath.row].who.info().name, chat: chatText,normalProfile: player.currentChatArray[indexPath.row].who.info().profileImage, mainProfile: player.currentChatArray[indexPath.row].characterFace, isLocked: player.currentChatArray[indexPath.row].who.info().isLocked, profileBackGroundColor: player.currentChatArray[indexPath.row].who.info().profileBackgroundColor)
                    return cell
                }
            //터치할 수 없는 이미지
            else if player.currentChatArray[indexPath.row].type == .untouchableImage {
                print("이미지 출력")
                let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell

                cell.imageUpdate(mainImage: player.currentChatArray[indexPath.row].image)
                return cell
                }
            //행동 표시글 셀
            else if player.currentChatArray[indexPath.row].type == .sectionHeader{
                print("섹션헤더 출력")
                let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! sectionTableViewCell
                cell.sectionUpdate(text:chatText)
                return cell
            }
            else if player.currentChatArray[indexPath.row].type == .monologue{
                print("속마음 채팅 출력")
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
                print("그 외")
                let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! myTextTableViewCell
                cell.myTextCellUpdate(name: player.currentChatArray[indexPath.row].who.info().name, chat: chatText, profile: player.currentChatArray[indexPath.row].characterFace)
                return cell
            }
    }
    
    //선택지 collectionView
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            dummyData.stories[player.dayId]!.storyBlocks[player.currentChatId]!.choices.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "choiceCell", for: indexPath) as! choiceCollectionViewCell
            cell.choiceUpdate(choiceText : dummyData.stories[player.dayId]!.storyBlocks[player.currentChatId]!.choices[indexPath.row].text)
            pageControl.numberOfPages = dummyData.stories[player.dayId]!.storyBlocks[player.currentChatId]!.choices.count
            return cell
        }
        func initializePageControl(collectionView : UICollectionView, choiceBar : UIView, numberOfPages: Int){
            //
            collectionView.isPagingEnabled = true
            pageControl.numberOfPages = numberOfPages
            pageControl.hidesForSinglePage = true
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            scrollViewDidEndDecelerating(collectionView)
            //collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            pageControl.currentPageIndicatorTintColor = UIColor.black
        }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if fmod(scrollView.contentOffset.x, scrollView.frame.maxX) == 0 {
            pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX) } }

    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
            player.currentChatArray.append(Chat(text: currentBlockOfDay().choices[indexPath.row].text, image: "", type: currentBlockOfDay().choices[indexPath.row].chatType, who: .danhee, characterFace: currentBlockOfDay().choices[indexPath.row].characterFace, achievementToUnlock: currentBlockOfDay().choices[indexPath.row].achievementToUnlock, infomationToUnlock: currentBlockOfDay().choices[indexPath.row].infomationToUnlock, gameCharacterToUnlock: currentBlockOfDay().choices[indexPath.row].gameCharacterToUnlock, caseToUnlock: currentBlockOfDay().choices[indexPath.row].caseToUnlock, albumImageToUnlock: currentBlockOfDay().choices[indexPath.row].albumImageToUnlock))
            print("현재 ChatId : \(player.currentChatId), 선택한 선택지 : \(currentBlockOfDay().choices[indexPath.row])")
            checkAlbumImageInChoice(choiceIndex: indexPath.row)
            checkLikability(choiceNumber: indexPath.row)
            
            checkCaseInChoice(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel, choiceIndex: indexPath.row)
            checkAchievementInChoice(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel, choiceIndex: indexPath.row)
            checkGameCharacterInChoice(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel, choiceIndex: indexPath.row)
            checkgameCharacterInfomationInChoice(popupView: notePopupViewDescriptionLabel, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel, choiceIndex: indexPath.row)
            
            player.currentChatId = currentBlockOfDay().choices[indexPath.row].nextTextIndex
            mainGameTableView.insertRows(at: [IndexPath(row: player.currentChatArray.count-1, section: 0)], with: .none)
            scrollToBottom()
            player.indexNumber = 0
            closeChoiceBar()
            chatUpdateTimer()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainGameTableView.delegate = self
        self.mainGameTableView.dataSource = self
        self.choiceCollectionView.delegate = self
        self.choiceCollectionView.dataSource = self
        self.transitioningDelegate = self
        if let page = dummyData.stories[player.dayId]!.storyBlocks[player.currentChatId]?.choices.count{
            initializePageControl(collectionView : choiceCollectionView, choiceBar : choiceBar, numberOfPages:page)
        }
        self.mainGameTableView.contentInset.bottom = 82
        choiceCollectionViewBorder(choiceView: collectionBar)
        chatToGodUIUpdate(hwiryeong: chatToGodView)
        
        //지우지 말아주세dyd
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
    
  
    
    
    override func viewDidAppear(_ animated: Bool) {
        if (pauseBar.isHidden == true || isChoiceOn == false) && timer == nil{
            chatUpdateTimer()
            closeChoiceBar()
            audioConfigure(bgmName: "mainGameBGM", isBGM: true, ofType: "mp3")
        } else {
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
        timer.invalidate()
    }
    //가장 밑으로 스크롤해주는 함수
    func scrollToBottom(){
        guard player.currentChatArray.count != 0 else {return}
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: player.currentChatArray.count-1, section: 0)
            self.mainGameTableView.scrollToRow(at: indexPath, at: .bottom, animated: false) //true로 바꾸면 좀 더 천천히 내려가긴 하는데, 못 따라오는 경우도 있다.
        }
    }
  
    
    @IBAction func settingTapped(_ sender: Any) {
        let setting = storyboard?.instantiateViewController(identifier: "setting")
        setting?.modalPresentationStyle = .fullScreen
        setting?.modalTransitionStyle = .coverVertical
        present(setting!, animated: true, completion: nil)
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    @IBAction func mapOpen(_ sender: Any) {
            timer.invalidate()
            self.view.addSubview(map)
            //30, 20, 20, 67
            map.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 74).isActive = true
            map.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    @IBAction func closeMap(_ sender: Any) {
        map.removeFromSuperview()
        chatUpdateTimer()
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    @IBAction func pauseTapped(_ sender: Any) {
        pauseBar.isHidden = false
        timer.invalidate()
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    @IBAction func resumeTapped(_ sender: Any) {
        pauseBar.isHidden = true
        chatUpdateTimer()
        audioConfigure(bgmName: "buttonTap", isBGM: false, ofType: "mp3")
    }
    @IBAction func chatWithGod(_ sender: Any) {
        timer.invalidate()
        let storyBoard = storyboard?.instantiateViewController(withIdentifier: "godChat")
        storyBoard?.modalPresentationStyle = .fullScreen
        present(storyBoard!, animated: false, completion: nil)
    }
    @IBAction func closeGodChat(_ sender: Any) {
        dismiss(animated: false, completion: nil)
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

//
//  mainGameViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import UIKit

class mainGameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    //Outlet
    
    var isStartOfEpisode: Bool = false
    
    @IBOutlet var wholeView: UIView!
    @IBOutlet var choiceHeight: NSLayoutConstraint!
    @IBOutlet var mainGameTableView: UITableView!
    @IBOutlet var godChat: UIView!
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
    
    @IBAction func notePopupViewXButton(_ sender: Any) {
        notePopupView.removeFromSuperview()
    }
    //선택지 콜렉션뷰의 페이지 개수 확인 동그라미
    
    var animator : UIViewPropertyAnimator?

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentChatArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatText = currentChatArray[indexPath.row].text
        print("cellForRowAt")
        //텍스트 채팅이 나올 때
            //자신이 보냈을 때

        if currentChatArray[indexPath.row].type == .onlyText && currentChatArray[indexPath.row].who.info().name == "이단희"{
            print("자신 텍스트 출력")
                    let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! myTextTableViewCell
            cell.myTextCellUpdate(name: currentChatArray[indexPath.row].who.info().name, chat: chatText, profile: currentChatArray[indexPath.row].who.info().profileImage)
                    return cell
                }
            //상대가 보냈을 때
                else if currentChatArray[indexPath.row].type == .onlyText {
                    print("상대 텍스트 출력")
                    let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "opTextCell", for: indexPath) as! opTextTableViewCell
                    cell.opTextCellUpdate(name: currentChatArray[indexPath.row].who.info().name, chat: chatText, profile: currentChatArray[indexPath.row].who.info().profileImage)
                    return cell
                }
            //터치할 수 없는 이미지
            else if currentChatArray[indexPath.row].type == .untouchableImage {
                print("이미지 출력")
                let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell

                cell.imageUpdate(mainImage: currentChatArray[indexPath.row].image)
                return cell
                }
            //행동 표시글 셀
            else if currentChatArray[indexPath.row].type == .sectionHeader{
                print("섹션헤더 출력")
                let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! sectionTableViewCell
                cell.sectionUpdate(text:chatText)
                return cell
            }else if currentChatArray[indexPath.row].type == .monologue{
                print("속마음 채팅 출력")
                let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "monologue", for: indexPath) as! monologueTableViewCell
                cell.monologueText.text = chatText
                return cell
            }
            else {
                print("그 외")
                let cell = mainGameTableView.dequeueReusableCell(withIdentifier: "myTextCell", for: indexPath) as! myTextTableViewCell
                cell.myTextCellUpdate(name: currentChatArray[indexPath.row].who.info().name, chat: chatText, profile: currentChatArray[indexPath.row].who.info().profileImage)
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
            return cell
        }
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
           guard let layout = choiceCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
           
           let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
           
           let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
           let index: Int
           if velocity.x > 0 {
               index = Int(ceil(estimatedIndex))
           } else if velocity.x < 0 {
               index = Int(floor(estimatedIndex))
           } else {
               index = Int(round(estimatedIndex))
           }
           
           targetContentOffset.pointee = CGPoint(x: CGFloat(index) * cellWidthIncludingSpacing, y: 0)
        
        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / cellWidthIncludingSpacing))
       }
        func initializePageControl(collectionView : UICollectionView, choiceBar : UIView, numberOfPages: Int){
            //
            collectionView.isPagingEnabled = false
            pageControl.numberOfPages = numberOfPages
            pageControl.hidesForSinglePage = true
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            //scrollViewDidEndDecelerating(collectionView)
            collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
            pageControl.currentPageIndicatorTintColor = UIColor.black
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            currentChatArray.append(Chat(text: currentBlockOfDay().choices[indexPath.row].text, image: "", type: .onlyText, who: .danhee, characterFace: true, achievementToUnlock: nil, infomationToUnlock: nil, gameCharacterToUnlock: nil, caseToUnlock: nil, albumImageToUnlock: nil))
            checkAlbumImageInChoice(choiceIndex: indexPath.row)
            checkCaseInChoice(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel, choiceIndex: indexPath.row)
            checkAchievementInChoice(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel, choiceIndex: indexPath.row)
            checkGameCharacterInChoice(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel, choiceIndex: indexPath.row)
            checkgameCharacterInfomationInChoice(popupView: notePopupViewDescriptionLabel, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel, choiceIndex: indexPath.row)
          
            
            player.currentChatId = currentBlockOfDay().choices[indexPath.row].nextTextIndex
            mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
            indexNumber = 0
            closeChoiceBar()
            scrollToBottom()
            chatUpdateTimer()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainGameTableView.delegate = self
        self.mainGameTableView.dataSource = self
        self.choiceCollectionView.delegate = self
        self.choiceCollectionView.dataSource = self
        initializePageControl(collectionView : choiceCollectionView, choiceBar : choiceBar, numberOfPages: dummyData.stories[player.dayId]!.storyBlocks[player.currentChatId]!.choices.count)
        choiceCollectionViewBorder(choiceView: collectionBar)
        
        //지우지 말아주세요 정체 모르는 코드 있으면 물어보기 꼭 먼저 하기 만약 에러 뜨면 ui.swift 추가되었나 확인하기. 계속 거기에 코드 보관하는 게 깔끔할 것 같아요
        maingameNotepopupViewDesign(popupView: notePopupView)
        /*
         loadJson(fromURLString: urlString) { (result) in
              switch result {
              case .success(let data):
                  parse(jsonData: data)
                 print(prologueChapter.storyBlocks)
              case .failure(let error):
                  print(error)
              }
          }
         */

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        chatUpdateTimer()
        choiceHeight.constant = 0
        choiceBar.setNeedsUpdateConstraints()
        choiceBar.isHidden = true
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
    }
    func chatUpdateTimer()
    {
        print("chatUpdateTimer 실행")
        timer = Timer.scheduledTimer(withTimeInterval: player.setting.textSpeed, repeats: true, block: {timer in
            self.chatUpdate()
            print(timer)
        })
        
    }
    func chatUpdate(){
        print("------------chatUpdate 시작합니다------------")
        print("현재 속도: \(player.setting.textSpeed)")
        if indexNumber < currentChatAmount(){
            print("채팅이 업데이트되었습니다.")
            currentChatArray.append(currentBlockOfDay().chats[indexNumber])
            self.mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)}
        else if indexNumber == currentChatAmount() && currentBlockOfDay().choices[0].nextTextIndex == "End"{
            guard timer != nil else {return}
            timer.invalidate()
        }
        if indexNumber == currentChatAmount() && currentBlockOfDay().choiceSkip == false{
            timer.invalidate()
            print("invalidate")
            guard currentChatArray.last?.type != .choice else {return}

            choiceUpdate()
            /*currentChatArray.append(Chat(text: "**선택지가 나올 자리**", image: "", type: .choice, who: danhee, characterFace: false))

            self.mainGameTableView.insertRows(at: [IndexPath(row: currentChatArray.count-1, section: 0)], with: .none)
            print("선택지 대용 엘리먼트 추가")
            scrollToBottom()*/
            return
        } else if indexNumber == currentChatAmount() && currentBlockOfDay().choiceSkip == true{
            player.currentChatId = currentBlockOfDay().choices[0].nextTextIndex
            indexNumber = 0
            chatUpdate()
            scrollToBottom()
            return
        }
        print("스토리 \(indexNumber+1)/\(currentChatAmount())")
        // 아래 네 개 각각 지금 챗에 새 업적/새 인물/새 역사 사건/새 인물 정보 있나 확인한 뒤 있는 경우 팝업창 띄우기/노트 정보 수정하는 코드입니다
        // 그 아래는 앨범 이미지 확인하는 함수예요
        checkAchievementInChat(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel)
        checkGameCharacterInChat(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel)
        checkCaseInChat(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel)
        checkgameCharacterInfomationInChat(popupView: notePopupView, backgroundView: self.view, titleLabel: notePopupViewTitle, descriptionLabel: notePopupViewDescriptionLabel)
        checkAlbumImageInChat()
        indexNumber += 1
        scrollToBottom()
    }
    //가장 밑으로 스크롤해주는 함수
    func scrollToBottom(){
        guard currentChatArray.count != 0 else {return}
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: currentChatArray.count-1, section: 0)
            self.mainGameTableView.scrollToRow(at: indexPath, at: .bottom, animated: false) //true로 바꾸면 좀 더 천천히 내려가긴 하는데, 못 따라오는 경우도 있다.
        }
    }
    
    func choiceUpdate(){
        choiceHeight.constant = 149
        choiceBar.setNeedsUpdateConstraints()
        choiceBar.isHidden = false
        choiceCollectionView.reloadData()
        
    }
    func closeChoiceBar(){
        choiceHeight.constant = 0
        choiceBar.isHidden = true
        choiceBar.setNeedsUpdateConstraints()
    }
    @IBAction func settingTapped(_ sender: Any) {
        timer.invalidate()
        let setting = storyboard?.instantiateViewController(identifier: "setting")
        setting?.modalPresentationStyle = .fullScreen
        present(setting!, animated: true, completion: nil)
    }
    @IBAction func mapOpen(_ sender: Any) {
            self.view.addSubview(map)
            //30, 20, 20, 67
            map.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 74).isActive = true
            map.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
    }
    @IBAction func closeMap(_ sender: Any) {
        map.removeFromSuperview()
    }
    @IBAction func pauseTapped(_ sender: Any) {
        pauseBar.isHidden = false
    }
    @IBAction func resumeTapped(_ sender: Any) {
        pauseBar.isHidden = true
    }
}


func popupViewDesign(popupView: UIView) {

    popupView.layer.cornerRadius = 4

    popupView.layer.borderWidth = 1.3

    popupView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
}


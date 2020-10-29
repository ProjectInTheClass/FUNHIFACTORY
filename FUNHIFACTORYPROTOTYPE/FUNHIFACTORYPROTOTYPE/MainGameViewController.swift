//
//  MainGameViewController.swift
//  FUNHIPROTOTYPE
//
//  Created by 최서연 on 2020/10/13.
//

import UIKit

class MainGameViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var rootView: UIView!
    @IBOutlet var annotationView: UIView!
    @IBOutlet weak var storyTableView: UITableView!
    @IBOutlet var noteStackView: UIStackView!
    @IBOutlet weak var choiceTableView: UITableView!
    @IBOutlet weak var endEpisodeButton: UIButton!
    @IBOutlet weak var choiceTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var mainGameTopBar: UIView!
    @IBOutlet weak var questPopUpView: UIView!
    @IBOutlet weak var warningPopUpView: UIView!
    @IBOutlet weak var topBarChapterName: UILabel!
    
    
    // 표지 띄우기 위한 것
    @IBOutlet weak var chapterCoverNumberLabel: UILabel!
    @IBOutlet weak var chapterCoverNameLabel: UILabel!
    @IBOutlet weak var chapterCoverIllustImage: UIImageView!
    @IBOutlet weak var chapterCoverChoice1Button: UIButton!
    @IBOutlet weak var chapterCoverChoice2Button: UIButton!
    @IBOutlet weak var chapterCoverStackView: UIStackView!
     @IBOutlet weak var chapterCoverFullButton: UIButton!
    @IBOutlet weak var chapterCoverChoiceStackView: UIStackView!
    
    //주석 관련 constraint
    @IBOutlet var rightAnnotation: NSLayoutConstraint!
    @IBOutlet var leftAnnotation: NSLayoutConstraint!
    @IBOutlet var topAnnotation: NSLayoutConstraint!
    @IBOutlet var bottomAnnotation: NSLayoutConstraint!
    
    // 페이드인/아웃 위한 까만 전체뷰
    @IBOutlet weak var faidBlackView: UIView!
    

    //메인 스토리 테이블뷰 어레이
    var labelArrayInTable : [String] = [""]
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
     }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var intToReturn : Int = 0
        if tableView == storyTableView {
            let story = labelArrayInTable.count
            intToReturn = story
        } else if tableView == choiceTableView{
            let currentChoice = santa.gameCharacter.currentPage().choice.count
            intToReturn = currentChoice
        }
        return intToReturn
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cellToReturn = UITableViewCell()
            if tableView == storyTableView{
                let storyCell = tableView.dequeueReusableCell(withIdentifier: "storyTableViewCell", for: indexPath) as! MainGameTableViewCell
                //let storyLine: String = labelArrayInTable[indexPath.row]
               
                let story = labelArrayInTable[0]
                
                storyCell.storyLableUpdate(text: story)
                storyCell.storyLabelSizeUpdate()
                storyCell.backgroundColor = .clear
                storyCell.selectionStyle = .none
                 cellToReturn = storyCell
                
            } else if tableView == choiceTableView{
                let list: Choice = santa.gameCharacter.currentPage().choice[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: "choiceTableViewCell") as! ChoiceTableViewCell
                // tableViewCell 투명화
                cell.choiceTableViewCellBorderView.layer.borderWidth = 1
                cell.choiceTableViewCellBorderView.layer.borderColor = CGColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
                cell.choiceTableViewCellLabel.text = list.choiceText
                
                cell.backgroundColor = .clear
                cellToReturn = cell
            }
            currentIndexPathRow = indexPath.row
            return cellToReturn
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if endingIS == "restartFromChapter" || endingIS == "restartFromBack" {
            
        
        
        //게임 오버뷰에서 넘어온 직후 : 화면은 미리 깔려 있어야 함, 그 위로 하얀 페이드 뷰 덮여져 있어야 함.
        //그 후 애니메이션 : 페이드 뷰 알파 -> 0, 끝난 후에는 페이드 뷰 히든 이용해서 숨기기
        self.faidBlackView.isHidden = false
        self.faidBlackView.alpha = 1
        self.faidBlackView.backgroundColor = .white
        
        // 부활 방법에 따른 화면 재조정 :
        if endingIS == "restartFromChapter" {
            santa.gameCharacter.currentEpPageIndex = 0
            santa.gameCharacter.currentEpisodeIndex = 0
            showChapterCover()
            self.choiceTableView.isHidden = true
            
            self.storyTableView.isHidden = true
         
        } else if endingIS == "restartFromBack" {
            self.choiceTableView.isHidden = false
           
            self.storyTableView.isHidden = false
           
//            santa.gameCharacter.currentEpPageIndex -= 1
        }
        
        self.updateMainGameUI()
        
        self.choiceTableView.reloadData()
        self.storyTableView.reloadData()
                //메인 스토리 뷰
        
                
                
        if endingIS ==  "restartFromChapter" {
            // 표지 뷰
            self.chapterCoverStackView.isHidden = false
            if santa.gameCharacter.currentChapterIndex==0  {
                self.chapterCoverChoiceStackView.isHidden = false
            } else {
                self.chapterCoverFullButton.isHidden = false
            }
        }
        // 애니메이션 직후 : 오버레이 히든 걸기
           
        endingIS = ""
        
        self.choiceTableViewHeight.constant = CGFloat(47*santa.gameCharacter.currentPage().choice.count)
        
        print("현재 페이지 : 챕터\(santa.gameCharacter.currentChapterIndex) 에피소드\(santa.gameCharacter.currentEpisodeIndex + 1) \(santa.gameCharacter.currentEpPageIndex)페이지(인스턴스 기준)")

        self.storyTableView.rowHeight = UITableView.automaticDimension
        self.storyTableView.estimatedRowHeight = 200
        
            
            UIView.animate(withDuration: 2.0) {
                self.faidBlackView.alpha = 0
            } completion: { (i) in
                self.faidBlackView.isHidden = true
            }
   
   
       
      
       
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.choiceTableView.dataSource = self
        self.choiceTableView.delegate = self
        self.storyTableView.dataSource = self
        self.storyTableView.delegate = self
        
        choiceTableView.separatorColor = UIColor(displayP3Red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
        choiceTableViewHeight.constant = CGFloat(47*santa.gameCharacter.currentPage().choice.count)
        topBarChapterName.text = "제\(santa.gameCharacter.currentChapterIndex)장 \(santa.gameCharacter.currentChapter().chapterName)"
        if santa.gameCharacter.currentPage().endEpisodePage == true {
            endEpisodeButton.isHidden = false
            choiceTableView.isHidden = true
        } else {
            endEpisodeButton.isHidden = true
            choiceTableView.isHidden = false
        }
        
        // tableView 투명화
        choiceTableView.backgroundColor = .clear
        storyTableView.backgroundColor = .clear
        questPopUpView.isHidden = true
        faidBlackView.isHidden = true
        warningPopUpView.isHidden = true
        showChapterCover()
        showChapterCoverOutlet()
        //빌드 중에 현재 페이지가 어떤 건지 파악 위한 거
        print("현재 페이지 : 챕터\(santa.gameCharacter.currentChapterIndex) 에피소드\(santa.gameCharacter.currentEpisodeIndex + 1) \(santa.gameCharacter.currentEpPageIndex)페이지(인스턴스 기준)")
        
        self.storyTableView.rowHeight = UITableView.automaticDimension
        self.storyTableView.estimatedRowHeight = 200
        
    }
    


func scrollToBottom(){
    DispatchQueue.main.async {
        let indexPath = IndexPath(row: self.labelArrayInTable.count-1, section: 0)
        self.storyTableView.scrollToRow(at: indexPath, at: .bottom, animated: false) //true로 바꾸면 좀 더 천천히 내려가긴 하는데, 못 따라오는 경우도 있다.
    }
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView == storyTableView{
        if isRunning == true{
            typeOn(exampleText: santa.gameCharacter.currentPage().storyText, indexPath: 0)
        } else if isRunning == false{
            if santa.gameCharacter.currentPage().annotation.count == 0 {
                return
            } else {
                popUpNotes(indexPath: indexPath.row)
            }
        }
    } else if tableView == choiceTableView{
        
        
        /*
        decideEnding(indexPathRow: indexPath.row)
        updatePage(indexPath: indexPath.row)
        updateStoryTableView()
        */
        
        //엔딩스코어 업뎃
        decideEnding(indexpathRow: indexPath.row)
        //다음 페이지로 넘기기
        /*updatePage(indexPath: indexPath.row)*/
        santa.gameCharacter.currentEpPageIndex = santa.gameCharacter.currentPage().choice[indexPath.row].nextPageIndex
        
        updateWarningInt()
        updateMainGameUI()
        typeOn(exampleText: santa.gameCharacter.currentPage().storyText, indexPath: 0)
        
        
        //왜 questLogic 두 개를 넣어야 제 타이밍에 퀘스트 리워드가 캐릭터에게 주어지지..? 이유를 모르겠음.
        questLogic()
        questLogic()
        choiceTableViewHeight.constant = CGFloat(47*santa.gameCharacter.currentPage().choice.count)
        if isRunning == false{
            self.choiceTableView.reloadData()
        } else {
            self.choiceTableView.reloadData()
            self.choiceTableView.isHidden = true
        }
        
       //팝업노트
        self.storyTableView.reloadData()
        scrollToBottom()
    }
    print("현재 어레이 : \(labelArrayInTable)")
}
    
    
    
    
    
    
    
    
    

    
    @IBAction func endEpisodeButtonAction(_ sender: Any) {
        updateEpisodeAndChapter()
        questLogic()
        questLogic()
        updateWarningInt()
    }

    // 챕터 표지 눌렀을 때 꺼지는 버튼(눈에는 안 보임)
     @IBAction func chapterCoverFullButtonAction(_ sender: Any) {
         hideChapterCover()
        typeOn(exampleText: santa.gameCharacter.currentPage().storyText, indexPath: 0)
         self.choiceTableView.reloadData()
         self.storyTableView.reloadData()
         
     }
     //챕터 표지의 선택지 1버튼
     @IBAction func chapterCoverChoiceButton1Action(_ sender: Any) {
         hideChapterCover()
         santa.gameCharacter.currentEpPageIndex = 0
         print(santa.gameCharacter.currentPage().storyText)
         //labelArrayInTable.append(santa.gameCharacter.currentPage().storyText)
         self.choiceTableView.reloadData()
         self.storyTableView.reloadData()
        typeOn(exampleText:santa.gameCharacter.currentPage().storyText, indexPath: 0)
     }
     //챕터 표지의 선택지 2버튼
     @IBAction func chapterCoverChoiceButton2Action(_ sender: Any) {
         hideChapterCover()
         santa.gameCharacter.currentEpPageIndex = 1
         //labelArrayInTable.append(santa.gameCharacter.currentPage().storyText)
         self.choiceTableView.reloadData()
         self.storyTableView.reloadData()
        typeOn(exampleText:santa.gameCharacter.currentPage().storyText, indexPath: 0)
     }
    
    
    
    
    
    
    
    
    func updatePage(indexPath: Int) {
        //currentPage 넘기기
        santa.gameCharacter.currentEpPageIndex = santa.gameCharacter.currentPage().choice[indexPath].nextPageIndex
    }
    
    func updateEpisodeAndChapter() {
        // 마지막 에피 마지막 페이지일 때 챕터 넘기기
        // currentEpisodeIndex는 0부터 시작, episodes.count는 1부터 시작하기 때문에 -1 함.
        if santa.gameCharacter.currentPage().choice[currentIndexPathRow].nextPageIndex==666 {
            choiceTableView.isHidden = true
            santa.gameCharacter.currentEpPageIndex = 0
            santa.gameCharacter.currentChapterIndex += 1
            santa.gameCharacter.currentEpisodeIndex = 0
            labelArrayInTable.removeAll()
            labelArrayInTable.append("")
            showChapterCoverOutlet()
            print("챕터 하나가 끝났습니다.")
            
        } else {
            //아니면 에피만 넘기기(이 함수 실행되는 곳인 화살표 누르는 페이지는 에피소드의 마지막 페이지지용)
            santa.gameCharacter.currentEpisodeIndex += 1
            santa.gameCharacter.currentEpPageIndex = 0
            
            labelArrayInTable.removeAll()
            
            labelArrayInTable.append("")
            typeOn(exampleText: santa.gameCharacter.currentPage().storyText, indexPath: 0)
            print("에피소드 하나가 넘어갔습니다. ")
            updateMainGameUI()
            
        }
        
    }
    
    //UI 업데이트 : 선택지/화살표 중 하나 선정, 초이스테블뷰 높이 결정, 스토리테이블뷰에 셀 추가함(currentPage()값 업뎃된 후여야 함)
    func updateMainGameUI() {
        
        //확인용
        print("현재 챕터 : \(santa.gameCharacter.currentChapterIndex) / 현재 에피 : \(santa.gameCharacter.currentEpisodeIndex) / 현재 페이지 : \(santa.gameCharacter.currentEpPageIndex)")
        print("현재 선택지들 : \(santa.gameCharacter.currentPage().choice)")
        // 선택지 or 화살표 띄우기
        if santa.gameCharacter.currentPage().endEpisodePage == true {
            endEpisodeButton.isHidden = false
            choiceTableView.isHidden = true
        } else {
            endEpisodeButton.isHidden = true
            choiceTableView.isHidden = false
        }
        topBarChapterName.text = "제\(santa.gameCharacter.currentChapterIndex)장 \(santa.gameCharacter.currentChapter().chapterName)"
        //선택지 TableView 높이
        choiceTableViewHeight.constant = CGFloat(47*santa.gameCharacter.currentPage().choice.count)
        self.choiceTableView.reloadData()
        //self.storyTableView.reloadData()
    }
    
    func updateStoryTableView() {
        //확인용
        print("현재 챕터 : \(santa.gameCharacter.currentChapterIndex) / 현재 에피 : \(santa.gameCharacter.currentEpisodeIndex) / 현재 페이지 : \(santa.gameCharacter.currentEpPageIndex)")
        // 선택지 or 화살표 띄우기
        endEpisodeButton.isHidden = true
        if santa.gameCharacter.currentEpisodeIndex == 0 && santa.gameCharacter.currentEpPageIndex == 0{
                choiceTableView.isHidden = false
        }
        checkItIsLastPage()
            
        
        //선택지 TableView 높이
        choiceTableViewHeight.constant = CGFloat(47*santa.gameCharacter.currentPage().choice.count)
        // 마지막 페이지일 경우 업데이트 + 새로운 챕터의 첫 페이지일 경우 업데이트
        if santa.gameCharacter.currentEpisodeIndex == santa.gameCharacter.currentChapter().episodes.count-1 || santa.gameCharacter.currentEpPageIndex == 0 {
            typeOn(exampleText: santa.gameCharacter.currentPage().storyText, indexPath: 0)
        }
        
       
       
    }
    
    func questLogic() {
        
        var chapterGolds: Int = 0
        
        //현재 페이지가 퀘스트 완료 조건인지 식별, 맞을 시 데이터에서 삭제
        //챕터 내 퀘스트들 중 한 개의 퀘스트
        for quest in santa.gameCharacter.currentChapter().quests.enumerated(){
            //한 개의 퀘스트의 조건 하나
            for questJogeon in quest.element.questClearJoGeun.enumerated(){
                if questJogeon.element == santa.gameCharacter.currentPage().questIdentifier {
                    santa.gameCharacter.GameFullStory[santa.gameCharacter.currentChapterIndex].quests[quest.offset].questClearJoGeun.remove(at: questJogeon.offset)
                }
            }
            //퀘스트 완료 시 팝업뷰 실행
            if quest.element.questClearJoGeun.isEmpty && quest.element.questClear==false {
                chapterGolds += quest.element.reward
                santa.gameCharacter.GameFullStory[santa.gameCharacter.currentChapterIndex]
    .quests[quest.offset].questClear = true
                questPopUpView.alpha = 0
                questPopUpView.isHidden = false

                UIView.animate(withDuration: 1.0) {
                    self.questPopUpView.alpha = 1
                } completion: { (i) in
                    UIView.animate(withDuration: 2.0, delay: 0.5) {
                        self.questPopUpView.alpha = 0
                    }
                }
            }
        }
            
        santa.gameCharacter.currentChapterGold = chapterGolds
        //확인용
        print("현재 캐릭터 보유 금 : \(santa.gameCharacter.currentChapterGold)금")
    }
    
    // 엔딩스코어(다른 결말을 보게 할 수 있는 점수를 선택지에다가 줌. 그걸 합산해서 엔딩을 결정함.)
    func decideEnding(indexpathRow: Int) {
        santa.gameCharacter.totalEndingScore += santa.gameCharacter.currentPage().choice[indexpathRow].endingScore
        print("현재 결말 스코어는 \(santa.gameCharacter.totalEndingScore)점입니다.")
        
        //엔딩 결정하는 로직 - 일단 임의로 값이랑 변수 지정함. 현재 사용 안 함~~~
        if santa.gameCharacter.currentPage().storyText == "마지막장" {
            // 엔딩 화면으로 이동함.(self.pushviewnavigation 같은 코드 짜기)
            var 엔딩lable: String = ""
            switch santa.gameCharacter.totalEndingScore {
            case 0...30:
                엔딩lable = ""
            case 31...60:
                엔딩lable = ""
            case 61...90:
                엔딩lable = ""
            default:
                엔딩lable = ""
            }
        }
    
}
// 챕터 표지의 값(value) 세팅하기
func showChapterCover() {
    mainGameTopBar.isHidden = true
        print("표지 데이터 설정")
        // 챕터이름
        chapterCoverNameLabel.text = "\(santa.gameCharacter.currentChapter().chapterName)"
            
        // 챕터 번호 : 0일 때 프롤로그, 아니면 "제 n장"으로 함
        if santa.gameCharacter.currentChapter().chapterNumber == 0 {
                chapterCoverNumberLabel.text = "프롤로그"
        } else {
                chapterCoverNumberLabel.text = "제 \(santa.gameCharacter.currentChapter().chapterNumber)장"
        }
        //챕터 일러스트
        chapterCoverIllustImage.image = UIImage(named: santa.gameCharacter.currentChapter().chapterIllust)
        
        //챕터 선택지 버튼 : 표지에 선택지 2개일 때만 실행하기
        if santa.gameCharacter.currentChapter().chapterChoice.count == 2 {
        chapterCoverChoice1Button.setTitle(santa.gameCharacter.currentChapter().chapterChoice[0].choiceText, for: .normal)
        chapterCoverChoice2Button.setTitle(santa.gameCharacter.currentChapter().chapterChoice[1].choiceText, for: .normal)
            }
    }

    // 표지 끄고 본문으로 돌아가게 함
    func hideChapterCover() {
       
        // 메인 뷰
        choiceTableView.isHidden = false
        storyTableView.isHidden = false
      
        //표지 뷰
        chapterCoverFullButton.isHidden = true
        chapterCoverChoiceStackView.isHidden = true
        self.chapterCoverStackView.isHidden = true
        mainGameTopBar.isHidden = false
        
    }
    
    // 페이드인/아웃 모션 담음.
   func showChapterCoverOutlet() {
       // 직전
       
       // 메인 뷰
       //choiceTableView.isHidden = false
       storyTableView.isHidden = false
       
       // 페이드 뷰
       self.faidBlackView.isHidden = false
       self.faidBlackView.alpha = 0
        self.faidBlackView.backgroundColor = .black
       //표지 뷰
       self.chapterCoverFullButton.isHidden = true
       self.chapterCoverChoiceStackView.isHidden = true
       self.chapterCoverStackView.isHidden = true
   
       // 첫 애니메이션
       UIView.animate(withDuration: 2.0) {
           self.faidBlackView.alpha = 1
      
       // 두번째 애니메이션
       } completion: { (i) in
            UIView.animate(withDuration: 2.0) {
                //챕터 넘기고 나서도 계속 초이스테이블뷰가 떠서 잠깐 주석처리
                self.updateMainGameUI()
                self.showChapterCover()
                self.choiceTableView.reloadData()
                self.storyTableView.reloadData()
                   //메인 스토리 뷰
                self.choiceTableView.isHidden = true
                self.storyTableView.isHidden = true
                       
                // 표지 뷰
                self.chapterCoverStackView.isHidden = false
                if santa.gameCharacter.currentChapterIndex==0 {
                    self.chapterCoverChoiceStackView.isHidden = false
                } else {
                    self.chapterCoverFullButton.isHidden = false
                }
               // 페이드 뷰
               self.faidBlackView.alpha = 0
            } completion: { (i) in
                // 애니메이션 직후 : 오버레이 히든 걸기
                self.faidBlackView.isHidden = true
            }
        }
    }

   func updateWarningInt() {
    // currentPage()값 업뎃 된 이후에 해야 할 것임.
    // 현재 페이지에 소월신 경고값이 있으면 아래 코드를 실행함
    if santa.gameCharacter.currentPage().warningInt != 0 {
        //
        santa.gameCharacter.totalWarning += santa.gameCharacter.currentPage().warningInt
        
        // 현재 페이지의 소월신 경고값을 캐릭터에게 반영했는데 아직 3회 이하면 아래 코드 실행(소월신 경고 팝업창 애니메이션 보여주는 내용임)
        if santa.gameCharacter.totalWarning < 3 {
        faidBlackView.backgroundColor = UIColor(cgColor: CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8))
        faidBlackView.isHidden = false
        faidBlackView.alpha = 0
       
        warningPopUpView.layer.shadowColor = UIColor.black.cgColor
        warningPopUpView.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        warningPopUpView.layer.shadowOpacity = 0.8
        warningPopUpView.layer.shadowRadius = 20.0
        
        warningPopUpView.isHidden = false
        warningPopUpView.alpha = 0
        
        UIView.animate(withDuration: 2.0) {
            self.warningPopUpView.alpha = 1
            self.faidBlackView.alpha = 0.5
        } completion: { (i) in
            UIView.animate(withDuration: 2.0, delay: 1) {
                self.warningPopUpView.alpha = 0
                self.faidBlackView.alpha = 0
            }
           
        }
        
        print(santa.gameCharacter.currentPage().warningInt)
        // 현재 캐릭터가 소월신의 경고를 총 3번 받았다면 게임오버 뷰로 이동
        }
        if santa.gameCharacter.totalWarning == 3 {
            
            performSegue(withIdentifier: "gameOverViewSegue", sender: nil)
            
        }
    }

    
    
}
  
    
    
    //현재 코드를 실행중인지 체크하는 bool
    var isRunning = false
   //타이핑
    func typeOn(exampleText : String, indexPath: Int) {
        var characterArray = [Character](exampleText)
        var characterIndex = 0
        choiceTableView.isHidden = true
        changeTrueFalse()
        
        //터치를 한번 이상 하면 실행되지 않도록 하는 조건
        if isRunning == true{
            Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true)
            { [self] (timer) in
                
                    //$는 텍스트의 타이핑 속도를 느려지게 하는 부분에서 사용할 수 있다. 먼저 $가 아닌 것들을 조건으로 놓는다.
                    if characterArray[characterIndex] != "$" //&& isRunning == true
                    {
                        while characterArray[characterIndex] == " "
                        {
                            labelArrayInTable[0].append(" ")
                            storyTableView.reloadData()
                            scrollToBottom()
                            characterIndex += 1
                            if characterIndex == characterArray.count
                            {
                                characterArray.removeAll()
                                timer.invalidate()
                                isRunning = false
                                checkItIsLastPage()
                                return
                            }
                        }
                        labelArrayInTable[0].append(characterArray[characterIndex])
                        storyTableView.reloadData()
                        scrollToBottom()
                    }
                characterIndex += 1
                if characterIndex == characterArray.count
                {
                    //CurrentTextArrayIndex += 1
                    characterArray.removeAll()
                       //scrollToBottom()
                    isRunning = false
                    timer.invalidate()
                    checkItIsLastPage()
                    return
                }
                //터치를 한번 더 했을 때, 현재 타이핑되는 텍스트를 초기화하고 전체 문장을 더하는 것.
                if isRunning == false{
                    timer.invalidate()
                    labelArrayInTable.remove(at: 0)
                    labelArrayInTable.append("")
                    labelArrayInTable[0].append(exampleText)
                    storyTableView.reloadData()
                    scrollToBottom()
                    choiceTableView.isHidden = false
                    checkItIsLastPage()
                    print(santa.gameCharacter.currentPage().choice)
                }
            }
        }
        
        }
    //true값 false로 전환하는 코드
    func changeTrueFalse(){
        if isRunning == true{
            isRunning = false
        }  else if isRunning == false{
            isRunning = true
        }
    }
    //현재 페이지에 있는 주석의 갯수
    var amountOfNotes = 0
    func popUpNotes(indexPath : Int){
        guard isRunning == false else { return }
        annotationView.isHidden = false
        amountOfNotes = santa.gameCharacter.currentPage().annotation.count
        
        for i in santa.gameCharacter.currentPage().annotation{
            //노트 + 넣을 텍스트 만들기
            let rect = CGRect(x: 0, y: 0, width: 268, height: 84)
            let note = UIView(frame: rect)
            note.layer.cornerRadius = 10
            note.heightAnchor.constraint(equalToConstant: 84).isActive = true
            note.widthAnchor.constraint(equalToConstant: 268).isActive = true
            let titleLabel = UILabel(frame: CGRect(x: 13, y: 14, width: 242, height: 18))
            let informationLabel = UILabel(frame: CGRect(x: 13, y: 36, width: 242, height: 36))
            informationLabel.text = i.explanation
            titleLabel.text = i.word
            titleLabel.font = UIFont(name: "NANUMBARUNGOTHICBOLD", size: CGFloat(15))
            informationLabel.font = UIFont(name: "NANUMBARUNGOTHIC", size: CGFloat(15))
            informationLabel.textAlignment = .center
            titleLabel.textAlignment = .center
            note.addSubview(informationLabel)
            note.addSubview(titleLabel)
            note.backgroundColor = .white
            informationLabel.numberOfLines = 0
            noteStackView.addArrangedSubview(note)
        }
        
        if amountOfNotes == 1{
            displayOneNote(noteView: noteStackView, topBar: mainGameTopBar, exitButton: exitAnnotationButton, wholeView: wholeView)
        } else if amountOfNotes == 2{
            displayDoubleNote(noteView: noteStackView, topBar: mainGameTopBar, exitButton: exitAnnotationButton, wholeView: wholeView)
        } else if amountOfNotes == 3{
            displayTripleNote(noteView: noteStackView, topBar: mainGameTopBar, exitButton: exitAnnotationButton, wholeView: wholeView)
        }
    }
    
    @IBOutlet var wholeView: UIView!
    @IBOutlet var exitAnnotationButton: UIButton!
    @IBAction func tapAnnotationView(_ sender: Any) {
        annotationView.isHidden = true
        for i in noteStackView.arrangedSubviews{
            noteStackView.removeArrangedSubview(i)
        }
        topAnnotation.isActive = false
        bottomAnnotation.isActive = false
        leftAnnotation.isActive = false
        rightAnnotation.isActive = false
    }
    func checkItIsLastPage(){
        if santa.gameCharacter.currentPage().endEpisodePage == true {
            endEpisodeButton.isHidden = false
            choiceTableView.isHidden = true
        } else {
            choiceTableView.isHidden = false
    }
}
}




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


 //글 높이 조정하는 코드
extension UILabel {

    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {

        guard let labelText = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple

        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }

        // (Swift 4.2 and above) Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
    }
}


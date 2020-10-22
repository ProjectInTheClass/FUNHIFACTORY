//
//  MainGameViewController.swift
//  FUNHIPROTOTYPE
//
//  Created by 최서연 on 2020/10/13.
//

import UIKit

class MainGameViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   
    //메인 게임 뷰
    @IBOutlet var rootView: UIView!
    @IBOutlet weak var warningImage1: UIImageView!
    @IBOutlet weak var warningImage2: UIImageView!
    @IBOutlet weak var warningImage3: UIImageView!
    @IBOutlet weak var goToSettingViewControlerButton: UIButton!
    @IBOutlet weak var storyTableView: UITableView!
    @IBOutlet weak var choiceTableView: UITableView!
    @IBOutlet weak var endEpisodeButton: UIButton!
    @IBOutlet weak var choiceTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var characterGage: UIStackView!
    @IBOutlet weak var questPopUpView: UIView!
    
    // 표지 띄우기 위한 것
    @IBOutlet weak var chapterCoverNumberLabel: UILabel!
    @IBOutlet weak var chapterCoverNameLabel: UILabel!
    @IBOutlet weak var chapterCoverIllustImage: UIImageView!
    @IBOutlet weak var chapterCoverChoice1Button: UIButton!
    @IBOutlet weak var chapterCoverChoice2Button: UIButton!
    @IBOutlet weak var chapterCoverStackView: UIStackView!
     @IBOutlet weak var chapterCoverFullButton: UIButton!
     @IBOutlet weak var chapterCoverChoiceStackView: UIStackView!
    
    // 페이드인/아웃 위한 까만 전체뷰
    @IBOutlet weak var faidBlackView: UIView!
    
   
 
    
    //메인 스토리 테이블뷰 어레이
    var labelArrayInTable : [String] = []
      
    
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
                let storyLine: String = labelArrayInTable[indexPath.row]
               
                
                // 텍스트 스타일 반영하기
                storyCell.storyLableUpdate(text: storyLine)
                storyCell.storyLabelSizeUpdate(size: santa.setting.fontSize)
                
                storyCell.backgroundColor = .clear
                storyCell.selectionStyle = .none
                 cellToReturn = storyCell
                
            } else if tableView == choiceTableView{
                let list: Choice = santa.gameCharacter.currentPage().choice[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: "choiceTableViewCell") as! ChoiceTableViewCell
                // tableViewCell 투명화
                
                cell.choiceTableViewCellLabel.text = list.choiceText
                cell.choiceLabelUpdate()
                cell.backgroundColor = .clear
                cellToReturn = cell
            }
            
            return cellToReturn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.choiceTableView.dataSource = self
        self.choiceTableView.delegate = self
        self.storyTableView.dataSource = self
        self.storyTableView.delegate = self
        choiceTableViewHeight.constant = CGFloat(47*santa.gameCharacter.currentPage().choice.count)

        
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
        showChapterCover()
        showChapterCoverOutlet()
        
        print("현재 페이지 : 챕터\(santa.gameCharacter.currentChapterIndex) 에피소드\(santa.gameCharacter.currentEpisodeIndex + 1) \(santa.gameCharacter.currentEpPageIndex)페이지(인스턴스 기준)")

        self.storyTableView.rowHeight = UITableView.automaticDimension
        self.storyTableView.estimatedRowHeight = 200
        
      
       
        // Do any additional setup after loading the view.
    }
    


func scrollToBottom(){
    DispatchQueue.main.async {
        let indexPath = IndexPath(row: self.labelArrayInTable.count-1, section: 0)
        self.storyTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
}
//게임 재시작하기


func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
    //엔딩스코어 업뎃
    decideEnding(indexpathRow: indexPath.row)
    //다음 페이지로 넘기기
    /*updatePage(indexPath: indexPath.row)*/
    santa.gameCharacter.currentEpPageIndex = santa.gameCharacter.currentPage().choice[indexPath.row].nextPageIndex
    updateMainGameUI()
    //typeOn(exampleText: santa.gameCharacter.currentPage().storyText, indexPath: indexPath.row)
    //왜 questLogic 두 개를 넣어야 제 타이밍에 퀘스트 리워드가 캐릭터에게 주어지지..? 이유를 모르겠음.
    questLogic()
    questLogic()
    choiceTableViewHeight.constant = CGFloat(47*santa.gameCharacter.currentPage().choice.count)
    scrollToBottom()
    

self.choiceTableView.reloadData()
    
    
    self.storyTableView.reloadData()
    }
     
   
    
//화살표 버튼 액션
    @IBAction func endEpisodeButtonAction(_ sender: Any) {
        
        updateEpisodeAndChapter()
        
       //왜 questLogic 두 개를 넣어야 제 타이밍에 퀘스트 리워드가 캐릭터에게 주어지지..? 이유를 모르겠음.
        questLogic()
        questLogic()
       
       
    }
    // 세팅뷰 가는 버튼
    @IBAction func goToSettingButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
   // 챕터 표지 눌렀을 때 꺼지는 버튼(눈에는 안 보임)
    @IBAction func chapterCoverFullButtonAction(_ sender: Any) {
        hideChapterCover()
        self.choiceTableView.reloadData()
        self.storyTableView.reloadData()
        
    }
    //챕터 표지의 선택지 1버튼
    @IBAction func chapterCoverChoiceButton1Action(_ sender: Any) {
        hideChapterCover()
        santa.gameCharacter.currentEpPageIndex = 1
        print(santa.gameCharacter.currentPage().storyText)
        labelArrayInTable.append(santa.gameCharacter.currentPage().storyText)
        self.choiceTableView.reloadData()
        self.storyTableView.reloadData()
    }
    //챕터 표지의 선택지 2버튼
    @IBAction func chapterCoverChoiceButton2Action(_ sender: Any) {
        hideChapterCover()
        santa.gameCharacter.currentEpPageIndex = 0
        labelArrayInTable.append(santa.gameCharacter.currentPage().storyText)
        self.choiceTableView.reloadData()
        self.storyTableView.reloadData()
    }
    
    //페이지 인덱스값 변경, didselect에서만 사용됨
    func updatePage(indexPath: Int) {
        //currentPage 넘기긱
        santa.gameCharacter.currentEpPageIndex = santa.gameCharacter.currentPage().choice[indexPath].nextPageIndex
      
    }
    // 에피소드랑 챕터 변경,화살표 버튼에서만 사용됨.
    func updateEpisodeAndChapter() {
        // 마지막 에피 마지막 페이지일 때 챕터 넘기기
        // currentEpisodeIndex는 0부터 시작, episodes.count는 1부터 시작하기 때문에 -1 함.
        if santa.gameCharacter.currentEpisodeIndex==santa.gameCharacter.currentChapter().episodes.count-1 {
            santa.gameCharacter.currentEpPageIndex = 0
            santa.gameCharacter.currentChapterIndex += 1
            santa.gameCharacter.currentEpisodeIndex = 0
            labelArrayInTable.removeAll()
            showChapterCoverOutlet()
            
        } else {
            //아니면 에피만 넘기기(이 함수 실행되는 곳인 화살표 누르는 페이지는 에피소드의 마지막 페이지지용)
            santa.gameCharacter.currentEpisodeIndex += 1
            santa.gameCharacter.currentEpPageIndex = 0
            labelArrayInTable.removeAll()
            self.updateMainGameUI()
            
            self.choiceTableView.reloadData()
            self.storyTableView.reloadData()
        }
        // currentEpPageIndex, 테이블 뷰 텍스트 리셋
       
        
        
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
        //선택지 TableView 높이
        choiceTableViewHeight.constant = CGFloat(47*santa.gameCharacter.currentPage().choice.count)
        // 본문 업뎃
        labelArrayInTable.append(santa.gameCharacter.currentPage().storyText)
    }
    
    // 퀘스트 완료 여부 체크, 완료 시 리워드 give / 팝업창 뜸
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
            if quest.element.questClearJoGeun.isEmpty {
                chapterGolds += quest.element.reward
                questPopUpView.alpha = 0
                questPopUpView.isHidden = false

                UIView.animate(withDuration: 1.0) {
                    self.questPopUpView.alpha = 1
                } completion: { (i) in
                    UIView.animate(withDuration: 2.0) {
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
        
        //엔딩 결정하는 로직 - 일단 임의로 값이랑 변수 지정함.
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
      
        print("표지 데이터 설정")

       
        // 챕터이름 : 앞 공백 스페이즈 6칸 있는 거 정상임 건드리면 안 돼여
        chapterCoverNameLabel.text = "      "+"\(santa.gameCharacter.currentChapter().chapterName)"
            
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
        goToSettingViewControlerButton.isHidden = false
        storyTableView.isHidden = false
        characterGage.isHidden = false
        
        //표지 뷰
        chapterCoverFullButton.isHidden = true
        chapterCoverChoiceStackView.isHidden = true
        self.chapterCoverStackView.isHidden = true
       
       
    }
    
    
  
    //타이핑
     func typeOn(exampleText : String, indexPath: Int) {
         var characterArray = [Character](exampleText)
         var characterIndex = 0
         labelArrayInTable.append(" ")
         
         Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { [self] (timer) in
                 if characterArray[characterIndex] != "$" {
                     while characterArray[characterIndex] == " " {
                         labelArrayInTable[indexPath].append(" ")
                         storyTableView.reloadData()
                         characterIndex += 1
                         if characterIndex == characterArray.count {
                             //CurrentTextArrayIndex += 1
                             characterArray.removeAll()
                             timer.invalidate()
                             return
                         }
                     }
                     labelArrayInTable[indexPath].append(characterArray[characterIndex])
                     storyTableView.reloadData()
                 }
                 characterIndex += 1
                 if characterIndex == characterArray.count {
                     //CurrentTextArrayIndex += 1
                     characterArray.removeAll()
                     timer.invalidate()
                 }
             
             }
         
         }
     // 페이드인/아웃 모션 담음.
    func showChapterCoverOutlet() {
        // 직전
        
            // 메인 뷰
            choiceTableView.isHidden = false
            goToSettingViewControlerButton.isHidden = false
            storyTableView.isHidden = false
            characterGage.isHidden = false
            
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
                self.updateMainGameUI()
                self.showChapterCover()
                
                self.choiceTableView.reloadData()
                self.storyTableView.reloadData()
            //메인 스토리 뷰
            self.choiceTableView.isHidden = true
            self.goToSettingViewControlerButton.isHidden = true
            self.storyTableView.isHidden = true
            self.characterGage.isHidden = true
            
            
            
            // 표지 뷰
            self.chapterCoverStackView.isHidden = false
            if santa.gameCharacter.currentChapterIndex==0  {
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
 
}

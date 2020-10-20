//
//  MainGameViewController.swift
//  FUNHIPROTOTYPE
//
//  Created by 최서연 on 2020/10/13.
//

import UIKit

class MainGameViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   

    @IBOutlet weak var warningImage1: UIImageView!
    @IBOutlet weak var warningImage2: UIImageView!
    @IBOutlet weak var warningImage3: UIImageView!
    @IBOutlet weak var goToSettingViewControlerButton: UIButton!
    @IBOutlet weak var storyTableView: UITableView!
    @IBOutlet weak var choiceTableView: UITableView!
    @IBOutlet weak var endEpisodeButton: UIButton!
    @IBOutlet weak var choiceTableViewHeight: NSLayoutConstraint!
    

    //메인 스토리 테이블뷰 어레이
    var labelArrayInTable : [String] = [" 한 나라의 왕인 나는 굵은 포승줄로 묶인 채 고개를 떨궜다. 이 자리에 발을 딛는 것도 이것이 마지막이겠거니 싶었다. 난 그저 초점 없는 눈으로 땅바닥을 바라보며 무릎을 꿇었다."]
      
    
    
    
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
               
                let story = labelArrayInTable[indexPath.row]
                
                storyCell.storyLableUpdate(text: story)
                storyCell.storyLabelSizeUpdate(size: santa.setting.fontSize)
                storyCell.backgroundColor = .clear
                storyCell.selectionStyle = .none
                 cellToReturn = storyCell
                
            } else if tableView == choiceTableView{
                let list: Choice = santa.gameCharacter.currentPage().choice[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: "choiceTableViewCell") as! ChoiceTableViewCell
                // tableViewCell 투명화
                
                cell.choiceTableViewCellLabel.text = list.choiceText
                
                cell.backgroundColor = .clear
                cellToReturn = cell
            }
            
            return cellToReturn
    }
    override func viewWillAppear(_ animated: Bool) {
        storyTableView.reloadData()
        choiceTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.choiceTableView.dataSource = self
        self.choiceTableView.delegate = self
        self.storyTableView.dataSource = self
        self.storyTableView.delegate = self
        
        choiceTableView.separatorColor = UIColor(displayP3Red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
        
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
        
        //빌드 중에 현재 페이지가 어떤 건지 파악 위한 거
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
@IBAction func restartGame(_ sender: Any) {
    // 체력/멘탈/돈/페이지인덱스/능력/풀에피소드/현재 에피, 에피 내 인덱스 초기화
    endEpisodeButton.isHidden = true
    santa.gameCharacter.pageIndex = 1
    santa.gameCharacter.currentEpisodeIndex = 0
    santa.gameCharacter.currentEpPageIndex = 0
    santa.gameCharacter.currentChapterIndex = 0
    
    // 본문 테이블 뷰 텍스트,이미지 / 테이블 뷰 리로드 /
    labelArrayInTable.removeAll()
    labelArrayInTable.append(santa.gameCharacter.currentPage().storyText)
    //choiceTableView 높이 지정
    choiceTableViewHeight.constant = CGFloat(55*santa.gameCharacter.currentPage().choice.count)
  
    self.storyTableView.reloadData()
    self.choiceTableView.reloadData()
}


func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //엔딩스코어 업뎃
    decideEnding(indexPathRow: indexPath.row)
    //다음 페이지로 넘기기
    updatePage(indexPath: indexPath.row)
    updateStoryTableView()
    typeOn(exampleText: santa.gameCharacter.currentPage().storyText, indexPath: indexPath.row)
    
    //왜 questLogic 두 개를 넣어야 제 타이밍에 퀘스트 리워드가 캐릭터에게 주어지지..? 이유를 모르겠음.
    questLogic()
    questLogic()
    choiceTableViewHeight.constant = CGFloat(47*santa.gameCharacter.currentPage().choice.count)
    scrollToBottom()
    self.choiceTableView.reloadData()
    self.storyTableView.reloadData()
        }
    

    @IBAction func endEpisodeButtonAction(_ sender: Any) {
        
        updateEpisodeAndChapter()
        updateStoryTableView()
       //왜 questLogic 두 개를 넣어야 제 타이밍에 퀘스트 리워드가 캐릭터에게 주어지지..? 이유를 모르겠음.
        questLogic()
        questLogic()
       
        self.choiceTableView.reloadData()
        self.storyTableView.reloadData()
    }
    
    @IBAction func goToSettingButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func updatePage(indexPath: Int) {
        //currentPage 넘기긱
        santa.gameCharacter.currentEpPageIndex = santa.gameCharacter.currentPage().choice[indexPath].nextPageIndex
    }
    
    func updateEpisodeAndChapter() {
        // 마지막 에피 마지막 페이지일 때 챕터 넘기기, 아니면 에피만 넘기기(이 함수 실행되는 곳인 화살표 누르는 페이지는 마지막 페이지지용)
        if santa.gameCharacter.currentEpisodeIndex == santa.gameCharacter.currentChapter().Episodes.count-1 {
            santa.gameCharacter.currentChapterIndex += 1
            santa.gameCharacter.currentEpisodeIndex = 0
        } else {
            santa.gameCharacter.currentEpisodeIndex += 1
        }
        // currentEpPageIndex, 테이블 뷰 텍스트 리셋
        santa.gameCharacter.currentEpPageIndex = 0
        labelArrayInTable.removeAll()
    }
    
    func updateStoryTableView() {
        
        //확인용
        print("현재 챕터 : \(santa.gameCharacter.currentChapterIndex) / 현재 에피 : \(santa.gameCharacter.currentEpisodeIndex) / 현재 페이지 : \(santa.gameCharacter.currentEpPageIndex)")
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
        //labelArrayInTable.append(santa.gameCharacter.currentPage().storyText)
       
       
    }
    
    func questLogic() {
            
        var chapterGolds: Int = 0
        //챕터 내 퀘스트들 중 한 개의 퀘스트
        for quest in santa.gameCharacter.currentChapter().quests.enumerated(){
            //한 개의 퀘스트의 조건 하나
            for questJogeon in quest.element.questClearJoGeun.enumerated(){
                if questJogeon.element == santa.gameCharacter.currentPage().questIdentifier {
                    santa.gameCharacter.GameFullStory[santa.gameCharacter.currentChapterIndex].quests[quest.offset].questClearJoGeun.remove(at: questJogeon.offset)
                }
            }
            if quest.element.questClearJoGeun.isEmpty {
                chapterGolds += quest.element.reward
            }
        }
        santa.gameCharacter.currentChapterGold = chapterGolds
        print("현재 캐릭터 보유 금 : \(santa.gameCharacter.currentChapterGold)금")
        }
        
    func decideEnding(indexPathRow: Int) {
        santa.gameCharacter.totalEndingScore += santa.gameCharacter.currentPage().choice[indexPathRow].endingScore
        print("현재 결말 스코어는 \(santa.gameCharacter.totalEndingScore)점입니다.")
        
        //엔딩 결정하는 로직 - 일단 임의로 값이랑 변수 지정함.
        if santa.gameCharacter.currentPage().storyText == "마지막장" {
            let _ = "엔딩 화면으로 이동함.(들어가야 할 코드 메모한 거임)"
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
    
    
}

  


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


 
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


        // (Swift 4.1 and 4.0) Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        self.attributedText = attributedString
    }
}

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
            print(currentChoice)
            intToReturn = currentChoice
        }
        return intToReturn
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cellToReturn = UITableViewCell()
            if tableView == storyTableView{
                let storyCell = tableView.dequeueReusableCell(withIdentifier: "storyTableViewCell", for: indexPath) as! MainGameTableViewCell
                let storyLine: String = labelArrayInTable[indexPath.row]
               
                
                
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
    // 쪽번호
    santa.gameCharacter.pageIndex += 1
    //다음 페이지로 넘기기
    updatePage(indexPath: indexPath.row)
    choiceTableViewHeight.constant = CGFloat(47*santa.gameCharacter.currentPage().choice.count)

    scrollToBottom()
    
    //게임 오버 구현하기 + 죽은 횟수 저장하기 : santa.totalDying += 1

    // 셀 높이
    choiceTableViewHeight.constant = CGFloat(47*santa.gameCharacter.currentPage().choice.count)
      
    //tableView들 업뎃
        self.choiceTableView.reloadData()
        self.storyTableView.reloadData()

   
        }
    
    func updatePage(indexPath: Int) {
        
        santa.gameCharacter.currentEpPageIndex = santa.gameCharacter.currentPage().choice[indexPath].nextPageIndex
        if santa.gameCharacter.currentPage().endEpisodePage == true {
            endEpisodeButton.isHidden = false
            choiceTableView.isHidden = true
        } else {
            endEpisodeButton.isHidden = true
            choiceTableView.isHidden = false
        }
        labelArrayInTable.append(santa.gameCharacter.currentPage().storyText)
    
    }
    

    @IBAction func endEpisodeButtonAction(_ sender: Any) {
        
        updateEpisode()
       
        self.choiceTableView.reloadData()
        self.storyTableView.reloadData()
    }
    
    @IBAction func goToSettingButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
   
    func updateEpisode() {
        
        
        if santa.gameCharacter.currentEpisodeIndex == santa.gameCharacter.currentChapter().Episodes.count-1 {
            santa.gameCharacter.currentChapterIndex += 1
            santa.gameCharacter.currentEpisodeIndex = 0
        } else {
            santa.gameCharacter.currentEpisodeIndex += 1
        }
        santa.gameCharacter.currentEpPageIndex = 0
       
        labelArrayInTable.removeAll()
        if santa.gameCharacter.currentPage().endEpisodePage == true {
            endEpisodeButton.isHidden = false
            choiceTableView.isHidden = true
        } else {
            endEpisodeButton.isHidden = true
            choiceTableView.isHidden = false
        }
        labelArrayInTable.append(santa.gameCharacter.currentPage().storyText)
        choiceTableViewHeight.constant = CGFloat(47*santa.gameCharacter.currentPage().choice.count)

        self.choiceTableView.reloadData()
        self.storyTableView.reloadData()
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

    
 

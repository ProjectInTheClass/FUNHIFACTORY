//
//  MainHistoryAchieveViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/27.
//

import UIKit

class MainHistoryAchieveViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var firstTitle: UILabel!
    @IBOutlet weak var secondTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
            firstImage.isUserInteractionEnabled = true
            secondImage.isUserInteractionEnabled = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

//-----------------------------------------------------------------------------------------------------------

class MainHistoryAchieveViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var topBarTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var imagePopupView: UIView!
    @IBOutlet weak var imagePopupViewImageView: UIImageView!
    @IBOutlet var textPopupView: UIView!
    @IBOutlet weak var imagePopupBlackView: UIView!
    var receivedHistory: [History]?
    var receivedAchievement: [Achievement]?
    var isHistory: Bool = true
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isHistory {
            return player.currentHistories.count/2
        } else {
            return player.currentAchievements.count/2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! MainHistoryAchieveViewControllerCell
        
        cell.backgroundColor = .clear
        
        if isHistory {
            topBarTitle.text = "히스토리"
            
            if let history = receivedHistory  {
                cell.firstImage.image = UIImage(named: history[indexPath.row*2].info().image)
                cell.secondImage.image = UIImage(named: history[indexPath.row*2+1].info().image)
                cell.firstTitle.text = history[indexPath.row*2].info().name
                cell.secondTitle.text = history[indexPath.row*2+1].info().name
                
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(popupViewOnObjcHistory(sender:)))
                tapGesture.numberOfTapsRequired = 1
                tapGesture.numberOfTouchesRequired = 1
                
                cell.firstImage.tag = indexPath.row*2
                cell.secondImage.tag = indexPath.row*2+1
                cell.firstImage.addGestureRecognizer(tapGesture)
                cell.secondImage.addGestureRecognizer(tapGesture)
            }
            
        } else {
            topBarTitle.text = "업적"
            if let achievement = receivedAchievement  {
                cell.firstImage.image = UIImage(named: achievement[indexPath.row*2].info().image)
                cell.secondImage.image = UIImage(named: achievement[indexPath.row*2+1].info().image)
                cell.firstTitle.text = achievement[indexPath.row*2].info().name
                cell.secondTitle.text = achievement[indexPath.row*2+1].info().name
                
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(popupViewOnObjcAchievement(sender:)))
                tapGesture.numberOfTapsRequired = 1
                tapGesture.numberOfTouchesRequired = 1
                
                cell.firstImage.tag = indexPath.row*2
                cell.secondImage.tag = indexPath.row*2+1
                cell.firstImage.addGestureRecognizer(tapGesture)
                cell.firstImage.isUserInteractionEnabled = true
                cell.secondImage.addGestureRecognizer(tapGesture)
                cell.secondImage.isUserInteractionEnabled = true
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 195
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        super.viewDidLoad()
        textPopupView.isUserInteractionEnabled = true
        imagePopupView.isUserInteractionEnabled = true
        self.tableView.backgroundColor = .clear
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        super.viewWillAppear(true)
        imagePopupView.bounds = self.view.bounds
        textPopupView.bounds = self.view.bounds
        imagePopupBlackView.isHidden = true
        
    }
    // 2번 뷰로 돌아가기
    @IBAction func backToMainView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    // 테블뷰셀 첫 번째 버튼
    @IBAction func firstCellButtonAction(_ sender: Any) {
        
        popupViewOn(priviousScale: 0.9, afterScale: 1.0)
    }
    
    @IBAction func secondCellButtonAction(_ sender: Any) {
        popupViewOn(priviousScale: 0.9, afterScale: 1.0)
    }
    
    
    @IBAction func fromImageToTextPopupAction(_ sender: Any) {
        animatePopupOut(desiredView: imagePopupView, priviousScale: 1.0, afterScale: 1.2, ishidden: false)
        popupBlackViewOnOff(on: true)
        animatePopupIn(desiredView: textPopupView, priviousScale: 0.9, afterScale: 1.0)
    }
    
    @IBAction func fromTextToImagePopupAction(_ sender: Any) {
        animatePopupIn(desiredView: imagePopupView, priviousScale: 1.2, afterScale: 1.0)
        popupBlackViewOnOff(on: false)
        animatePopupOut(desiredView: textPopupView, priviousScale: 1.0, afterScale: 1.2, ishidden: true)
        
        
    }
    
    @IBAction func offPopupViewAction(_ sender: Any) {
        popupViewOff()
    }
    
    
    @objc func popupViewOnObjcHistory(sender: UITapGestureRecognizer){
        print("입력됨")
        imagePopupViewImageView.image = UIImage(named: player.currentHistories[sender.view!.tag].info().image)
        popupViewOn(priviousScale: 0.9, afterScale: 1.0)
    }
    
    @objc func popupViewOnObjcAchievement(sender: UITapGestureRecognizer){
        imagePopupViewImageView.image = UIImage(named: player.currentAchievements[sender.view!.tag].info().image)
        
    }
    

}
extension MainHistoryAchieveViewController {
    
    // 이미지 확대뷰(이미지 뷰, 글씨 뷰 두 개 다 포함)를 켬.
    // 파라미터 : 애니메이션 시작하기 전의 크기/후의 크기. 1이 backgroundView와 동일한 크기임. 1.1이면 큰 거, 0.9면 작은 거.
    func popupViewOn(priviousScale: CGFloat, afterScale: CGFloat) {
        let backgroundView = self.view!
        //뷰 두 개(이미지, 글씨) 서브뷰로 추가
        backgroundView.addSubview(imagePopupView)
        backgroundView.addSubview(textPopupView)
        //이미지뷰만 히든 풀고, 뷰들 정렬함. 텍스트뷰는 서서히 나타나는 애니메이션을 위해 알파 0으로 설정해둠.
        imagePopupView.center = backgroundView.center
        imagePopupView.isHidden = false
        imagePopupView.alpha = 0
        textPopupView.center = backgroundView.center
        textPopupView.isHidden = true
        textPopupView.alpha = 0
        imagePopupView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
       
        //애니메이션
        UIView.animate(withDuration: 0.2) {
            self.imagePopupView.transform = CGAffineTransform(scaleX: afterScale, y: afterScale)
            self.imagePopupView.alpha = 1
        }
    }
    
    // 이미지 확대 뷰 끔(슈퍼뷰에서 팝업뷰들 지움)
    func popupViewOff() {
        imagePopupView.removeFromSuperview()
        textPopupView.removeFromSuperview()
    }
    
    // 팝업 뷰 안에서 전환되면서 나타나는 이미지/글씨 뷰가 확대되는 애니메이션
    func animatePopupIn(desiredView: UIView, priviousScale: CGFloat, afterScale: CGFloat) {
       
        desiredView.isHidden = false
        desiredView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
        
        UIView.animate(withDuration: 0.2) {
            desiredView.transform = CGAffineTransform(scaleX: afterScale, y: afterScale)
            desiredView.alpha = 1
//            desiredView.transform = CGAffineTransform.identity
        }
    }
    // 팝업 뷰 안에서 전환되면서 사라지는 이미지/글씨 뷰가 축소되는 애니메이션
    func animatePopupOut(desiredView: UIView, priviousScale: CGFloat, afterScale: CGFloat, ishidden: Bool) {
        
        // 히든 여부 : 알파값 조정함.
        var afterAlpha = 0
        if !ishidden {
            afterAlpha = 1
        }
        desiredView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
        
        UIView.animate(withDuration: 0.2) {
            desiredView.transform = CGAffineTransform(scaleX: afterScale, y: afterScale)
            if ishidden{
                desiredView.alpha = CGFloat(afterAlpha)
            }
           
//            desiredView.transform = CGAffineTransform.identity
        } completion: { (i) in
            desiredView.isHidden = ishidden
        }
    }
    // 블랙 뷰(반투명한 검정색 뷰) 애니메이션으로 띄우기/없애기
    func popupBlackViewOnOff(on: Bool) {
        imagePopupBlackView.isHidden = !on
        var priviousAlpha = 0
        var afterAlpha = 1
        if !on {
            priviousAlpha = 1
            afterAlpha = 0
        }
        
        imagePopupBlackView.alpha = CGFloat(priviousAlpha)
        UIView.animate(withDuration: 0.2) {
            self.imagePopupBlackView.alpha = CGFloat(afterAlpha)
        }
    }
}

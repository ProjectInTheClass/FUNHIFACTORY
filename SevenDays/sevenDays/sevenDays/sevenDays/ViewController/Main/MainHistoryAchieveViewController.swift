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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


class MainHistoryAchieveViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var topBarTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var imagePopupView: UIView!
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
        
        if isHistory {
            topBarTitle.text = "히스토리"
            if let history = receivedHistory  {
                cell.firstImage.image = UIImage(named: history[indexPath.row*2].historyInfo().image)
                cell.secondImage.image = UIImage(named: history[indexPath.row*2+1].historyInfo().image)
                cell.firstTitle.text = history[indexPath.row*2].historyInfo().name
                cell.secondTitle.text = history[indexPath.row*2+1].historyInfo().name
                
            }
            
        } else {
            topBarTitle.text = "업적"
            if let achievement = receivedAchievement  {
                cell.firstImage.image = UIImage(named: achievement[indexPath.row*2].achievementInfo().image)
                cell.secondImage.image = UIImage(named: achievement[indexPath.row*2+1].achievementInfo().image)
                cell.firstTitle.text = achievement[indexPath.row*2].achievementInfo().name
                cell.secondTitle.text = achievement[indexPath.row*2+1].achievementInfo().name
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        super.viewWillAppear(true)
        imagePopupView.bounds = self.view.bounds
        textPopupView.bounds = self.view.bounds
        imagePopupBlackView.isHidden = true
        
    }
    
    @IBAction func backToMainView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func firstCellButtonAction(_ sender: Any) {
        
        popupViewOn(priviousScale: 0.9, afterScale: 1.0)
    }
    
    @IBAction func secondCellButtonAction(_ sender: Any) {
        popupViewOn(priviousScale: 0.9, afterScale: 1.0)
    }
    
    
    @IBAction func fromImageToTextPopupAction(_ sender: Any) {
        animatePopupOut(desiredView: imagePopupView, priviousScale: 1.0, afterScale: 1.2, ishidden: false)
        popupBlackViewOn(true)
        animatePopupIn(desiredView: textPopupView, priviousScale: 0.9, afterScale: 1.0)
    }
    
    @IBAction func fromTextToImagePopupAction(_ sender: Any) {
        animatePopupIn(desiredView: imagePopupView, priviousScale: 1.2, afterScale: 1.0)
        popupBlackViewOn(false)
        animatePopupOut(desiredView: textPopupView, priviousScale: 1.0, afterScale: 1.2, ishidden: true)
        
        
    }
    
    @IBAction func offPopupViewAction(_ sender: Any) {
        popupViewOff()
    }
    
    
    func popupViewOn(priviousScale: CGFloat, afterScale: CGFloat) {
        let backgroundView = self.view!
        backgroundView.addSubview(imagePopupView)
        backgroundView.addSubview(textPopupView)
        imagePopupView.center = backgroundView.center
        imagePopupView.isHidden = false
        imagePopupView.alpha = 0
        textPopupView.center = backgroundView.center
        textPopupView.isHidden = true
        textPopupView.alpha = 0
        imagePopupView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
       
        
        UIView.animate(withDuration: 0.2) {
            self.imagePopupView.transform = CGAffineTransform(scaleX: afterScale, y: afterScale)
            self.imagePopupView.alpha = 1
//            desiredView.transform = CGAffineTransform.identity
        }
    }
    
    func popupViewOff() {
        imagePopupView.removeFromSuperview()
        textPopupView.removeFromSuperview()
    }
    func animatePopupIn(desiredView: UIView, priviousScale: CGFloat, afterScale: CGFloat) {
       
        desiredView.isHidden = false
        desiredView.transform = CGAffineTransform(scaleX: priviousScale, y: priviousScale)
        
        UIView.animate(withDuration: 0.2) {
            desiredView.transform = CGAffineTransform(scaleX: afterScale, y: afterScale)
            desiredView.alpha = 1
//            desiredView.transform = CGAffineTransform.identity
        }
    }
    
    func animatePopupOut(desiredView: UIView, priviousScale: CGFloat, afterScale: CGFloat, ishidden: Bool) {
        
        // 뷰 히든 될 거임 : 알파 0으로 바꾸게, 뷰 히든 안 할 거임 : 알파 1 그대로 냅두기
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
    
    func popupBlackViewOn(_ on: Bool) {
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

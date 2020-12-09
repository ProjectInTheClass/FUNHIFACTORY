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
    @IBOutlet weak var testButton: UIButton!
    
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
    var receivedHistory: [History]?
    var receivedAchievement: [Achievement]?
    var isHistory: Bool = true
    
    @IBOutlet weak var tableView: UITableView!
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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToMainView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
    print("됨")
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

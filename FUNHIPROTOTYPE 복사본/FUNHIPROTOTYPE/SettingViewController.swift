//
//  SettingViewController.swift
//  FUNHIPROTOTYPE
//
//  Created by 손영웅 on 2020/10/08.
//

import UIKit

class SettingViewController: UIViewController {

  
    @IBOutlet weak var questLabel1: UILabel!
    @IBOutlet weak var quest1rewardLable: UILabel!
   
    @IBOutlet weak var questLabel2: UILabel!
    @IBOutlet weak var quest2rewardLable: UILabel!

    @IBOutlet weak var questLabel3: UILabel!
    @IBOutlet weak var quest3rewardLable: UILabel!
    
    @IBOutlet weak var totalGoldLabel: UILabel!
    
    @IBOutlet weak var textSizeLabel: UILabel!
    @IBOutlet weak var lineSpacingLabel: UILabel!
    @IBOutlet weak var textStyleSampleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToMainGameViewButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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

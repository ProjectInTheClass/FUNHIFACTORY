//
//  SettingViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/03.
//

import UIKit
import MessageUI

class SettingViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func creditTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "credit")
        vc?.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil)
    }
    @IBAction func bugReportTapped(_ sender: Any) {
        if !MFMailComposeViewController.canSendMail() {return}
                let emailVC = MFMailComposeViewController()
                emailVC.mailComposeDelegate = self
                emailVC.setToRecipients(["funfac@gmail.com"])
                //emailVC.setSubject("제목이 들어갈 자리입니다.")
                //emailVC.setMessageBody("내용이 들어갈 자리입니다", isHTML: false)
                present(emailVC, animated: true, completion: nil)
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

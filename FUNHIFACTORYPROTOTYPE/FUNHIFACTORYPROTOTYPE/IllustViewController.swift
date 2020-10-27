//
//  IllustViewController.swift
//  FUNHIFACTORYPROTOTYPE
//
//  Created by 최서연 on 2020/10/28.
//

import UIKit

class IllustViewController: UIViewController {

    @IBOutlet weak var illustPopUpVIew: UIView!
    @IBOutlet weak var blackFullView: UIView!
    
    @IBOutlet weak var prologueButton: UIButton!
    @IBOutlet weak var ep1Button: UIButton!
    @IBOutlet weak var ep2Button: UIButton!
    @IBOutlet weak var ep3Button: UIButton!
    @IBOutlet weak var prologueView: UIView!
    @IBOutlet weak var ep1View: UIView!
    @IBOutlet weak var ep2View: UIView!
    @IBOutlet weak var ep3View: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.illustPopUpVIew.isHidden = true
        self.blackFullView.isHidden = true
        illustPopUpVIew.layer.shadowColor = UIColor.black.cgColor
        illustPopUpVIew.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        illustPopUpVIew.layer.shadowOpacity = 0.8
        illustPopUpVIew.layer.shadowRadius = 20.0
        self.prologueButton.setTitleColor(UIColor.black, for: .normal)
        self.ep1Button.setTitleColor(UIColor.lightGray, for: .normal)
        self.ep2Button.setTitleColor(UIColor.lightGray, for: .normal)
        self.ep3Button.setTitleColor(UIColor.lightGray, for: .normal)
        self.prologueView.backgroundColor = .black
        self.ep1View.backgroundColor = .lightGray
        self.ep2View.backgroundColor = .lightGray
        self.ep3View.backgroundColor = .lightGray
        // Do any additional setup after loading the view.
    }
    
    @IBAction func textButtonAction(_ sender: Any) {
        self.illustPopUpVIew.isHidden = false
        self.blackFullView.isHidden = false
    }
    
    @IBAction func quitButton(_ sender: Any) {
        self.illustPopUpVIew.isHidden = true
        self.blackFullView.isHidden = true
    }
    
    
    @IBAction func chapterButtonClicked(_ sender: Any) {
        self.prologueButton.setTitleColor(UIColor.black, for: .normal)
        self.ep1Button.setTitleColor(UIColor.lightGray, for: .normal)
        self.ep2Button.setTitleColor(UIColor.lightGray, for: .normal)
        self.ep3Button.setTitleColor(UIColor.lightGray, for: .normal)
        self.prologueView.backgroundColor = .black
        self.ep1View.backgroundColor = .lightGray
        self.ep2View.backgroundColor = .lightGray
        self.ep3View.backgroundColor = .lightGray
        
        
    }
    
    @IBAction func chapter1ButtonClicked(_ sender: Any) {
        self.prologueButton.setTitleColor(UIColor.lightGray, for: .normal)
        self.ep1Button.setTitleColor(UIColor.black, for: .normal)
        self.ep2Button.setTitleColor(UIColor.lightGray, for: .normal)
        self.ep3Button.setTitleColor(UIColor.lightGray, for: .normal)
        self.prologueView.backgroundColor = .lightGray
        self.ep1View.backgroundColor = .black
        self.ep2View.backgroundColor = .lightGray
        self.ep3View.backgroundColor = .lightGray
    }
    @IBAction func chapter2ButtonClicked(_ sender: Any) {
        self.prologueButton.setTitleColor(UIColor.lightGray, for: .normal)
        self.ep1Button.setTitleColor(UIColor.lightGray, for: .normal)
        self.ep2Button.setTitleColor(UIColor.black, for: .normal)
        self.ep3Button.setTitleColor(UIColor.lightGray, for: .normal)
        self.prologueView.backgroundColor = .lightGray
        self.ep1View.backgroundColor = .lightGray
        self.ep2View.backgroundColor = .black
        self.ep3View.backgroundColor = .lightGray
    }
    @IBAction func chapter3ButtonClicked(_ sender: Any) {
        self.prologueButton.setTitleColor(UIColor.lightGray, for: .normal)
        self.ep1Button.setTitleColor(UIColor.lightGray, for: .normal)
        self.ep2Button.setTitleColor(UIColor.lightGray, for: .normal)
        self.ep3Button.setTitleColor(UIColor.black, for: .normal)
        self.prologueView.backgroundColor = .lightGray
        self.ep1View.backgroundColor = .lightGray
        self.ep2View.backgroundColor = .lightGray
        self.ep3View.backgroundColor = .black
    }
    /*
    // MARK: - Navigation

     @IBAction func quitIllustPopUpView(_ sender: Any) {
     }
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  MaingameARViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/29.
//

import UIKit
import ARKit
import RealityKit

class MaingameARViewController: UIViewController {

    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var finishARButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        designButton()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let rockAnchor = try! OpenLeaves.load장면()
        let leafAnchor = try! OpenRock.load장면()
        
        arView.scene.anchors.append(rockAnchor)
    }
    func designButton() {
        finishARButton.layer.cornerRadius = 3
        finishARButton.layer.borderWidth = 1.5
        finishARButton.layer.borderColor = UIColor(red: 0.106, green: 0.157, blue: 0.22, alpha: 1).cgColor
    }

    @IBAction func finishARButtonAction(_ sender: Any) {
        //arView.session.pause()
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
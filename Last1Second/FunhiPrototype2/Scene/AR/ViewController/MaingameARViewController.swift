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
    
    let groundAnchor = try! HidePocketInGround.loadGround()
    let rocksAnchor = try! HidePocketBetweenRocks.loadRock()
    
    var recievedAR: ARID?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {

        if let recievedAR = recievedAR {
            switch recievedAR {
            case .hidePocketInGround:
                arView.scene.anchors.append(groundAnchor)
            case .hidePocketBetweenRocks:
                arView.scene.anchors.append(rocksAnchor)
          
            }
        } else {
            print("**AR 콘텐츠 존재하지 않음**")
        }
       
        
      

      
    }
    
    
    func designButton() {
        finishARButton.layer.cornerRadius = 3
        finishARButton.layer.borderWidth = 1.5
        finishARButton.layer.borderColor = UIColor(red: 0.106, green: 0.157, blue: 0.22, alpha: 1).cgColor
    }

    @IBAction func finishARButtonAction(_ sender: Any) {

 //   arView.session.pause()

    self.navigationController?.popViewController(animated: true)
    }
}



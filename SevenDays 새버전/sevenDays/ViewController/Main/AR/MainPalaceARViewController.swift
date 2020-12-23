//
//  MainCreditARViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/12/16.
//

import UIKit
import RealityKit
import ARKit

class MainPalaceARViewController: UIViewController,  ARSessionDelegate  {

   
    @IBOutlet weak var arView: ARView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let palaceAnchor = try!FunhiImageAr.load장면()
        arView.scene.anchors.append(palaceAnchor)
        
    }
    @IBAction func backAction(_ sender: Any) {
      //  arView.session.pause()
        self.navigationController?.popViewController(animated: true)
    }
    
}

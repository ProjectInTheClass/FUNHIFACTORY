//
//  MainCreditARViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/12/16.
//

import UIKit
import RealityKit
import ARKit

class MainCreditARViewController: UIViewController,  ARSessionDelegate  {

  
    @IBOutlet weak var arView: ARView!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let funhiAhchor = try! FunhiOpening.loadIntroduce()
        
      
          
         
        arView.scene.anchors.append(funhiAhchor)
    
       
    }
    
    @IBAction func arButtonAction(_ sender: Any) {
        arView.session.pause()
        self.navigationController?.popViewController(animated: true)
    }
 

}

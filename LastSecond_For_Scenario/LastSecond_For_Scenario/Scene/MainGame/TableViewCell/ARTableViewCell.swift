//
//  ARTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/13.
//

import UIKit

protocol ArDelegate: AnyObject {
    func goToAR(arid: ArId)
}

class ARTableViewCell: UITableViewCell {

    var currentAR: ArId?
    @IBOutlet weak var chatBox: UIView!
    @IBOutlet weak var chatLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        chatLabel.text = "AR로 이동하기"
        chatBox.layer.cornerRadius = 10
        chatBox.layer.borderWidth = 3
        chatBox.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    }
    var delegate : ArDelegate?
    @IBAction func goToARView(_ sender: Any) {
    
        if let currentAR = currentAR {
            delegate?.goToAR(arid: currentAR)
        } else {
            print("AR 셀 내부에 저장된 콘텐츠 없음")
        }
        
    
      
    }
    
}

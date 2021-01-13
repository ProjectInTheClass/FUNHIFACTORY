//
//  ARTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/13.
//

import UIKit

protocol arDelegate:AnyObject {
    func goToAR()
}
class ARTableViewCell: UITableViewCell {

    @IBOutlet weak var chatBox: UIView!
    @IBOutlet weak var chatLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        chatLabel.text = "AR로 이동하기"
        chatBox.layer.cornerRadius = 10
        chatBox.layer.borderWidth = 3
        chatBox.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    }
    var delegate : arDelegate?
    @IBAction func goToARView(_ sender: Any) {
        delegate?.goToAR()
    }
    
}

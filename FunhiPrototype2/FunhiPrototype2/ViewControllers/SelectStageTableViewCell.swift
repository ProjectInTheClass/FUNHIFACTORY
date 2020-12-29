//
//  SelectStageTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/29.
//

import UIKit

class SelectStageTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var episodeYear: UILabel!
    @IBOutlet weak var episodePlace: UILabel!
    @IBOutlet weak var episodePlaceImage: UIImageView!
    @IBOutlet weak var checkBox: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        designButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func designButton() {
       
        cellBackground.layer.borderWidth = 2.5
        cellBackground.layer.borderColor = CGColor(red: 0.106, green: 0.157, blue: 0.22, alpha: 1)
        cellBackground.layer.cornerRadius = 8
           
            var shadows = UIView()
            shadows.frame = cellBackground.frame
            shadows.clipsToBounds = false
        cellBackground.addSubview(shadows)
        
            let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 8)
            let layer0 = CALayer()
            layer0.shadowPath = shadowPath0.cgPath
            layer0.shadowColor = UIColor(red: 0.106, green: 0.157, blue: 0.22, alpha: 1).cgColor
            layer0.shadowOpacity = 1
            layer0.shadowRadius = 0
            layer0.shadowOffset = CGSize(width: 7, height: 7)
            layer0.bounds = shadows.bounds
            layer0.position = shadows.center
            shadows.layer.addSublayer(layer0)
        
        
            checkBox.layer.cornerRadius = 2
        
            checkBox.layer.borderWidth = 2
            checkBox.layer.borderColor = UIColor(red: 0.106, green: 0.157, blue: 0.22, alpha: 1).cgColor
        
    }

}

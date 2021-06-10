//
//  SavepointHeaderFooterView.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/03/18.
//

import UIKit

class CheckPointHeaderFooterView: UITableViewHeaderFooterView {
    @IBOutlet var sectionImageView: UIImageView!
    @IBOutlet var sectionLabel: UILabel!
    
}

class CheckPointHeaderFooterView2: UITableViewHeaderFooterView {

    @IBOutlet var sectionIconView: UIView!
    @IBOutlet var sectionLabel: UILabel!
    @IBOutlet var sectionView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sectionView.layer.borderWidth = 1
        sectionView.layer.borderColor = UIColor.white.cgColor
    }
}

//
//  ImageTableViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2020/12/29.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet var unTouchableImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func imageUpdate(mainImage:String){
           unTouchableImage.image = UIImage(named: mainImage)
       }
}

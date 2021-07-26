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
    func imageUpdate(mainImage:String, godchat : Bool){
        switch godchat {
        case true:
            backgroundColor = UIColor(red: 0.545, green: 0.631, blue: 0.71, alpha: 1)
        case false:
            backgroundColor =  UIColor(red: 0.07, green: 0.15, blue: 0.22, alpha: 1)
        }
        print("<현재 출력될 이미지 : \(mainImage)>")
        guard mainImage != "" else {return}
           unTouchableImage.image = UIImage(named: mainImage)
       }
}

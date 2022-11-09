//
//  SelectStageTableViewCell.swift
//  LastSecond_For_Scenario
//
//  Created by 최서연 on 2022/11/10.
//

import UIKit

class SelectStageTableViewCell: UITableViewCell {
  @IBOutlet weak var cellBackground: UIView!
  @IBOutlet weak var episodeYear: UILabel!
  @IBOutlet weak var episodePlace: UILabel!
  @IBOutlet weak var episodePlaceImage: UIImageView!
  @IBOutlet weak var leftBox: UIView!
  @IBOutlet weak var lockedView: UIView!
  @IBOutlet var progressBackgroundView: UIView!
  @IBOutlet var progressView: CircularProgressView!

  override func awakeFromNib() {
    super.awakeFromNib()
    designButton()
     
    func designButton() {
      lockedView.layer.cornerRadius = 12
      leftBox.layer.cornerRadius = 8
      leftBox.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
      cellBackground.layer.cornerRadius = 8
       
      progressView.trackColor = UIColor(red: 0.333, green: 0.429, blue: 0.529, alpha: 1)
      progressView.progressColor = UIColor(red: 0.78, green: 0.89, blue: 1, alpha: 1)
      progressView.centerCircleColor = UIColor(red: 0.521, green: 0.646, blue: 0.771, alpha: 1)
      
      progressView.finishImageView.layer.cornerRadius = 3
      progressView.finishImageView.setShadow(color: UIColor(red: 1, green: 1, blue: 1, alpha: 1), x: 0, y: 0, opacity: 1, radius: 5)
      progressView.progressNumberString.font = UIFont(name: "NanumSquareEB", size: 10)
      
      progressBackgroundView.setShadow(color: UIColor(red: 0.325, green: 0.455, blue: 0.584, alpha: 1), x: 0, y: 0, opacity: 1, radius: 4)
    }
  }
  
  
}

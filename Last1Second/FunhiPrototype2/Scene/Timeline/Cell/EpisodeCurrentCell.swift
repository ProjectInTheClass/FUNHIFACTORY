//
//  EpisodeCurrentCell.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/07.
//

import UIKit


class EpisodeCurrentCell: UITableViewCell {

  @IBOutlet weak var cellBackground: UIView!
  @IBOutlet weak var episodeYear: UILabel!
  @IBOutlet weak var episodePlace: UILabel!
  @IBOutlet weak var episodePlaceImage: UIImageView!
  @IBOutlet weak var lockedView: UIView!
  @IBOutlet weak var leftBox: UIView!
  @IBOutlet var progressBackgroundView: UIView!
  @IBOutlet var progressView: CircularProgressView!
  @IBOutlet weak var lineTop: NSLayoutConstraint!
  @IBOutlet weak var lineBottom: NSLayoutConstraint!
  
  @IBOutlet weak var titleBox: UIView!
  @IBOutlet weak var smallView: UIView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        designButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func designButton() {
        
      lockedView.layer.cornerRadius = 12
    
      leftBox.layer.cornerRadius = 12
      leftBox.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
      
      cellBackground.layer.cornerRadius = 12
      cellBackground.layer.borderWidth = 4
      cellBackground.layer.borderColor = UIColor(red: 0.817, green: 0.87, blue: 0.933, alpha: 1).cgColor
      cellBackground.setShadow(color: UIColor(red: 0.478, green: 0.569, blue: 0.659, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 6)
       
      progressView.trackColor = UIColor(red: 0.333, green: 0.429, blue: 0.529, alpha: 1)
      progressView.progressColor = UIColor(red: 0.78, green: 0.89, blue: 1, alpha: 1)
      progressView.centerCircleColor = UIColor(red: 0.521, green: 0.646, blue: 0.771, alpha: 1)
      progressView.finishImageView.layer.cornerRadius = 3
      progressView.finishImageView.setShadow(color: UIColor(red: 1, green: 1, blue: 1, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 5)
      progressView.progressNumberString.font = UIFont(name: "NanumSquareEB", size: 10)
  
      progressBackgroundView.setShadow(color: UIColor(red: 0.325, green: 0.455, blue: 0.584, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 4)
      
      titleBox.setShadow(color: UIColor(red: 0.42, green: 0.498, blue: 0.58, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 4)
      
      smallView.layer.borderWidth = 0.5
      smallView.layer.borderColor = UIColor(red: 0.42, green: 0.498, blue: 0.58, alpha: 1).cgColor
    }
  
  func setLine(indexPathRow index: Int) {
    if index == 0 {
      self.lineTop.constant = 20
      self.lineBottom.constant = 0
    } else if index == 7 {
      self.lineTop.constant = 0
      self.lineBottom.constant = 20
    } else {
      self.lineTop.constant = 0
      self.lineBottom.constant = 0
    }
  }
}

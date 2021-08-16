//
//  ImageViewerViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/08/15.
//

import UIKit

class ImageViewerViewController: UIViewController {

    @IBOutlet weak var spotNameLabel: UILabel!
    @IBOutlet weak var spotImage: UIImageView!
    
    var currentSpotData : Spots = Spots(name: "", images: [], description: "")
    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spotNameLabel.text = "\(currentSpotData.name)"
        spotImage.image = UIImage(named: currentSpotData.images[imageIndex])
        let descriptionGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showDescription(_:)))
        spotImage.addGestureRecognizer(descriptionGesture)
    }
    
    @IBAction func previousImage(_ sender: Any) {
        if imageIndex == 0
        {
            imageIndex = currentSpotData.images.count - 1
            spotImage.image = UIImage(named: currentSpotData.images[imageIndex])
        }
        else
        {
            imageIndex -= 1;
            spotImage.image = UIImage(named: currentSpotData.images[imageIndex])
        }
    }
    @IBAction func nextImage(_ sender: Any) {
        if imageIndex == currentSpotData.images.count - 1
        {
            imageIndex = 0
            spotImage.image = UIImage(named: currentSpotData.images[imageIndex])
        }
        else
        {
            imageIndex += 1;
            spotImage.image = UIImage(named: currentSpotData.images[imageIndex])
        }
    }
    @objc func showDescription(_ gesture: UITapGestureRecognizer)
    {
        let descriptionView = UIView()
        let descriptionLabel = UILabel()

        descriptionLabel.text = currentSpotData.description
        descriptionLabel.textColor = UIColor.white
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.addSubview(descriptionLabel)
        descriptionLabel.centerXAnchor.constraint(equalTo: descriptionView.centerXAnchor).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor).isActive = true
        descriptionView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        descriptionView.tag = 2
        self.view.addSubview(descriptionView)
        descriptionView.fullScreen(to: spotImage)
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        let concern1Gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchDescription(_:)))
        descriptionView.addGestureRecognizer(concern1Gesture)

    }
    @objc func touchDescription(_ gesture: UITapGestureRecognizer)
    {
        for tt in self.view.subviews {
            if tt.tag == 2{
                tt.removeFromSuperview()
            }
        }
    }
}

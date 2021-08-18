//
//  ImageViewerViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/08/15.
//

import UIKit

class ImageViewerViewController: UIViewController {

    @IBOutlet weak var spotNameLabel: UILabel!
    @IBOutlet weak var imageViewCV: UICollectionView!
    
    var currentSpotData : Spots = Spots(name: "", images: [], description: "")
    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewCV.delegate = self
        imageViewCV.dataSource = self
        spotNameLabel.text = "\(currentSpotData.name)"
        self.transitioningDelegate = self
//        spotImage.image = UIImage(named: currentSpotData.images[imageIndex])
//        let descriptionGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showDescription(_:)))
//        spotImage.addGestureRecognizer(descriptionGesture)
    }
    
    @IBAction func previousImage(_ sender: Any) {
        imageViewCV.isPagingEnabled = false
        if imageIndex > 0{
            imageIndex -= 1
            let index = IndexPath.init(item: imageIndex, section: 0)
            imageViewCV.scrollToItem(at: index, at: .left, animated: true)
        }
        else{
            imageIndex = currentSpotData.images.count - 1
            let index = IndexPath.init(item: imageIndex, section: 0)
            imageViewCV.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
        imageViewCV.isPagingEnabled = true
    }
    @IBAction func nextImage(_ sender: Any) {
        imageViewCV.isPagingEnabled = false
        if imageIndex < currentSpotData.images.count - 1{
            imageIndex += 1
            let index = IndexPath.init(item: imageIndex, section: 0)
            imageViewCV.scrollToItem(at: index, at: .right, animated: true)
        }
        else{
            imageIndex = 0
            let index = IndexPath.init(item: imageIndex, section: 0)
            imageViewCV.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
        imageViewCV.isPagingEnabled = true
    }
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @objc func showDescription(_ gesture: UITapGestureRecognizer)
    {
//        let descriptionView = UIView()
//        let descriptionLabel = UILabel()
//
//        descriptionLabel.text = currentSpotData.description
//        descriptionLabel.textColor = UIColor.white
//        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
//        descriptionView.addSubview(descriptionLabel)
//        descriptionLabel.centerXAnchor.constraint(equalTo: descriptionView.centerXAnchor).isActive = true
//        descriptionLabel.centerYAnchor.constraint(equalTo: descriptionView.centerYAnchor).isActive = true
//        descriptionView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
//        descriptionView.tag = 2
//        self.view.addSubview(descriptionView)
//        descriptionView.fullScreen(to: spotImage)
//        descriptionView.translatesAutoresizingMaskIntoConstraints = false
//        let concern1Gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchDescription(_:)))
//        descriptionView.addGestureRecognizer(concern1Gesture)

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

extension   ImageViewerViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentSpotData.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! SpotImageCell
        cell.spotImage.image = UIImage(named: currentSpotData.images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = imageViewCV.frame.size
        return CGSize(width: size.width, height: size.height)
    }
}

class	SpotImageCell : UICollectionViewCell{
    
    @IBOutlet weak var spotImage: UIImageView!
}

extension ImageViewerViewController : UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 0.4, animationType: .MiddleScaleUp)
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 0.01, animationType: .fadeOut)
    }
}

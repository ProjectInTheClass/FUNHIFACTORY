//
//  MapViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/08/15.
//

import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet var spotButtons: [UIButton]!
    @IBOutlet var spotButtonViews: [UIView]!
    
    let spotsName : [Spots] =
        [Spots(name: "돈화문", images: ["donhwamun1", "donhwamun2", "donhwamun3", "donhwamun4"], description: "대충 돈화문 설명하는 글"),
         Spots(name: "금천교", images: ["geumcheongyo1", "geumcheongyo2"], description: "대충 금천교 설명하는 글")]
    var buttonIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitioningDelegate = self
//        let name = player.currentEpisodes[strToIndex(str: player.dayId)].episodeYear
//        mapImage.image = UIImage(named: "\(name)map")
        designInit()
        //현재 플레이어가 있는 전각의 위치를 특정하고, 그에 따른 버튼 ui 변경하기.변경 전용 함수
    }
    
    func getIndexOf(button: UIButton) -> Int? {
        let buttonIndex = spotButtons.firstIndex(of: button)
        return buttonIndex
    }
    
    func designInit()
    {
        for button in spotButtonViews{
            button.layer.cornerRadius = 15
            button.setBolder(color: UIColor(red: 0.348, green: 0.499, blue: 0.625, alpha: 1), width: 2)
            button.setShadow(color: UIColor(red: 0.478, green: 0.62, blue: 0.741, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 5)
        }
        for button in spotButtons{
            button.titleLabel?.minimumScaleFactor = 0.3
            button.titleLabel?.adjustsFontSizeToFitWidth = true
        }
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        if let ex = getIndexOf(button: sender){
            buttonIndex = ex
        }
        performSegue(withIdentifier: "goToImageViewer", sender: nil)
    }
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? ImageViewerViewController else {return}
            secondVC.currentSpotData = spotsName[buttonIndex]
    }
}

extension MapViewController : UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 0.4, animationType: .GoRightPresent)
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 0.4, animationType: .GoLeftDismiss)
    }
}

//
//  ChapterCoverViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/07.
//

import UIKit

class ChapterCoverViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var chapterNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var closeCoverButton: UIButton!
    @IBOutlet weak var tapAndContinueLabel: UILabel!
    @IBAction func closeCoverButtonAction(_ sender: Any) {
        blackView.bounds = self.view.bounds
        blackView.center = self.view.center
        blackView.alpha = 0
        self.view.addSubview(blackView)
        UIView.animate(withDuration: 1.0) {
            self.blackView.alpha = 1
        } completion: { (Bool) in
            let dataToSend = true
            self.blackView.removeFromSuperview()
            self.performSegue(withIdentifier: "goToMainGameSegue", sender: dataToSend)
        }

        
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMainGameSegue" {
            let destination = segue.destination as! mainGameViewController
            if let EPStartTrue = sender as? Bool {
                destination.isStartOfEpisode = EPStartTrue
            }
        }
    }
    @IBOutlet var blackView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.setLineSpacing(lineSpacing: 10.0)
        tapAndContinueLabel.setCharacterSpacing(characterSpacing: 5)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        animateCover()
    }
    func animateCover() {
        backgroundImageView.image = UIImage(named: currentDay().episodeCoverImage)
        yearLabel.text = "\(currentDay().episodeYear)년"
        chapterNameLabel.text = currentDay().episodePlace
        descriptionLabel.text = currentDay().episodeDesciption
        closeCoverButton.isHidden = true
        yearLabel.alpha = 0
        chapterNameLabel.alpha = 0
        descriptionLabel.alpha = 0
        tapAndContinueLabel.alpha = 0
        UIView.animate(withDuration: 1.0, delay: 0.3) {
            self.yearLabel.alpha = 1
        } completion: { (true) in
            UIView.animate(withDuration: 1.0, delay: 0.3) {
                self.chapterNameLabel.alpha = 1
            } completion: { (Bool) in
                UIView.animate(withDuration: 1.0, delay: 0.3) {
                    self.descriptionLabel.alpha = 1
                } completion: { (Bool) in
                    UIView.animate(withDuration: 1.0) {
                        self.tapAndContinueLabel.alpha = 1
                        self.closeCoverButton.isHidden = false
                    }
                }

            }

        }

    }



}

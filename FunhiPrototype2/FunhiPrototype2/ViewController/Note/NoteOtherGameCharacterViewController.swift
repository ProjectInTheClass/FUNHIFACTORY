//
//  NoteOtherGameCharacterViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/01/10.
//

import UIKit

class NoteOtherGameCharacterViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    var recievedGameCharacter: GameCharacter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(recievedGameCharacter)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
//        if let recievedGameCharacter = recievedGameCharacter {
//            gameCharacterImageView.image = UIImage(named: recievedGameCharacter.profileImage)
//            gameCharacterDescriptionLabel.text = recievedGameCharacter.description
//
////
////                likabilityProgressWidth.constant = likabilityBackgroundView.frame.width*CGFloat(recievedGameCharacter.likability)/100
//
//        }
    }
    
   

}

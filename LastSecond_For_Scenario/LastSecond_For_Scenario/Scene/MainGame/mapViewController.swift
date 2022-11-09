//
//  mapViewController.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/13.
//

import UIKit

class mapViewController: UIViewController {

    @IBOutlet var mapImage: UIImageView!
    override func viewWillAppear(_ animated: Bool) {
        let name = player.currentEpisodes[strToIndex(str: player.dayId)].episodeYear
        let imageName = "\(name)map"
        mapImage.image = UIImage(named: imageName)
    }
}

//
//  NoteViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/29.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var noteBackgroundView: UIView!
    @IBOutlet weak var noteCharactersBookmarkView: UIView!
    @IBOutlet weak var noteEpisodesBookmarkView: UIView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designObjects()
        // Do any additional setup after loading the view.
    }
    
    func designObjects() {
       
      
        topBar.layer.shadowColor = UIColor(red: 0, green: 0.11, blue: 0.208, alpha: 1).cgColor
        topBar.layer.shadowOpacity = 1
        topBar.layer.shadowRadius = 26
        topBar.layer.shadowOffset = CGSize(width: 0, height: 12)
        
        noteBackgroundView.layer.backgroundColor = UIColor(red: 0.749, green: 0.631, blue: 0.455, alpha: 1).cgColor
        noteBackgroundView.layer.cornerRadius = 5
        noteBackgroundView.layer.borderWidth = 2
        noteBackgroundView.layer.borderColor = UIColor(red: 0.254, green: 0.205, blue: 0.13, alpha: 1).cgColor
        
        noteCharactersBookmarkView.layer.backgroundColor = UIColor(red: 0.749, green: 0.631, blue: 0.455, alpha: 1).cgColor
        noteCharactersBookmarkView.layer.cornerRadius = 5
        noteCharactersBookmarkView.layer.borderWidth = 2
        noteCharactersBookmarkView.layer.borderColor = UIColor(red: 0.254, green: 0.205, blue: 0.13, alpha: 1).cgColor
        
        noteEpisodesBookmarkView.layer.backgroundColor = UIColor(red: 0.492, green: 0.406, blue: 0.279, alpha: 1).cgColor
        noteEpisodesBookmarkView.layer.cornerRadius = 5
        noteEpisodesBookmarkView.layer.borderWidth = 2
        noteEpisodesBookmarkView.layer.borderColor = UIColor(red: 0.254, green: 0.205, blue: 0.13, alpha: 1).cgColor
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

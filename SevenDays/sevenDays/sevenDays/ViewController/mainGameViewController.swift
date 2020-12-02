//
//  ViewController.swift
//  sevenDays
//
//  Created by 최서연 on 2020/11/25.
//

import UIKit

class mainGameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    @IBOutlet var mainGameTableView: UITableView!
    @IBOutlet var pauseBar: UIView!
    @IBOutlet var resumeButton: UIButton!
    @IBOutlet var homeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainGameTableView.dataSource = self
        self.mainGameTableView.delegate = self
    }

    @IBAction func pause(_ sender: Any) {
        pauseBar.isHidden = false
    }
    @IBAction func goHome(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func resume(_ sender: Any) {
        pauseBar.isHidden = true
    }
    

}


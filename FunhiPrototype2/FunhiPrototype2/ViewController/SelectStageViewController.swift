//
//  SelectStageViewController.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2020/12/29.
//

import UIKit

class SelectStageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testChapters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectStageTableViewCell", for: indexPath) as! SelectStageTableViewCell
        cell.episodePlace.text = testChapters[indexPath.row].episodeName
        cell.episodeYear.text = "\(testChapters[indexPath.row].episodeYear)년"
        cell.episodePlaceImage.image = UIImage(named: testChapters[indexPath.row].episodePlaceImage)
        // 완료/미완료한 체크박스 이미지 이름 : trueClear / falseClear
        cell.checkBox.image = UIImage(named:"\(testChapters[indexPath.row].isCleared)Clear")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 147
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMaingameSegue" {
           let destination =  segue.destination as! mainGameViewController
            if let dataToSend = sender as? Episode {
              //  destination.여기서넘겨줄챕터데이터를니가메인게임뷰컨에저장하기위해만들어진변수 = dataToSend
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataToSend: Episode
        dataToSend = testChapters[indexPath.row]
        self.view.addSubview(selectedPopup)
        
    }
   
    @IBOutlet weak var selectStageTableView: UITableView!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectStageTableView.delegate = self
        selectStageTableView.dataSource = self
        designPopup()
        
        selectedPopup.bounds = self.view.bounds
        selectedPopup.center = self.view.center
        
        // Do any additional setup after loading the view.
    }
    
  
//-----------------팝업창 코드-------------------
    @IBOutlet weak var selectedPopup: UIView!
    @IBOutlet weak var selectedPopupYearLabel: UILabel!
    @IBOutlet weak var selectedPopupTopbar: UIView!
    @IBOutlet weak var selectedPopupPlaceImage: UIImageView!
    @IBOutlet weak var selectedPopupDescriptionLabel: UILabel!
    @IBOutlet weak var selectedPopupStartButtonOutlet: UIButton!
    
    @IBAction func selectedPopupStartButton(_ sender: Any) {
        let dataToSend = ""//나중에 필요한 정보 넣을 것
        performSegue(withIdentifier: "goToMaingameSegue", sender: dataToSend)
    }
    @IBAction func selectedPopupExitButton(_ sender: Any) {
        selectedPopup.removeFromSuperview()
    }
    
    func updatePopup(indexPath: IndexPath) {
        selectedPopupYearLabel.text = testChapters[indexPath.row].episodeYear
    }
    func designPopup() {
        selectedPopup.layer.cornerRadius = 10
        selectedPopup.layer.borderWidth = 2
        selectedPopup.layer.borderColor = UIColor(red: 0.106, green: 0.157, blue: 0.22, alpha: 1).cgColor
        selectedPopup.bounds = self.view.bounds
        selectedPopupStartButtonOutlet.layer.cornerRadius = 3
        selectedPopupStartButtonOutlet.layer.borderWidth = 1.5
        selectedPopupStartButtonOutlet.layer.borderColor = UIColor(red: 0.106, green: 0.157, blue: 0.22, alpha: 1).cgColor
        selectedPopupTopbar.layer.cornerRadius = 10
        selectedPopupTopbar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}

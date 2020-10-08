//
//  MainGameViewController.swift
//  FUNHIPROTOTYPE
//
//  Created by 최서연 on 2020/10/08.
//

import UIKit

class MainGameViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var storyTableView: UITableView!
    
    let sample:[String] = ["한 나라의 왕인 나는 굵은 포승줄로 묶인 채 고개를 떨궜다. 나는 내가 내뱉는 숨 하나하나를 의심했다. 이게 정녕 꿈이 아닌 것인지, 내가 어찌 이런 처지가 되었는지 말이다. 내가 아버지의 미움을 버티면서까지 겨우 이 자리에 섰는데 이리 되어버린 게 현실이 아니기를 바랐다. 날 이렇게 만든 자들을 결코 용서할 수 없다."]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sample.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellToReturn = UITableViewCell()
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "storyCell", for: indexPath) as! StoryTextTableViewCell
        // tableViewCell 투명화
        
        cell.storyLable.text = sample[indexPath.row]
        cell.backgroundColor = .clear
        cellToReturn = cell
        return cellToReturn
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.storyTableView.delegate = self
        self.storyTableView.dataSource = self
        // Do any additional setup after loading the view.
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

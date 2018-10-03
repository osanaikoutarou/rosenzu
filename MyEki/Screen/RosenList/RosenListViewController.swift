//
//  RosenListViewController.swift
//  MyEki
//
//  Created by osanai on 2018/10/03.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class RosenListViewController: UIViewController {
    
    @IBOutlet weak var rosenListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rosenListTableView.delegate = self
        rosenListTableView.dataSource = self
    }

}

extension RosenListViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(with: RosenListTableViewCell.self, for: indexPath)
        cell.nameLabel.text = "山手線"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "RosenDetail", sender: nil)
    }
    
    
}


class RosenListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
}

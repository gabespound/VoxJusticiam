//
//  MainMenuVC.swift
//  Social Justice
//
//  Created by Gabriel Spound on 2/1/17.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import Foundation
import UIKit

class menuOrgCell: UITableViewCell{
    @IBOutlet weak var orgname: UILabel!
}

class MainMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var orgTable: UITableView!
    @IBOutlet weak var orgImage: UIImageView!
    @IBOutlet weak var orgDesc: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var Date: UILabel!
    
    let date = NSDate()
    let formatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = globUs.firstName {
            if let _ = globUs.lastName {
                userName.text = globUs.firstName! + " " + globUs.lastName!
            }
        }
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        self.Date.text = formatter.string(from: date as Date)
        self.orgImage.isHidden = true
        self.orgDesc.isHidden = true
        orgTable.delegate = self
        orgTable.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.orgTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.orgImage.isHidden = false
        self.orgDesc.isHidden = false
        self.orgImage.imageFromServerURL(urlString: (globOA[globUs.organizations[indexPath.row]].iUrl))
        self.orgDesc.text = globOA[globUs.organizations[indexPath.row]].shortDesc
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuorgcell", for: indexPath) as! menuOrgCell
        
        cell.orgname.text = globOA[globUs.organizations[indexPath.row]].acronym
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globUs.organizations.count
    }
    
}

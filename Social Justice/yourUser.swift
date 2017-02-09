//
//  yourUser.swift
//  Social Justice
//
//  Created by Gabriel Spound on 2/1/17.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import Foundation
import UIKit

class UsTagCell: UITableViewCell {
    @IBOutlet weak var tagLabel: UILabel!
    
}

class UsOrgCell: UITableViewCell {
    @IBOutlet weak var orgLabel: UILabel!
    
}

class yourUserVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var profPic: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var bio: UILabel!
    
    @IBOutlet weak var tagTable: UITableView!
    @IBOutlet weak var orgTable: UITableView!
    
    @IBAction func addTag(_ sender: Any) {
    }
    @IBAction func addOrg(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tagTable.delegate = self
        self.tagTable.dataSource = self
        self.orgTable.delegate = self
        self.orgTable.dataSource = self
        
        self.firstName.text = globUs.firstName
        self.lastName.text = globUs.lastName
        self.bio.text = globUs.bio
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.orgTable.reloadData()
        self.tagTable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == self.orgTable) {
            return globUs.organizations.count
        } else {
            return globUs.tags.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == self.orgTable) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "usorgcell", for: indexPath) as! UsOrgCell
            cell.orgLabel.text = globUs.organizations[indexPath.row].acronym
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ustagcell", for: indexPath) as! UsTagCell
            cell.tagLabel.text = globUs.tags[indexPath.row].title
            return cell
        }
    }
    
}

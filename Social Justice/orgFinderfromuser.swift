//
//  orgFinderfromuser.swift
//  Social Justice
//
//  Created by Gabriel Spound on 2/2/17.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import Foundation
import UIKit

class OrgFinderFromUser: UITableViewController {
    
    var filteredOrgs = [Organization]()
    
    override func viewDidLoad() {
        for org in globOA {
            if (org.doesAlign()){
                filteredOrgs.append(org)
            }
        }
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    @IBAction func backtoUser(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredOrgs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "orgcell", for: indexPath) as! OrgCell
        
        cell.orgAcro.text = filteredOrgs[indexPath.row].acronym
        cell.topTag.text = globTA[filteredOrgs[indexPath.row].tags[0]].title
        cell.orgImg.imageFromServerURL(urlString: filteredOrgs[indexPath.row].iUrl)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "userdet", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let guestVC = segue.destination as? orgDetailVC {
            if let iP = self.tableView.indexPathForSelectedRow {
                let tempcell = self.tableView.cellForRow(at: iP) as! OrgCell
                guestVC.image = tempcell.orgImg.image
                guestVC.link = self.filteredOrgs[iP.row].url
                guestVC.org = self.filteredOrgs[iP.row]
            }
        }
    }
}

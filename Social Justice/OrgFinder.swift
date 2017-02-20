//
//  OrgFinder.swift
//  Social Justice
//
//  Created by Gabriel Spound on 19/02/2017.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import Foundation
import UIKit

class OrgCell: UITableViewCell {
    
    @IBOutlet weak var check: UIImageView!
    @IBOutlet weak var orgAcro: UILabel!
    @IBOutlet weak var orgImg: UIImageView!
    @IBOutlet weak var topTag: UILabel!
    
}

class OrgFinder2: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var orgTable: UITableView!
    
    
    @IBOutlet weak var explain: UILabel!
    var filteredOrgs = [Organization]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.orgTable.delegate = self
        self.orgTable.dataSource = self
        for org in globOA {
            if(org.doesAlign()){
                filteredOrgs.append(org)
            }
        }
        
        let myMutableString = NSMutableAttributedString(attributedString: self.explain.attributedText!)
        
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 241.0/255.0, green: 196.0/255.0, blue: 15.0/255.0, alpha: 1), range: NSRange(location:7,length:6))
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 241.0/255.0, green: 196.0/255.0, blue: 15.0/255.0, alpha: 1), range: NSRange(location:32,length:8))
        self.explain.attributedText = myMutableString
        
        self.orgTable.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Background"))
        self.orgTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.orgTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orgcell") as! OrgCell
        cell.orgAcro.text = filteredOrgs[indexPath.row].acronym
        cell.topTag.text = globTA[filteredOrgs[indexPath.row].tags[0]].title
        cell.orgImg.imageFromServerURL(urlString: filteredOrgs[indexPath.row].iUrl)
        cell.selectionStyle = .none
        if (globUs.organizations.contains(filteredOrgs[indexPath.row].index)){
            cell.check.isHidden = false
        } else {
            cell.check.isHidden = true
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredOrgs.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! OrgCell
        if (globUs.organizations.contains(filteredOrgs[indexPath.row].index)){
            cell.check.isHidden = true
            globUs.organizations.remove(at: globUs.organizations.index(of: filteredOrgs[indexPath.row].index)!)
        } else{
            cell.check.isHidden = false
            globUs.organizations.append(filteredOrgs[indexPath.row].index)
        }
        
    }
    
}

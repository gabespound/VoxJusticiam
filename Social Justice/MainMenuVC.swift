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
    @IBOutlet weak var orgTag: UILabel!
    @IBOutlet weak var orgimg: UIImageView!
    @IBOutlet weak var orgdesc: UILabel!
}

class MainMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var orgTable: UITableView!
    var storedIP = IndexPath()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orgTable.delegate = self
        orgTable.dataSource = self
        self.orgTable.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Background"))
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.orgTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        storedIP = indexPath
        self.orgTable.beginUpdates()
        self.orgTable.endUpdates()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (storedIP == indexPath) {
            return 180
        }
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuorgcell", for: indexPath) as! menuOrgCell
        
        cell.orgname.text = globOA[globUs.organizations[indexPath.row]].acronym
        cell.orgTag.text = globTA[globOA[globUs.organizations[indexPath.row]].tags[0]].title
        cell.selectionStyle = .none
        cell.orgdesc.text = globOA[globUs.organizations[indexPath.row]].shortDesc
        cell.orgimg.imageFromServerURL(urlString: globOA[globUs.organizations[indexPath.row]].iUrl)
        cell.orgdesc.sizeToFit()
        let tapRecognizer = UITapGestureRecognizer(target: self, action: Selector("imageTapped:"))
        cell.orgimg.isUserInteractionEnabled = true
        cell.orgimg.addGestureRecognizer(tapRecognizer)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func imageTapped(_ gestureRecognizer: UITapGestureRecognizer){
        let i = globUs.organizations[self.orgTable.indexPathForSelectedRow!.row]
        let link = globOA[i].url
        UIApplication.shared.openURL(link)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globUs.organizations.count
    }
    
}

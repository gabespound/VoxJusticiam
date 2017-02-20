//
//  tagTableVC2.swift
//  Social Justice
//
//  Created by Gabriel Spound on 19/02/2017.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import Foundation
import UIKit

class tagCell: UITableViewCell{
    @IBOutlet weak var check: UIImageView!
    
    @IBOutlet weak var cellLabel: UILabel!

}

class tagTableVC2: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var explain: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var tagTable: UITableView!
    
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tagTable.delegate = self
        self.tagTable.dataSource = self
        
        let myMutableString = NSMutableAttributedString(attributedString: self.explain.attributedText!)
        
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 241.0/255.0, green: 196.0/255.0, blue: 15.0/255.0, alpha: 1), range: NSRange(location:7,length:6))
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 241.0/255.0, green: 196.0/255.0, blue: 15.0/255.0, alpha: 1), range: NSRange(location:32,length:8))
        self.explain.attributedText = myMutableString
        self.tagTable.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Background"))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tagTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tagCell") as! tagCell
        cell.cellLabel.text = globTA[indexPath.row].title
        if(globUs.tags.contains(indexPath.row)){
            cell.check.isHidden = false
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(globUs.tags.contains(indexPath.row)){
            globUs.tags.remove(at: globUs.tags.index(of: indexPath.row)!)
            let myCell = tableView.cellForRow(at: indexPath) as! tagCell
            myCell.check.isHidden = true
        } else {
            globUs.tags.append(indexPath.row)
            let myCell = tableView.cellForRow(at: indexPath) as! tagCell
            myCell.check.isHidden = false
        }
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globTA.count
    }
    
}

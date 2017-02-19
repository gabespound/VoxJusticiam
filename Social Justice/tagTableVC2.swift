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
    
    var filteredTags = [Tag]()
    
    @IBOutlet weak var searchField: customTextField!
    
    @IBOutlet weak var explain: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var tagTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tagTable.delegate = self
        self.tagTable.dataSource = self
        
        let myMutableString = NSMutableAttributedString(attributedString: self.explain.attributedText!)
        
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 241.0/255.0, green: 196.0/255.0, blue: 15.0/255.0, alpha: 1), range: NSRange(location:7,length:6))
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 241.0/255.0, green: 196.0/255.0, blue: 15.0/255.0, alpha: 1), range: NSRange(location:32,length:8))
        self.explain.attributedText = myMutableString
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tagTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        globUs.tags.append(indexPath.row)
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
}

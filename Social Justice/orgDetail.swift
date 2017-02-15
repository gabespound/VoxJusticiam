//
//  orgDetail.swift
//  Social Justice
//
//  Created by Gabriel Spound on 2/1/17.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import Foundation
import UIKit

class orgDetailVC: UIViewController {
    
    var org: Organization? = nil
    
    var image: UIImage? = UIImage()
    
    @IBOutlet weak var orgTitle: UILabel!
    
    @IBOutlet weak var orgDesc: UILabel!
    
    @IBOutlet weak var orgImage: UIImageView!
    
    @IBOutlet weak var tagsLabel: UILabel!
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addOrg(_ sender: Any) {
        if(!globUs.alreadyHasOrg(o: org!)){
            globUs.organizations.append(self.org!.index)
        }
        dismiss(animated: true, completion: nil)
    }
    
    var link = URL(string: "")
    
    func imageTapped(_ gestureRecognizer: UITapGestureRecognizer){
        if let _ = link{
            UIApplication.shared.openURL(link!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.orgImage.image = self.image
        self.orgTitle.text = self.org!.title
        self.orgDesc.text = self.org!.shortDesc
        var tempText = ""
        for tag in self.org!.tags {
            tempText += (globTA[tag].title + "\n")
        }
        self.tagsLabel.text = tempText
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.orgImage.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: Selector("imageTapped:"))
        self.orgImage.addGestureRecognizer(tapRecognizer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

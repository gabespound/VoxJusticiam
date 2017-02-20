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

class yourUserVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var profPic: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var bio: UILabel!
    @IBOutlet weak var back: UIImageView!
    
    @IBOutlet weak var tagTable: UITableView!
    @IBOutlet weak var orgTable: UITableView!
    
    @IBAction func addTag(_ sender: Any) {
    }
    @IBAction func addOrg(_ sender: Any) {
    }
    
    @IBAction func tapGal(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
            
        } else {
            NSLog("No Cam Fam")
        }
    }
    
    @IBAction func tapCam(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
            
        } else {
            NSLog("No Cam Fam")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tagTable.delegate = self
        self.tagTable.dataSource = self
        self.orgTable.delegate = self
        self.orgTable.dataSource = self
        self.orgTable.backgroundColor = UIColor.clear
        self.tagTable.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Background"))
        if let fN = globUs.firstName{
            if let lN = globUs.lastName{
                self.firstName.text = fN + " " + lN
            }
        }
        self.bio.text = globUs.bio
        self.profPic.setRounded()
        if let img = globUs.img{
            if img.size != UIImage().size{
                self.profPic.image = img
            }
        }
        self.view.sendSubview(toBack: self.back)
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
            cell.orgLabel.text = globOA[globUs.organizations[indexPath.row]].acronym
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ustagcell", for: indexPath) as! UsTagCell
            cell.tagLabel.text = globTA[globUs.tags[indexPath.row]].title
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView == self.orgTable){
            globUs.organizations.remove(at: indexPath.row)
            self.orgTable.reloadData()
        } else {
            globUs.tags.remove(at: indexPath.row)
            self.tagTable.reloadData()
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: nil)
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        globUs.img = chosenImage
        self.profPic.image = chosenImage
    }
    
}

extension UIImageView{
    func setRounded(){
        let radius = self.frame.width / 2.0
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

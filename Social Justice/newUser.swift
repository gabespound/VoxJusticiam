//
//  ViewController.swift
//  Social Justice
//
//  Created by Gabriel Spound on 1/8/17.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import UIKit

class newUser: UIViewController {
    
    @IBOutlet weak var viewTitleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var lastNamelabel: UILabel!
    @IBOutlet weak var lastTextField: UITextField!
    @IBAction func lastNameDone(_ sender: Any) {
        globUs.lastName = lastTextField.text
    }
    
    
    @IBAction func tagsButton(_ sender: Any) {
    }
    
    @IBAction func doneButton(_ sender: Any) {
    }
    
    @IBAction func doneName(_ sender: Any) {
        globUs.firstName = nameTextField.text
    }

    @IBAction func doneBio(_ sender: Any) {
        globUs.bio = bioTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


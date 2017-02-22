//
//  ViewController.swift
//  Social Justice
//
//  Created by Gabriel Spound on 1/8/17.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import UIKit

class newUser: UIViewController, UITextViewDelegate, UITextFieldDelegate{
    
    @IBOutlet weak var viewTitleLabel: UILabel!
    @IBOutlet weak var nameTextField: customTextField!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var lastTextField: customTextField!
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

    func textViewDidBeginEditing(_ textView: UITextView) {
        if(textView.text == "Bio"){
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if(textView.text == ""){
            textView.text = "Bio"
        } else {
            globUs.bio = textView.text
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.lastTextField.delegate = self
        self.bioTextView.delegate = self
        let img = UIImageView(frame: self.bioTextView.bounds)
        img.contentMode = .scaleToFill
        img.image = #imageLiteral(resourceName: "text_field_bio")
        self.bioTextView.backgroundColor = UIColor.clear
        self.bioTextView.addSubview(img)
        self.bioTextView.sendSubview(toBack: img)
        self.bioTextView.textContainerInset.left = 10
        
        var pHFN = NSMutableAttributedString()
        let firstName  = "First Name"
        var pHLN = NSMutableAttributedString()
        let lastName = "Last Name"
        
        pHFN = NSMutableAttributedString(string:firstName, attributes: [NSFontAttributeName:UIFont(name: "Avenir", size: 17.0)!])
        pHFN.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range:NSRange(location:0, length:firstName.characters.count))
        self.nameTextField.attributedPlaceholder = pHFN
        
        pHLN = NSMutableAttributedString(string:lastName, attributes: [NSFontAttributeName:UIFont(name: "Avenir", size: 17.0)!])
        pHLN.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range:NSRange(location:0, length:lastName.characters.count))
        self.lastTextField.attributedPlaceholder = pHLN
        
        self.bioTextView.text = "Bio"
        self.bioTextView.textColor = UIColor.white
        self.nameTextField.returnKeyType = UIReturnKeyType.done
        self.lastTextField.returnKeyType = UIReturnKeyType.done
        self.bioTextView.returnKeyType = UIReturnKeyType.done
//        PHB = NSMutableAttributedString(string:bioString, attributes: [NSFontAttributeName:UIFont(name: "Avenir", size: 17.0)!])
//        PHB.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range:NSRange(location:0, length:bioString.characters.count))
//        self.bioTextField.attributedPlaceholder = PHB
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func saveuser() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(globUs, toFile: User.archiveURL.path)
        if isSuccessfulSave {
            print("Meals, saved")
        } else {
            print("fail save")
        }
    }
    
}


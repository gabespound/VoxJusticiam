//
//  User.swift
//  Social Justice
//
//  Created by Gabriel Spound on 1/30/17.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import Foundation
import UIKit
class User: NSObject{
    var firstName: String?
    var lastName: String?
    var bio: String?
    var tags: [Tag]
    var organizations: [Organization]
    var img: UIImage
    
    init(n: String, l: String, b: String) {
        self.firstName = n
        self.lastName = l
        self.bio = b
        self.tags = [Tag]()
        self.organizations = [Organization]()
        self.img = UIImage()
    }

    override init(){
        self.firstName = nil
        self.lastName = nil
        self.bio = nil
        self.tags = [Tag]()
        self.organizations = [Organization]()
        self.img = UIImage()
    }
    
    func alreadyHasTag(t: Tag) -> Bool{
        let text = t.title
        for name in self.tags {
            if(text == name.title) {
                return true
            }
        }
        return false
    }
    
    func alreadyHasOrg(o: Organization) -> Bool{
        let text = o.title
        for name in self.organizations {
            if (text == name.title){
                return true
            }
        }
        return false
    }
    
}

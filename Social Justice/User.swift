//
//  User.swift
//  Social Justice
//
//  Created by Gabriel Spound on 1/30/17.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import Foundation
import UIKit
import os.log

class User: NSObject, NSCoding{
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
    
    struct coderKey {
        static let fName = "fName"
        static let lName = "lName"
        static let bio = "bio"
        static let tags = "tags"
        static let orgs = "orgs"
        static let img = "img"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.firstName, forKey: coderKey.fName)
        aCoder.encode(self.lastName, forKey: coderKey.lName)
        aCoder.encode(self.bio, forKey: coderKey.bio)
        aCoder.encode(self.tags, forKey: coderKey.tags)
        aCoder.encode(self.organizations, forKey: coderKey.orgs)
        aCoder.encode(self.img, forKey: coderKey.img)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        if let fName = aDecoder.decodeBool(forKey: coderKey.fName) as? String else {
            self.firstName = fName
        }else{
            return nil
        }
        return nil
    }
}

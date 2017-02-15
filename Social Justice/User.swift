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
    var tags = [Int]()
    var organizations = [Int]()
    var img: UIImage?
    
    init(n: String, l: String, b: String, t: [Int], o: [Int], i: UIImage) {
        self.firstName = n
        self.lastName = l
        self.bio = b
        self.img = UIImage()
        if(t.count != 0){
            self.tags = t
        } else if (o.count != 0) {
            self.organizations = o
        }
    }

    override init(){
        self.firstName = nil
        self.lastName = nil
        self.bio = nil
        self.img = UIImage()
    }
    
    func alreadyHasTag(t: Int) -> Bool{
        for i in self.tags {
            if(globTA[t].title == globTA[i].title) {
                return true
            }
        }
        return false
    }
    
    func alreadyHasOrg(o: Organization) -> Bool{
        let text = o.title
        for i in self.organizations {
            if (text == globOA[i].title){
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
    
    static var DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let archiveURL = DocumentsDirectory.appendingPathComponent("user")
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let firstNam = aDecoder.decodeObject(forKey: coderKey.fName) as? String else {
            print("trouble decoding first name")
            return nil
        }
        guard let lastNam = aDecoder.decodeObject(forKey: coderKey.lName) as? String else {
            print("trouble decoding last name")
            return nil
        }
        guard let bi = aDecoder.decodeObject(forKey: coderKey.bio) as? String else {
            print("trouble decoding bio")
            return nil
        }
        guard let tag = aDecoder.decodeObject(forKey: coderKey.tags) as? [Int] else {
            print("trouble decoding tags")
            return nil
        }
        guard let organization = aDecoder.decodeObject(forKey: coderKey.orgs) as? [Int] else {
            print("trouble decoding orgs")
            return nil
        }
        guard let im = aDecoder.decodeObject(forKey: coderKey.orgs) as? UIImage else {
            print("trouble decoding img")
            return nil
        }
        self.init(n: firstNam, l: lastNam, b: bi, t: tag, o: organization, i: im)
    }
}

extension NSCoder {
    func decodeString(forKey key: String) -> String{
        return decodeObject(forKey: key) as? String ?? ""
    }
    func decodeData(forKey key: String) -> Data {
        return decodeObject(forKey: key) as? Data ?? Data()
    }
}

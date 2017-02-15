//
//  Organization.swift
//  Social Justice
//
//  Created by Gabriel Spound on 1/30/17.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import Foundation
class Organization: NSObject, NSCoding{
    var title: String
    var acronym: String
    var tags: [Int]
    static var totalOrgs = -1
    var index: Int
    var shortDesc: String
    var iUrl: String
    var url: URL
    
    init(t: String, a: String, tA: [Int], sD: String, u: String, o: String) {
        self.title = t
        self.tags = tA
        self.shortDesc = sD
        self.acronym = a
        self.iUrl = u
        self.url = URL(string: o)!
        Organization.totalOrgs += 1
        self.index = Organization.totalOrgs
    }
    
    func doesAlign() -> Bool{
        
        for i in self.tags {
            for tU in globUs.tags {
                if (globTA[i].equals(t: globTA[tU])){
                    return true
                }
            }
        }
        
        return false
    }
    
    private struct coderKey{
        static let title = "title"
        static let acronym = "acro"
        static let tags = "tags"
        static let desc = "desc"
        static let iURL = "iURL"
        static let url = "url"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: coderKey.title)
        aCoder.encode(self.acronym, forKey: coderKey.acronym)
        aCoder.encode(self.tags, forKey: coderKey.tags)
        aCoder.encode(self.shortDesc, forKey: coderKey.desc)
        aCoder.encode(self.iUrl, forKey: coderKey.iURL)
        aCoder.encode(self.url, forKey: coderKey.url)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let titl = aDecoder.decodeObject(forKey: coderKey.title) as? String else {
            print("trouble decoding title")
            return nil
        }
        guard let acro = aDecoder.decodeObject(forKey: coderKey.acronym) as? String else {
            print("trouble decoding acronym")
            return nil
        }
        guard let tag = aDecoder.decodeObject(forKey: coderKey.tags) as? [Int] else {
            print("trouble decoding tags")
            return nil
        }
        guard let des = aDecoder.decodeObject(forKey: coderKey.desc) as? String else {
            print("trouble decoding desc")
            return nil
        }
        guard let iUR = aDecoder.decodeObject(forKey: coderKey.iURL) as? String else {
            print("trouble decoding iUrl")
            return nil
        }
        guard let ur = aDecoder.decodeObject(forKey: coderKey.url) as? URL else {
            print("trouble decoding url")
            return nil
        }
        self.init(t: titl, a: acro, tA: tag, sD: des, u: iUR, o: ur.absoluteString)
    }
    
    
}

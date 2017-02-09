//
//  Organization.swift
//  Social Justice
//
//  Created by Gabriel Spound on 1/30/17.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import Foundation
class Organization: NSObject {
    var title: String
    var acronym: String
    var tags: [Tag]
    var shortDesc: String
    var iUrl: String
    var url: URL
    
    init(t: String, a: String, tA: [Tag], sD: String, u: String, o: String) {
        self.title = t
        self.tags = tA
        self.shortDesc = sD
        self.acronym = a
        self.iUrl = u
        self.url = URL(string: o)!
    }
    
    func doesAlign() -> Bool{
        
        for t in self.tags {
            for tU in globUs.tags {
                if (t.equals(t: tU)){
                    return true
                }
            }
        }
        
        return false
    }
}

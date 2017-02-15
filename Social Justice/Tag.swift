//
//  Tag.swift
//  Social Justice
//
//  Created by Gabriel Spound on 1/30/17.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import Foundation
class Tag: NSObject, NSCoding{
    var title: String
    static var totalTags = -1
    var index: Int
    
    init(s: String) {
        self.title = s
        Tag.totalTags += 1
        self.index = Tag.totalTags
    }
    
    func equals(t: Tag) -> Bool{
        if(self.title.lowercased() == t.title.lowercased()){
            return true
        } else{
            return false
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: coderKey.title)
    }
    
    private struct coderKey {
        static let title = "title"
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let titl = aDecoder.decodeString(forKey: coderKey.title)
        self.init(s: titl)
    }
    
}

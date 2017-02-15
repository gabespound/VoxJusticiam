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
    
    init(s: String) {
        self.title = s
    }
    
    func equals(t: Tag) -> Bool{
        if(self.title.lowercased() == t.title.lowercased()){
            return true
        } else{
            return false
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: coderKey.title)
    }
    
    private struct coderKey {
        static let title = "title"
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let titl = aDecoder.decodeObject(forKey: coderKey.title) as? String else {
            print("trouble decoding first name")
            return nil
        }
        self.init(s: titl)
    }
    
}

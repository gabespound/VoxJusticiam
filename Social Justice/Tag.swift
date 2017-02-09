//
//  Tag.swift
//  Social Justice
//
//  Created by Gabriel Spound on 1/30/17.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import Foundation
class Tag: NSObject{
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
}

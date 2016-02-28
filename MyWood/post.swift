//
//  post.swift
//  MyWood
//
//  Created by SEBASTIEN MONTIBELLER on 25/02/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    private var _imagePath: String!
    private var _title: String!
    private var _postDesc: String!
    
    var imagePath: String {
        return _imagePath
    }
    
    var title: String {
        return _title
    }
    
    var postDesc: String {
        return _postDesc
    }
    
    init(imagePath:String, title: String, postDesc: String) {
        self._imagePath = imagePath
        self._title = title
        self._postDesc = postDesc
    }
    
    override init() {
        
    }
    
    required convenience init?(coder adecoder: NSCoder){
        self.init()
        self._imagePath = adecoder.decodeObjectForKey("imagepath") as? String
        self._postDesc = adecoder.decodeObjectForKey("description") as? String
        self._title = adecoder.decodeObjectForKey("title") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey: "imagepath")
        aCoder.encodeObject(self._postDesc, forKey: "description")
        aCoder.encodeObject(self._title, forKey: "title")
    }
    
}
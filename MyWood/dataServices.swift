//
//  dataServices.swift
//  MyWood
//
//  Created by SEBASTIEN MONTIBELLER on 28/02/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    static let instance = DataService()
    let keyPosts = "posts"
    private var _loadedPosts = [Post]()
    
    var loadedPost: [Post]{
        return _loadedPosts
        }
    
    func savedPosts(){
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: keyPosts)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadPosts(){
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(keyPosts) as? NSData {
            if let postSArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
                _loadedPosts = postSArray
            }
            
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postLoaded", object: nil))
    }
    
    
    
    
    
    func saveImageAndCreatePath(image: UIImage) ->String {
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    }
    
    func imageForPath(path: String) -> UIImage?{
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addedPost (post:Post) {
        _loadedPosts.append(post)
        savedPosts()
        loadPosts()
    }
    
    
    func documentsPathForFileName(name: String) ->String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }
    
    
    
    
    }



    


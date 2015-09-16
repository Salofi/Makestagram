//
//  Post.swift
//  Makestagram
//
//  Created by Salofi Tautua'a on 9/11/15.
//  Copyright (c) 2015 Make School. All rights reserved.
//

import UIKit
import Parse

// 1
class Post: PFObject, PFSubclassing {
   
    // 2
    @NSManaged var imageFile: PFFile?
    @NSManaged var user: PFUser?
    var image: UIImage?
    
    
    //Mark: PFSubclassing Protocol
    
    //3
    static func parseClassName() -> String {
        return "Post"
    }
    
    // 4
    override init () {
        super.init()
    }
    
    override class func initialize () {
        var onceToken : dispatch_once_t = 0;
        dispatch_once(&onceToken) {
            // inform Parse about this subclass
            self.registerSubclass()
        }
    }
    
    func uploadPost() {
        // 1
        let imageData = UIImageJPEGRepresentation(image, 0.8)
        let imageFile = PFFile(data: imageData)
        imageFile.save()
        // 2
        self.imageFile = imageFile
        save()
    }
}

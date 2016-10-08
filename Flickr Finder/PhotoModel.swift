//
//  PhotoModel.swift
//  Flicker
//
//  Created by Mohamed Sayed on 05/10/16.
//  Copyright © 2016 Mohamed Sayed. All rights reserved.
//

import Foundation

class PhotoModel    : NSObject {
    var photoUrl    : URL!
    var title       : String!
    var photoID     : String!
    var owner       : String!
    var location    : String!
    var desc        : String!
    
    init(fromPhotoUrl passedPhotoUrl: URL,title passedTitle: String, andPhotoID phID:String){
        photoUrl = passedPhotoUrl
        title = passedTitle
        photoID = phID
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if photoUrl != nil{
            dictionary["photoUrl"] = photoUrl
        }
        if title != nil{
            dictionary["title"] = title
        }
        
        if photoID != nil{
            dictionary["photoID"] = photoID
        }
        
        if owner != nil{
            dictionary["owner"] = photoID
        }
        
        if location != nil{
            dictionary["location"] = photoID
        }
        
        if desc != nil{
            dictionary["desc"] = photoID
        }
        return dictionary
    }
    
}

//
//  FlickrParsingHandler.swift
//  Flickr Finder
//
//  Created by Mohamed Sayed on 08/10/16.
//  Copyright © 2016 Mohamed Sayed. All rights reserved.
//

import Foundation
import FlickrKit

class FlickrParsingHandler {
    
    class func parseSearchResults(withResponse response : [AnyHashable : Any]?) -> [PhotoModel] {
        var allPhotos : [PhotoModel] = []
        if response == nil {
            NSLog("Failed to intialize array")
        }
        else
        {
            DispatchQueue.main.sync(execute: { () -> Void in
                // Pull out the photo urls from the results
                
                let topPhotos = response?["photos"] as? NSDictionary
                if let photoArray = topPhotos?["photo"] as? [[String:AnyObject]]
                {
                    for photoDictionary in photoArray {
                        
                        let photoURL = FlickrKit.shared().photoURL(for: FKPhotoSizeSmall240, fromPhotoDictionary:photoDictionary)
                        let photoTitle = photoDictionary["title"] as? String
                        let photoID = photoDictionary["id"] as? String
                        let photo : PhotoModel! = PhotoModel.init(fromPhotoUrl: photoURL!, title: photoTitle!,andPhotoID:photoID!)
                        
                        allPhotos.append(photo)
                    }
                }
            })
        }
        return allPhotos;
    }
    
    class func parsePhotoInfoResult(withResponse response : [AnyHashable : Any]?, editedPhotoModel: PhotoModel) -> PhotoModel{
        
        if response == nil {
            NSLog("Failed to intialize array")
        }
        else
        {
            DispatchQueue.main.sync(execute: { () -> Void in
                // Pull out the photo urls from the results
                
                if let photoDictionary = response?["photo"] as? [String:AnyObject]
                {
                    let descDictionary = photoDictionary["description"] as? NSDictionary
                    let descContent = descDictionary?["_content"] as? String
                    let photoOwner = photoDictionary["realname"] as? String
                    
                    editedPhotoModel.desc = descContent
                    editedPhotoModel.owner = photoOwner

                }
            })
        }
        return editedPhotoModel
    }
}

//
//  FlickerDataModel.swift
//  Flicker
//
//  Created by Mohamed Sayed on 08/10/16.
//  Copyright © 2016 Mohamed Sayed. All rights reserved.
//

import Foundation
import FlickrKit

class NetworkModel : PhotoGettingWrapper {
    
    static let sharedInstance : NetworkModel = {
        let instance = NetworkModel()
        return instance
    }()
    
    public func searchPhotosWithText(searchText: String , withCompletion: @escaping (_ searchedPhotos: [PhotoModel]) -> Void) {
        
        FlickrKit.shared().call("flickr.photos.search", args: ["text": searchText] , maxCacheAge: FKDUMaxAgeInfinite, completion: { (response, error) -> Void in
            
            let parsedResponse = FlickrParsingHandler.parseSearchResults(withResponse: response)
            withCompletion(parsedResponse)
        })
    }
    
    public func getImageInfoWith(photoID: String, photoModelToGetInfo: PhotoModel ,withCompletion: @escaping (_ returnedPhotoModel: PhotoModel) -> Void) {
        
        FlickrKit.shared().call("flickr.photos.getInfo", args: ["photo_id": photoID] , maxCacheAge: FKDUMaxAgeInfinite, completion: { (response, error) -> Void in
            let parsedphotoModelObject = FlickrParsingHandler.parsePhotoInfoResult(withResponse: response, editedPhotoModel: photoModelToGetInfo)
            withCompletion(parsedphotoModelObject)
        })
    }
}

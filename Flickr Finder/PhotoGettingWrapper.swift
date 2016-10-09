//
//  PhotoGettingWrapper.swift
//  Flickr Finder
//
//  Created by Mohamed Sayed on 08/10/16.
//  Copyright © 2016 Mohamed Sayed. All rights reserved.
//

import Foundation

class PhotoGettingWrapper {
    
    class func searchPhotosWithTextFromNetwork(searchText: String , withCompletion: @escaping (_ searchedPhotos: [PhotoModel]) -> Void) {
        
        NetworkModel.sharedInstance.searchPhotosWithText(searchText: searchText, withCompletion:withCompletion)
    }
}

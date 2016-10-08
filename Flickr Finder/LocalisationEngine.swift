//
//  LocalisationEngine.swift
//  Flickr Finder
//
//  Created by Mohamed Sayed on 09/10/16.
//  Copyright © 2016 Mohamed Sayed. All rights reserved.
//

import Foundation


class LocalisationEngine {
    //Any localisation functions should be done here
}

extension String {
    func localizedWithComment(comment:String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }
}

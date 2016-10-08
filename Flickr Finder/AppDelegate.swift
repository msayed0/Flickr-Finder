//
//  AppDelegate.swift
//  Flickr Finder
//
//  Created by Mohamed Sayed on 07/10/16.
//  Copyright © 2016 Mohamed Sayed. All rights reserved.
//

import UIKit
import FlickrKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //Navigationbar color customization
        UIBarButtonItem.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().backgroundColor = UIColor.black
//        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blue]
        
        //FlickrKit
        let apiKey: String! = kAPI_KEY
        let secret: String! = kSECRET
        if (apiKey == nil || secret == nil) {
            print("\n----------------------------------\nYou need to enter your own 'apiKey' and 'secret' in FKAppDelegate for the app to run. \n\nYou can get these from your Flickr account settings.\n----------------------------------\n");
            exit(0);
        } else {
            FlickrKit.shared().initialize(withAPIKey: apiKey, sharedSecret: secret)
        }

        
        return true
    }
    
}


//
//  Flickr_FinderTests.swift
//  Flickr FinderTests
//
//  Created by Mohamed Sayed on 07/10/16.
//  Copyright © 2016 Mohamed Sayed. All rights reserved.
//

import XCTest
@testable import Flickr_Finder

class Flickr_FinderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPhotoInit() {
        let photoUrl = URL.init(string:"https://www.google.nl/")
        
        let photo:PhotoModel = PhotoModel(fromPhotoUrl: photoUrl!,title: "title",andPhotoID: "100")
        
        if photo.photoUrl != photoUrl {
            XCTAssert(false, "URL init error")
        }
            
        else if photo.title != "title" {
            XCTAssert(false, "title init error")
        }
            
        else if photo.photoID != "100" {
            XCTAssert(false, "photoID init error")
        }
            
        else {
            XCTAssert(true, "Initializing is working fine")
        }
        
    }
    func testIfLocalisationIsWorking() {
        let localizedString = "connectionOfflineMessage".localizedWithComment(comment: "Offline Connection Message")
        XCTAssertEqual(localizedString, "Your Connection appears to be offline")
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

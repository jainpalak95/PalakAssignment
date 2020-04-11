//
//  JSONTests.swift
//  PalakAssignmentTests
//
//  Created by Palak jain on 11/04/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import XCTest
@testable import PalakAssignment

class JSONTests: XCTestCase {
   
    var apiManager = APIManager()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
  
  func testGetRequestWithURL() {
      let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
      apiManager.makeGetCall(WSUrl: url){ (response, error) in
      
      //return
    }
    XCTAssert(API_BASE_URL + APIManager.Endpoint.facts.rawValue == url)
  }

   

}

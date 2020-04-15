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
  
  func testFromJsonFile(){
    
    if let path = Bundle.main.path(forResource: "fact", ofType: "json"){
      
      do {
        guard let jsonString = try? String(contentsOfFile: path, encoding: .isoLatin1) else {
          fatalError("Unable to convert fact.json to String")
        }
        
        print("The JSON string is: \(jsonString)")
        
        guard let jsonData = jsonString.data(using: .utf8) else {
          fatalError("Unable to convert fact.json to Data")
        }
        
        guard let jsonDictionary = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:Any] else {
          fatalError("Unable to convert fact.json to JSON dictionary")
        }
        let actualResponse = RootModel(fromDictionary: jsonDictionary )
        XCTAssertEqual(actualResponse.rows.count, 13)
        XCTAssertEqual(actualResponse.title, "About Canada")
        XCTAssertEqual(actualResponse.rows[0].title, "Beavers")
        XCTAssertEqual(actualResponse.rows[1].title, "Flag")
        XCTAssertEqual(actualResponse.rows[1].descriptionField, nil)
      }
    }
  }
  
  
}


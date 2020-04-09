//
//  PalakAssignmentTests.swift
//  PalakAssignmentTests
//
//  Created by Palak jain on 01/04/20.
//  Copyright © 2020 Palak jain. All rights reserved.
//

import XCTest
@testable import PalakAssignment

class PalakAssignmentTests: XCTestCase {
     var controller: ViewController!
  
    override func setUp() {
    controller = ViewController()
     
    }

  func testTableview(){
    XCTAssertNotNil(controller.tblview)
  }
  

  func testTableViewDataSourceProtocol() {
         XCTAssertTrue(controller.conforms(to: UITableViewDataSource.self))
         XCTAssertTrue(controller.responds(to: #selector(controller.tableView(_:numberOfRowsInSection:))))
         XCTAssertTrue(controller.responds(to: #selector(controller.tableView(_:cellForRowAt:))))
     }
  
  func testTableViewCell() {
      let indexPath = IndexPath(row: 0, section: 0)
      controller.tblview.register(ListviewCell.self, forCellReuseIdentifier: "cell")
      let cell = controller.tableView(controller.tblview, cellForRowAt: indexPath) as! ListviewCell
      XCTAssertNotNil(cell)
      let view = cell.contentView
      XCTAssertNotNil(view)
  }
  
  func testTableViewCellHasReuseIdentifier() {
    
      controller.tblview.register(ListviewCell.self, forCellReuseIdentifier: "cell")
      let cell = controller.tableView(controller.tblview, cellForRowAt: IndexPath(row: 0, section: 0)) as? ListviewCell
      let actualReuseIdentifer = cell?.reuseIdentifier
      let expectedReuseIdentifier = "cell"
      XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
  }
  
  

}

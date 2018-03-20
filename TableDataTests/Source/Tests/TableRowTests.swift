//
//  TableRowTests.swift
//  TableViewDataTests
//
//  Created by Red Davis on 20/03/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import TableViewData
import XCTest


internal final class TableRowTests: XCTestCase
{
    // MARK: Setup
    
    override func setUp()
    {
        super.setUp()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Tests
    
    internal func testIsEditable()
    {
        let row = TableRow { (_, _) -> UITableViewCell in
            return UITableViewCell()
        }
        
        row.editHandler = { (_, _, _) in
            
        }
        
        // Is editable
        XCTAssert(row.isEditable)
        
        // Not editable
        row.editHandler = nil
        XCTAssertFalse(row.isEditable)
    }
}

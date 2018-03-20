//
//  TableSectionTests.swift
//  TableViewDataTests
//
//  Created by Red Davis on 20/03/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import TableViewData
import XCTest


internal final class TableSectionTests: XCTestCase
{
    // Private
    private var section: TableSection!
    
    // MARK: Setup
    
    override func setUp()
    {
        super.setUp()
        
        let row = TableRow { (tableView, indexPath) -> UITableViewCell in
            return UITableViewCell(style: .default, reuseIdentifier: nil)
        }
        
        self.section = TableSection(rows: [row])
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Tests
    
    internal func testNumberOfRows()
    {
        XCTAssertEqual(self.section.numberOfRows, 1)
    }
    
    internal func testContainsHeaderFooter()
    {
        // No header and footer
        XCTAssertFalse(self.section.containsHeader)
        XCTAssertFalse(self.section.containsFooter)
        
        // Header and footer
        let view = TableHeaderFooter { (tableView, section) -> UITableViewHeaderFooterView in
            return UITableViewHeaderFooterView(reuseIdentifier: nil)
        }
        
        let sectionWithHeaderFooter = TableSection(rows: [], header: view, footer: view, identifier: nil)
        XCTAssert(sectionWithHeaderFooter.containsHeader)
        XCTAssert(sectionWithHeaderFooter.containsFooter)
    }
}

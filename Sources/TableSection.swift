//
//  TableRowData.swift
//  Red Davis
//
//  Created by Red Davis on 10/11/2016.
//  Copyright © 2016 Red Davis. All rights reserved.
//

import UIKit


// MARK: TableSection

public struct TableSection
{
    // Public
    public let identifier: String?
    public let header: TableHeaderFooter?
    public let footer: TableHeaderFooter?
    
    public var numberOfRows: Int {
        return self.rows.count
    }
    
    public var containsHeader: Bool {
        return self.header != nil
    }
    
    public var containsFooter: Bool {
        return self.footer != nil
    }
    
    // Private
    private let rows: [TableRow]
    
    // MARK: Initialization
    
    public init(rows: [TableRow] = [], header: TableHeaderFooter? = nil, footer: TableHeaderFooter? = nil, identifier: String? = nil)
    {
        self.rows = rows
        self.header = header
        self.footer = footer
        self.identifier = identifier
    }
    
    // MARK: Rows
    
    public func row(at index: Int) -> TableRow
    {
        return self.rows[index]
    }
}

// MARK: Equatable

extension TableSection: Equatable
{
    public static func ==(lhs: TableSection, rhs: TableSection) -> Bool
    {
        return lhs.identifier == rhs.identifier
    }
}

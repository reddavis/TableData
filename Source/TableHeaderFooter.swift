//
//  TableHeaderFooter.swift
//  TableData
//
//  Created by Red Davis on 22/01/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import UIKit


public struct TableHeaderFooter
{
    // Public
    public typealias PreparationHandler = (_ tableView: UITableView, _ section: Int) -> UITableViewHeaderFooterView
    public let preparationHandler: PreparationHandler
    
    // MARK: Initialization
    
    public init(preparationHandler: @escaping PreparationHandler)
    {
        self.preparationHandler = preparationHandler
    }
}

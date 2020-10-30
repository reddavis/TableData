//
//  Value1TableViewCell.swift
//  Demo
//
//  Created by Red Davis on 30/01/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import TableViewData
import UIKit


internal final class Value1TableViewCell: TableViewCell
{
    // MARK: Initialization
    
    internal override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    internal required init?(coder aDecoder: NSCoder)
    {
        abort()
    }
}

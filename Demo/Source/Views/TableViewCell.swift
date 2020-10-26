//
//  TableViewCell.swift
//  Red Davis
//
//  Created by Red Davis on 13/01/2017.
//  Copyright © 2017 Red Davis. All rights reserved.
//

import TableViewData
import UIKit


internal class TableViewCell: UITableViewCell, Reusable
{
    // MARK: Initialization
    
    internal override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    internal required init?(coder aDecoder: NSCoder)
    {
        abort()
    }
}

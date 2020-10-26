//
//  TableRow.swift
//  TableData
//
//  Created by Red Davis on 22/01/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import UIKit


public final class TableRow
{
    // Public
    public typealias DequeueHandler = (_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell
    public typealias SelectionHandler = (_ tableView: UITableView, _ indexPath: IndexPath) -> Void
    public typealias DisplayHandler = (_ tableView: UITableView, _ cell: UITableViewCell, _ indexPath: IndexPath) -> Void
    public typealias EditHandler = (_ tableView: UITableView, _ editingStyle: UITableViewCell.EditingStyle, _ indexPath: IndexPath) -> Void

    public let dequeueHandler: DequeueHandler
    public var willDisplayHandler: DisplayHandler?
    public var didSelectHandler: SelectionHandler?
    public var didDeselectHandler: SelectionHandler?
    public var editHandler: EditHandler?

    public var isEditable: Bool {
        return self.editHandler != nil
    }
    
    // MARK: Initialization
    
    public init(dequeueHandler: @escaping DequeueHandler)
    {
        self.dequeueHandler = dequeueHandler
    }
}

//
//  ViewController.swift
//  Demo
//
//  Created by Red Davis on 22/01/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import TableViewData
import UIKit


internal final class ViewController: UIViewController
{
    // Private
    private let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(reusableCell: TableViewCell.self)
        view.register(reusableCell: Value1TableViewCell.self)
        
        return view
    }()
    
    private let tableDataSource = TableDataSource()
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Table view
        self.tableView.delegate = self.tableDataSource
        self.tableView.dataSource = self.tableDataSource
        self.view.addSubview(self.tableView)
        
        // Reload data
        self.reloadData()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Layout
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        self.tableView.frame = self.view.bounds
    }
    
    // MARK: Data
    
    private func reloadData()
    {
        let rowOne = TableRow { (tableView, indexPath) -> UITableViewCell in
            return tableView.dequeueReusableCell(at: indexPath) as TableViewCell
        }
        
        rowOne.willDisplayHandler = { (tableView, cell, indexPath) in
            cell.textLabel?.text = "Hello"
            cell.selectionStyle = .none
        }
        
        // Row two
        let rowTwo = TableRow { (tableView, indexPath) -> UITableViewCell in
            return tableView.dequeueReusableCell(at: indexPath) as TableViewCell
        }
        
        rowTwo.willDisplayHandler = { (tableView, cell, indexPath) in
            cell.textLabel?.text = "Hello 2"
        }
        
        rowTwo.didSelectHandler = { (tableView, indexPath) in
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        // Row three
        let rowThree = TableRow { (tableView, indexPath) -> UITableViewCell in
            return tableView.dequeueReusableCell(at: indexPath) as Value1TableViewCell
        }
        
        rowThree.willDisplayHandler = { (tableView, cell, indexPath) in
            cell.textLabel?.text = "Hello 3"
            cell.detailTextLabel?.text = "detail text"
            cell.selectionStyle = .none
        }
        
        // Section
        let section = TableSection(rows: [rowOne, rowTwo, rowThree])
        self.tableDataSource.sections = [section]
        self.tableView.reloadData()
    }
}

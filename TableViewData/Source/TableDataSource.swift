//
//  TableDataSource.swift
//  TableData
//
//  Created by Red Davis on 22/01/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import UIKit


public class TableDataSource: NSObject
{
    // Public
    public var sections = [TableSection]()
}

// MARK: UITableViewDataSource

extension TableDataSource: UITableViewDataSource
{
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        return self.sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.sections[section].numberOfRows
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let section = self.sections[indexPath.section]
        let row = section.row(at: indexPath.row)
        
        return row.dequeueHandler(tableView, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let section = self.sections[indexPath.section]
        let row = section.row(at: indexPath.row)
        row.willDisplayHandler?(tableView, cell, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let sectionData = self.sections[section]
        return sectionData.header?.preparationHandler(tableView, section)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        let sectionData = self.sections[section]
        return sectionData.header == nil ? 0.0 : UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        let sectionData = self.sections[section]
        return sectionData.footer?.preparationHandler(tableView, section)
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        let sectionData = self.sections[section]
        return sectionData.footer == nil ? 0.0 : UITableViewAutomaticDimension
    }
}

// MARK: UITableViewDelegate

extension TableDataSource: UITableViewDelegate
{
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let section = self.sections[indexPath.section]
        let row = section.row(at: indexPath.row)
        row.didSelectHandler?(tableView, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        let section = self.sections[indexPath.section]
        let row = section.row(at: indexPath.row)
        row.didDeselectHandler?(tableView, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        let section = self.sections[indexPath.section]
        let row = section.row(at: indexPath.row)
        return row.isEditable
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        let section = self.sections[indexPath.section]
        let row = section.row(at: indexPath.row)
        row.editHandler?(tableView, editingStyle, indexPath)
    }
}

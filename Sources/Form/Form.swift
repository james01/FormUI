//
//  Form.swift
//  
//
//  Created by James Randolph on 1/26/21.
//

import UIKit

public final class Form {

    let sections: [Section]
    
    var rowAnimation: UITableView.RowAnimation = .fade
    
    var headerView: UIView?
    
    var footerView: UIView?
    
    var rowHeight: CGFloat?
    
    var estimatedRowHeight: CGFloat?
    
    var cellBackgroundColor: UIColor?
    
    public init(@ListBuilder<Section> content: () -> [Section]) {
        self.sections = content()
    }
    
    public func rowAnimation(_ rowAnimation: UITableView.RowAnimation) -> Self {
        self.rowAnimation = rowAnimation
        return self
    }
    
    public func headerView(_ headerView: UIView) -> Self {
        self.headerView = headerView
        return self
    }
    
    public func footerView(_ footerView: UIView) -> Self {
        self.footerView = footerView
        return self
    }
    
    public func rowHeight(_ rowHeight: CGFloat) -> Self {
        self.rowHeight = rowHeight
        return self
    }
    
    public func estimatedRowHeight(_ estimatedRowHeight: CGFloat) -> Self {
        self.estimatedRowHeight = estimatedRowHeight
        return self
    }
    
    public func cellBackgroundColor(_ cellBackgroundColor: UIColor) -> Self {
        self.cellBackgroundColor = cellBackgroundColor
        return self
    }
}

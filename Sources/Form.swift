//
//  Form.swift
//  
//
//  Created by James Randolph on 1/26/21.
//

import UIKit

/// A representation of a form that can be displayed in a table view.
public final class Form {

    let sections: [Section]
    
    var rowAnimation: UITableView.RowAnimation = .fade
    
    var headerView: UIView?
    
    var footerView: UIView?
    
    var rowHeight: CGFloat?
    
    var estimatedRowHeight: CGFloat?
    
    var cellBackgroundColor: UIColor?
    
    /// Initializes a form with the given content.
    /// - Parameter content: The content of the form.
    public init(@ListBuilder<Section> content: () -> [Section]) {
        self.sections = content()
    }
    
    /// Sets the animation to use when adding or removing rows. By default, the form uses a fade animation.
    /// - Parameter rowAnimation: The animation to use when adding or removing rows.
    public func rowAnimation(_ rowAnimation: UITableView.RowAnimation) -> Self {
        self.rowAnimation = rowAnimation
        return self
    }
    
    /// Sets the header view of the underlying table view.
    /// - Parameter headerView: The header view.
    public func headerView(_ headerView: UIView) -> Self {
        self.headerView = headerView
        return self
    }
    
    /// Sets the footer view of the underlying table view.
    /// - Parameter footerView: The footer view.
    public func footerView(_ footerView: UIView) -> Self {
        self.footerView = footerView
        return self
    }
    
    /// Sets the row height of the underlying table view.
    /// - Parameter rowHeight: The row height.
    public func rowHeight(_ rowHeight: CGFloat) -> Self {
        self.rowHeight = rowHeight
        return self
    }
    
    /// Sets the estimated row height of the underlying table view.
    /// - Parameter estimatedRowHeight: The estimated row height.
    public func estimatedRowHeight(_ estimatedRowHeight: CGFloat) -> Self {
        self.estimatedRowHeight = estimatedRowHeight
        return self
    }
    
    /// Sets the background color to apply to all cells in the form.
    /// - Parameter cellBackgroundColor: The background color to apply to all cells.
    public func cellBackgroundColor(_ cellBackgroundColor: UIColor) -> Self {
        self.cellBackgroundColor = cellBackgroundColor
        return self
    }
}

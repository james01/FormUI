//
//  Row.swift
//  
//
//  Created by James Randolph on 1/21/21.
//

import UIKit
import Combine

/// A representation of a row in a table view.
open class Row: Identifiable {

    let cell: UITableViewCell

    var onSelect: ((UITableView, IndexPath) -> Void)?

    var height: CGFloat?
    
    var hidden: Bool = false
    
    var hiddenChanged: PassthroughSubject<Void, Never>?
    
    private var subscriptions = Set<AnyCancellable>()
    
    /// Initializes a row with an instance of a `UITableViewCell`.
    /// - Parameter cell: The cell with which to create the row.
    public init(cell: UITableViewCell) {
        self.cell = cell
    }
    
    /// Initializes a row with a cell of the given style.
    /// - Parameters:
    ///   - style: The cell style with which to create the cell.
    ///   - configure: The closure that configures the cell.
    public init(style: UITableViewCell.CellStyle, _ configure: ((UITableViewCell) -> Void)) {
        self.cell = UITableViewCell(style: style, reuseIdentifier: nil)
        configure(cell)
    }
    
    /// Initializes a row with the given cell class.
    /// - Parameters:
    ///   - cellClass: The class of the cell.
    ///   - configure: The closure that configures the cell.
    public init<Cell: UITableViewCell>(cellClass: Cell.Type, _ configure: ((Cell) -> Void)) {
        let customCell = Cell(style: .default, reuseIdentifier: nil)
        configure(customCell)
        self.cell = customCell
    }
    
    /// Adds an action to perform when the row is selected.
    /// - Parameter handler: The action to perform when the row is selected.
    public func onSelect(handler: @escaping (UITableView, IndexPath) -> Void) -> Self {
        self.onSelect = handler
        return self
    }
    
    /// Sets the height of the row.
    /// - Parameter height: The height to set for the row.
    public func height(_ height: CGFloat) -> Self {
        self.height = height
        return self
    }
    
    /// Shows or hides the row according to values emitted by a publisher.
    /// - Parameter hidden: The publisher to use to control whether the row is hidden.
    public func hidden<T>(_ hidden: T) -> Self where T: Publisher, T.Output == Bool, T.Failure == Never {
        hiddenChanged = PassthroughSubject()
        hidden.sink { (hidden) in
            self.hidden = hidden
            self.hiddenChanged?.send()
        }.store(in: &subscriptions)
        return self
    }
}

extension Row: Hashable {
    public static func == (lhs: Row, rhs: Row) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Row: ListConvertible {
    public func asList() -> [Row] {
        return [self]
    }
}

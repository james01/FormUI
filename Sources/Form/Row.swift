//
//  Row.swift
//  
//
//  Created by James Randolph on 1/21/21.
//

import UIKit
import Combine

open class Row: Identifiable {

    let cell: UITableViewCell

    var onSelect: ((UITableView, IndexPath) -> Void)?

    var height: CGFloat?
    
    var hidden: Bool = false
    
    var hiddenChanged: PassthroughSubject<Void, Never>?
    
    private var subscriptions = Set<AnyCancellable>()

    public init(cell: UITableViewCell) {
        self.cell = cell
    }

    public init(style: UITableViewCell.CellStyle, _ configure: ((UITableViewCell) -> Void)) {
        self.cell = UITableViewCell(style: style, reuseIdentifier: nil)
        configure(cell)
    }

    public init<Cell: UITableViewCell>(cellClass: Cell.Type, _ configure: ((Cell) -> Void)) {
        let customCell = Cell(style: .default, reuseIdentifier: nil)
        configure(customCell)
        self.cell = customCell
    }

    public func onSelect(handler: @escaping (UITableView, IndexPath) -> Void) -> Self {
        self.onSelect = handler
        return self
    }

    public func height(_ height: CGFloat) -> Self {
        self.height = height
        return self
    }

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

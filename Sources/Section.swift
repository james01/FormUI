//
//  Section.swift
//  
//
//  Created by James Randolph on 1/21/21.
//

import UIKit
import Combine

/// A representation of a section in a table view.
public final class Section {
    
    let header: String?
    
    let footer: String?
    
    let rows: [Row]
    
    var hidden: Bool = false
    
    var hiddenChanged: PassthroughSubject<Void, Never>?
    
    private var subscriptions = Set<AnyCancellable>()
    
    /// Initializes a section with the given header, footer, and rows.
    /// - Parameters:
    ///   - header: The header for the section, if any.
    ///   - footer: The footer for the section, if any.
    ///   - content: The content of the section.
    public init(header: String? = nil, footer: String? = nil, @ListBuilder<Row> content: () -> [Row]) {
        self.header = header
        self.footer = footer
        self.rows = content()
    }
    
    /// Shows or hides the section according to values emitted by a publisher.
    /// - Parameter hidden: The publisher to use to control whether the section is hidden.
    public func hidden<T>(_ hidden: T) -> Self where T: Publisher, T.Output == Bool, T.Failure == Never {
        hiddenChanged = PassthroughSubject()
        hidden.sink { (hidden) in
            self.hidden = hidden
            self.hiddenChanged?.send()
        }.store(in: &subscriptions)
        return self
    }
}

extension Section: ListConvertible {
    public func asList() -> [Section] {
        return [self]
    }
}

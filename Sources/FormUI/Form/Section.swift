//
//  Section.swift
//  
//
//  Created by James Randolph on 1/21/21.
//

import UIKit
import Combine

public final class Section {
    
    let header: String?
    
    let footer: String?
    
    let rows: [Row]
    
    var hidden: Bool = false
    
    var hiddenChanged: PassthroughSubject<Void, Never>?
    
    private var subscriptions = Set<AnyCancellable>()
    
    public init(header: String? = nil, footer: String? = nil, @ListBuilder<Row> content: () -> [Row]) {
        self.header = header
        self.footer = footer
        self.rows = content()
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

extension Section: ListConvertible {
    public func asList() -> [Section] {
        return [self]
    }
}

//
//  ForEach.swift
//  
//
//  Created by James Randolph on 2/1/21.
//

import Foundation

public struct ForEach<T> {
    
    let items: [T]
    
    public init(_ data: Range<Int>, content: (Int) -> T) {
        self.items = data.map(content)
    }
    
    public init<Data: CaseIterable>(_ data: Data.Type, content: (Data) -> T) {
        self.items = data.allCases.map(content)
    }
}

extension ForEach: ListConvertible {
    public func asList() -> [T] {
        return items
    }
}

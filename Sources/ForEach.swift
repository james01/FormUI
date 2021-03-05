//
//  ForEach.swift
//  
//
//  Created by James Randolph on 2/1/21.
//

import Foundation

/// A structure that computes items from a static data source, such as an enum.
public struct ForEach<T> {
    
    let items: [T]
    
    /// Creates an instance from a range of values. These values can be used to index an array, for example.
    /// - Parameters:
    ///   - data: The data the `ForEach` instance uses to create items.
    ///   - content: A closure that creates items.
    public init(_ data: Range<Int>, content: (Int) -> T) {
        self.items = data.map(content)
    }
    
    /// Creates an instance from a type conforming to `CaseIterable`, often an enum.
    /// - Parameters:
    ///   - data: The data the `ForEach` instance uses to create items.
    ///   - content: A closure that creates items.
    public init<Data: CaseIterable>(_ data: Data.Type, content: (Data) -> T) {
        self.items = data.allCases.map(content)
    }
}

extension ForEach: ListConvertible {
    public func asList() -> [T] {
        return items
    }
}

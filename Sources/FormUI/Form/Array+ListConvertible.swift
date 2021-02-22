//
//  Array+ListConvertible.swift
//  
//
//  Created by James Randolph on 2/1/21.
//

import Foundation

extension Array: ListConvertible {
    public func asList() -> [Element] {
        return self
    }
}

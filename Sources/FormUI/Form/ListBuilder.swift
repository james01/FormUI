//
//  ListBuilder.swift
//  
//
//  Created by James Randolph on 1/26/21.
//

import Foundation

@_functionBuilder
public struct ListBuilder<T> {
    public static func buildBlock(_ items: T...) -> [T] {
        return items
    }
}

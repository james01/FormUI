//
//  ListBuilder.swift
//  
//
//  Created by James Randolph on 2/1/21.
//

import Foundation

/// Types adopting `ListConvertible` can be represented as an array of elements.
public protocol ListConvertible {
    associatedtype Element
    
    /// Returns an array representation of the conforming instance.
    func asList() -> [Element]
}

/// A custom parameter attribute that constructs arrays from closures.
@_functionBuilder public struct ListBuilder<T> {
    public static func buildBlock() -> [T] {
        return []
    }
    
    public static func buildBlock<Content>(_ content: Content) -> [T] where Content: ListConvertible, Content.Element == T {
        return content.asList()
    }

    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> [T] where C0: ListConvertible, C1: ListConvertible, C0.Element == T, C1.Element == T {
        return [c0.asList(), c1.asList()].flatMap({ $0 })
    }

    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> [T] where C0: ListConvertible, C1: ListConvertible, C2: ListConvertible, C0.Element == T, C1.Element == T, C2.Element == T {
        return [c0.asList(), c1.asList(), c2.asList()].flatMap({ $0 })
    }

    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> [T] where C0: ListConvertible, C1: ListConvertible, C2: ListConvertible, C3: ListConvertible, C0.Element == T, C1.Element == T, C2.Element == T, C3.Element == T {
        return [c0.asList(), c1.asList(), c2.asList(), c3.asList()].flatMap({ $0 })
    }

    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> [T] where C0: ListConvertible, C1: ListConvertible, C2: ListConvertible, C3: ListConvertible, C4: ListConvertible, C0.Element == T, C1.Element == T, C2.Element == T, C3.Element == T, C4.Element == T {
        return [c0.asList(), c1.asList(), c2.asList(), c3.asList(), c4.asList()].flatMap({ $0 })
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> [T] where C0: ListConvertible, C1: ListConvertible, C2: ListConvertible, C3: ListConvertible, C4: ListConvertible, C5: ListConvertible, C0.Element == T, C1.Element == T, C2.Element == T, C3.Element == T, C4.Element == T, C5.Element == T {
        return [c0.asList(), c1.asList(), c2.asList(), c3.asList(), c4.asList(), c5.asList()].flatMap({ $0 })
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> [T] where C0: ListConvertible, C1: ListConvertible, C2: ListConvertible, C3: ListConvertible, C4: ListConvertible, C5: ListConvertible, C6: ListConvertible, C0.Element == T, C1.Element == T, C2.Element == T, C3.Element == T, C4.Element == T, C5.Element == T, C6.Element == T {
        return [c0.asList(), c1.asList(), c2.asList(), c3.asList(), c4.asList(), c5.asList(), c6.asList()].flatMap({ $0 })
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> [T] where C0: ListConvertible, C1: ListConvertible, C2: ListConvertible, C3: ListConvertible, C4: ListConvertible, C5: ListConvertible, C6: ListConvertible, C7: ListConvertible, C0.Element == T, C1.Element == T, C2.Element == T, C3.Element == T, C4.Element == T, C5.Element == T, C6.Element == T, C7.Element == T {
        return [c0.asList(), c1.asList(), c2.asList(), c3.asList(), c4.asList(), c5.asList(), c6.asList(), c7.asList()].flatMap({ $0 })
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> [T] where C0: ListConvertible, C1: ListConvertible, C2: ListConvertible, C3: ListConvertible, C4: ListConvertible, C5: ListConvertible, C6: ListConvertible, C7: ListConvertible, C8: ListConvertible, C0.Element == T, C1.Element == T, C2.Element == T, C3.Element == T, C4.Element == T, C5.Element == T, C6.Element == T, C7.Element == T, C8.Element == T {
        return [c0.asList(), c1.asList(), c2.asList(), c3.asList(), c4.asList(), c5.asList(), c6.asList(), c7.asList(), c8.asList()].flatMap({ $0 })
    }

    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> [T] where C0: ListConvertible, C1: ListConvertible, C2: ListConvertible, C3: ListConvertible, C4: ListConvertible, C5: ListConvertible, C6: ListConvertible, C7: ListConvertible, C8: ListConvertible, C9: ListConvertible, C0.Element == T, C1.Element == T, C2.Element == T, C3.Element == T, C4.Element == T, C5.Element == T, C6.Element == T, C7.Element == T, C8.Element == T, C9.Element == T {
        return [c0.asList(), c1.asList(), c2.asList(), c3.asList(), c4.asList(), c5.asList(), c6.asList(), c7.asList(), c8.asList(), c9.asList()].flatMap({ $0 })
    }
    
    public static func buildIf(_ content: [T]?) -> [T] {
        return content ?? []
    }
    
    public static func buildEither<TrueContent>(first: TrueContent) -> [T] where TrueContent: ListConvertible, TrueContent.Element == T {
        return first.asList()
    }

    public static func buildEither<TrueContent>(second: TrueContent) -> [T] where TrueContent: ListConvertible, TrueContent.Element == T {
        return second.asList()
    }
}

//
//  Sequence+Unique.swift
//  
//
//  Created by Steven Nakhla on 4/16/21.
//

import Foundation

extension Sequence where Element: Hashable {
    
    func unique() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
    
}

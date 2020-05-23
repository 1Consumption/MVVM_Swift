//
//  State.swift
//  PRACTICEMVVM
//
//  Created by 신한섭 on 2020/05/23.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

struct State {
    
    enum EditingStyle {
        case insert(Int, IndexPath)
        case delete(IndexPath)
        case none
    }
    
    var editingStyle: EditingStyle {
        didSet {
            switch editingStyle {
            case let .insert(new, indexPath):
                sortedIntegers.insert(new, at: indexPath.row)
            case let .delete(indexPath):
                sortedIntegers.remove(at: indexPath.row)
            default:
                break
            }
        }
    }
    
    var sortedIntegers: [Int]
    
    func text(at indexPath: IndexPath) -> String {
        return "\(sortedIntegers[indexPath.row])"
    }
}

extension Array where Element == Int {
    func upperBoundary(of integer: Int) -> Int {
        for (index, number) in self.enumerated() {
            if integer <= number {
                return index
            }
        }
        
        return self.count
    }
}

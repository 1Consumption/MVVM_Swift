//
//  ViewModel.swift
//  PRACTICEMVVM
//
//  Created by 신한섭 on 2020/05/23.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

final class ViewModel {
    private(set) var state = State(editingStyle: .none, sortedIntegers: [1, 2, 3]) {
        didSet {
            callback(state)
        }
    }
    
    let callback: (State) -> ()
    
    init(callback: @escaping (State) -> ()) {
        self.callback = callback
    }
    
    func addNewInteger() {
        let integer = Int(arc4random_uniform(10))
        let insertionIndex = state.sortedIntegers.upperBoundary(of: integer)
        state.editingStyle = .insert(integer, IndexPath(row: insertionIndex, section: 0))
    }
    
    func removeInteger(at indexPath: IndexPath) {
        state.editingStyle = .delete(indexPath)
    }
}

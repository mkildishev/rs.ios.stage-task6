//
//  PriorityPair.swift
//  ios.stage-task
//
//  Created by Maksim on 21.06.2021.
//

import Foundation

struct Pair: Hashable {
    let first: Int
    let second: Int
    let pos: Int
    var candidate: Int {
        (second + first) / 2
    }
    var prior: Int {
        candidate - first < second - candidate ? candidate - first : second - candidate
    }
}

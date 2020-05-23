//
//  Clicker.swift
//  Clicker UI
//
//  Created by CJ Willis on 5/22/20.
//  Copyright © 2020 CJ Willis. All rights reserved.
//

import Foundation

/// Model for a Clicker object
struct Clicker {
    var name: String
    var count: Int
    
    init(clickerName: String?, clickerCount: Int?) {
        name = clickerName ?? "Clicker"
        count = clickerCount ?? 0
    }
}

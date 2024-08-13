//
//  Item.swift
//  iCMP
//
//  Created by  유 주연 on 8/13/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

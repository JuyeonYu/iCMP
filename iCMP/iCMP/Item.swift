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

@Model
final class ClipboardContent {
  let string: String
  let os: String

  init(string: String) {
    self.string = string
    self.os = OS.current.rawValue
  }
}


enum OS: String {
  case iOS
  case macOS
  case watchOS
  case tvOS
  case unknown
  
  static var current: OS {
#if os(iOS)
return .iOS
#elseif os(macOS)
    return .macOS
#elseif os(watchOS)
    return .watchOS
#elseif os(tvOS)
    return .tvOS
#else
    return .unknown
#endif

  }
}

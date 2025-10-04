//
//  LocalModel.swift
//  SwiftDataLocalRemoteSample
//
//  Created by Thomas Leese on 04/10/2025.
//

import Foundation
import SwiftData

@Model
final class LocalModel {
  var timestamp: Date

  init(timestamp: Date) {
    self.timestamp = timestamp
  }
}

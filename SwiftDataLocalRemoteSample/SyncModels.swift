//
//  SyncModels.swift
//  SwiftDataLocalRemoteSample
//
//  Created by Thomas Leese on 04/10/2025.
//

import Foundation
import OSLog
import Observation
import SwiftData

let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "SwiftDataLocalRemoteSample")

@Observable
class SyncModels {
  enum State {
    case idle
    case syncing
    case finished
    case failed(Error)
  }

  var state: State = .idle

  @MainActor
  func sync(modelContext: ModelContext) async {
    guard case .idle = state else {
      return
    }

    state = .syncing
    logger.info("Syncing")

    modelContext.insert(LocalModel(timestamp: Date()))
    modelContext.insert(RemoteModel(timestamp: Date()))

    state = .finished
    logger.info("Finished")
  }
}

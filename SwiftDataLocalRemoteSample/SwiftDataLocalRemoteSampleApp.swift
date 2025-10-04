//
//  SwiftDataLocalRemoteSampleApp.swift
//  SwiftDataLocalRemoteSample
//
//  Created by Thomas Leese on 04/10/2025.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataLocalRemoteSampleApp: App {
  var container: ModelContainer

    init() {
      do {
        let fullSchema = Schema([
          LocalModel.self,
          RemoteModel.self,
        ])

        let localSchema = Schema([LocalModel.self])
        let localConfig = ModelConfiguration(schema: localSchema, cloudKitDatabase: .none)

        let remoteSchema = Schema([RemoteModel.self])
        let remoteConfig = ModelConfiguration(schema: remoteSchema, cloudKitDatabase: .automatic)

        container = try ModelContainer(for: fullSchema, configurations: localConfig, remoteConfig)
      } catch {
        fatalError("Failed to configure SwiftData container.")
      }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
        .environment(SyncModels())
    }
}

//
//  ContentView.swift
//  SwiftDataLocalRemoteSample
//
//  Created by Thomas Leese on 04/10/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  @Environment(SyncModels.self) private var syncModels

  @Query private var localModels: [LocalModel]
  @Query private var remoteModels: [RemoteModel]

  var body: some View {
    VStack {
      Text("\(localModels.count) local models")
      Text("\(remoteModels.count) remote models")
    }.task {
      await syncModels.sync(modelContext: modelContext)
    }
  }
}

#Preview {
    ContentView()
}

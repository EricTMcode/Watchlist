//
//  ContentView.swift
//  Watchlist
//
//  Created by Eric on 24/03/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // MARK: - PROPERTIES

    @Environment(\.modelContext) private var modelContext
    @Query private var movies: [Movie]

    var body: some View {
        List {

        }
        .overlay {
            if movies.isEmpty {
                EmptyListView()
            }
        }
    }
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
}

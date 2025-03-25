//
//  WatchlistApp.swift
//  Watchlist
//
//  Created by Eric on 24/03/2025.
//

import SwiftUI
import SwiftData

@main
struct WatchlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Movie.self)
        }
    }
}

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

    @State private var isSheetPresented = false

    var body: some View {
        List {
            ForEach(movies) { movie in
                HStack {
                    Text(movie.title)

                    Spacer()

                    Text(movie.genre.name)
                }
                .swipeActions {
                    Button(role: .destructive) {
                        withAnimation {
                            modelContext.delete(movie)
                            try? modelContext.save()
                        }
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        }
        .overlay {
            if movies.isEmpty {
                EmptyListView()
            }
        }
        // MARK: - SAFE AREA
        .safeAreaInset(edge: .bottom, alignment: .center) {
            Button {
                isSheetPresented.toggle()
            } label: {
                ButtonImageView(symbolName: "plus.circle.fill")
            }
        }
        // MARK: - SHEET
        .sheet(isPresented: $isSheetPresented) {
            NewMovieFormView()
        }
    }
}

#Preview("Sample Data") {
    ContentView()
        .modelContainer(Movie.preview)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
}

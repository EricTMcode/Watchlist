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
    @State private var randomMovie = ""
    @State private var isShowingAlert = false

    // MARK: - FUNCTIONS

    private func randomMovieGenerator() {
        randomMovie = movies.randomElement()!.title
    }

    var body: some View {
        List {
            if !movies.isEmpty {
                Section(
                    header:
                        VStack {
                            Text("Watchlist")
                                .font(.largeTitle.weight(.black))
                                .foregroundStyle(.blue.gradient)
                                .padding()

                            HStack {
                                Label("Title", systemImage: "movieclapper")
                                Spacer()
                                Label("Genre", systemImage: "tag")
                            }
                        }

                ) {
                    ForEach(movies) { movie in
                        HStack {
                            Text(movie.title)
                                .font(.title2.weight(.light))
                                .padding(.vertical, 6)

                            Spacer()
                            
                            Text(movie.genre.name)
                                .font(.footnote.weight(.medium))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 3)
                                .background(
                                    Capsule()
                                        .stroke(lineWidth: 1)
                                )
                                .foregroundStyle(.tertiary)
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
            }
        }
        .overlay {
            if movies.isEmpty {
                EmptyListView()
            }
        }
        // MARK: - SAFE AREA
        .safeAreaInset(edge: .bottom, alignment: .center) {
            HStack {
                if movies.count >= 2 {
                    Button {
                        randomMovieGenerator()
                        isShowingAlert = true
                    } label: {
                        ButtonImageView(symbolName: "arrow.trianglehead.2.clockwise.rotate.90.circle.fill")
                    }
                    .alert(randomMovie, isPresented: $isShowingAlert) {
                        Button("OK", role: .cancel) {}
                    }
                    .accessibilityLabel("Random Movie")
                    .sensoryFeedback(.success, trigger: isShowingAlert)

                    Spacer()
                }

                Button {
                    isSheetPresented.toggle()
                } label: {
                    ButtonImageView(symbolName: "plus.circle.fill")
                }
                .accessibilityLabel("New Movie")
                .sensoryFeedback(.success, trigger: isSheetPresented)
            }
            .padding(.horizontal)
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

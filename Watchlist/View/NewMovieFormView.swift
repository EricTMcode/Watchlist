//
//  NewMovieFormView.swift
//  Watchlist
//
//  Created by Eric on 25/03/2025.
//

import SwiftUI

struct NewMovieFormView: View {
    // MARK: - PROPERTIES

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var title = ""
    @State private var selectedGenre: Genre = .kids

    // MARK: - FUNCTIONS

    private func addNewMovie() {
        let newMovie = Movie(title: title, genre: selectedGenre)
        modelContext.insert(newMovie)
        try? modelContext.save()
        title = ""
        selectedGenre = .kids
    }

    var body: some View {
        Form {
            List {
                // MARK: - HEADER

                Text("What to Watch")
                    .font(.largeTitle.weight(.black))
                    .foregroundStyle(.blue.gradient)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.vertical)

                // MARK: - TITLE

                TextField("Movie Title", text: $title)
                    .textFieldStyle(.roundedBorder)
                    .font(.largeTitle.weight(.light))

                // MARK: - GENRE

                Picker("Genre", selection: $selectedGenre) {
                    ForEach(Genre.allCases) { genre in
                        Text(genre.name)
                            .tag(genre)
                    }
                }

                // MARK: - SAVE BUTTON

                Button {
                    addNewMovie()
                    dismiss()
                } label: {
                    Text("Save")
                        .font(.title2.weight(.medium))
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .buttonBorderShape(.roundedRectangle)

                // MARK: - CANCEL BUTTON

                Button {
                    dismiss()
                } label: {
                    Text("Close")
                        .frame(maxWidth: .infinity)
                }

            }
            .listRowSeparator(.hidden)
        }
    }
}

#Preview {
    NewMovieFormView()
}

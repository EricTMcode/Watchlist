//
//  EmptyListView.swift
//  Watchlist
//
//  Created by Eric on 25/03/2025.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        Circle()
            .fill(.blue.gradient)
            .stroke(.blue.gradient.opacity(0.15), lineWidth: 30)
            .stroke(.blue.gradient.opacity(0.15), lineWidth: 60)
            .stroke(.blue.gradient.opacity(0.15), lineWidth: 90)
            .frame(width: 180)
            .overlay {
                Image(systemName: "movieclapper")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .foregroundStyle(.white)
                    .padding(.top, -6)
            }
    }
}

#Preview("Light") {
    EmptyListView()
}

#Preview("Dark") {
    EmptyListView()
        .preferredColorScheme(.dark)
}

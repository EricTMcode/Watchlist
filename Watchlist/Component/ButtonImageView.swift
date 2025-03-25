//
//  ButtonImageView.swift
//  Watchlist
//
//  Created by Eric on 25/03/2025.
//

import SwiftUI

struct ButtonImageView: View {
    let symbolName: String

    var body: some View {
        Image(systemName: symbolName)
            .resizable()
            .scaledToFit()
            .foregroundStyle(.blue.gradient)
            .padding(8)
            .background(
                Circle()
                    .fill(.ultraThickMaterial)
            )
            .frame(width: 80)
    }
}

#Preview {
    ButtonImageView(symbolName: "plus.circle.fill")
}

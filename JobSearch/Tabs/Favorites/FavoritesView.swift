//
//  FavoritesView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

struct FavoritesView: View {

    @ObservedObject private var coordinator: FavoritesCoordinator

    init(coordinator: FavoritesCoordinator) {
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.customBlack.ignoresSafeArea()

                Text("FavoritesView")
                    .font(.customTitle2)
                    .foregroundStyle(.customWhite)
            }
        }
    }
}

#Preview {
    FavoritesView(coordinator: FavoritesCoordinator())
}

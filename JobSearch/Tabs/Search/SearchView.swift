//
//  SearchView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

struct SearchView: View {

    @ObservedObject private var coordinator: SearchCoordinator

    init(coordinator: SearchCoordinator) {
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.customBlack.ignoresSafeArea()

                Text("SearchView")
                    .font(.customTitle2)
                    .foregroundStyle(.customWhite)
            }
        }
    }
}

#Preview {
    SearchView(coordinator: SearchCoordinator())
}

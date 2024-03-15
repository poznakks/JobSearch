//
//  ResponsesView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

struct ResponsesView: View {

    @ObservedObject private var coordinator: ResponsesCoordinator

    init(coordinator: ResponsesCoordinator) {
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.customBlack.ignoresSafeArea()

                Text("ResponsesView")
                    .font(.customTitle2)
                    .foregroundStyle(.customWhite)
            }
        }
    }
}

#Preview {
    ResponsesView(coordinator: ResponsesCoordinator())
}

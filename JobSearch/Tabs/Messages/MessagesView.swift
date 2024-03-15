//
//  MessagesView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

struct MessagesView: View {

    @ObservedObject private var coordinator: MessagesCoordinator

    init(coordinator: MessagesCoordinator) {
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.customBlack.ignoresSafeArea()

                Text("MessagesView")
                    .font(.customTitle2)
                    .foregroundStyle(.customWhite)
            }
        }
    }
}

#Preview {
    MessagesView(coordinator: MessagesCoordinator())
}

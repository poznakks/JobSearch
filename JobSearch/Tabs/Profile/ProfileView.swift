//
//  ProfileView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

struct ProfileView: View {

    @ObservedObject private var coordinator: ProfileCoordinator

    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.customBlack.ignoresSafeArea()

                Text("ProfileView")
                    .font(.customTitle2)
                    .foregroundStyle(.customWhite)
            }
        }
    }
}

#Preview {
    ProfileView(coordinator: ProfileCoordinator())
}

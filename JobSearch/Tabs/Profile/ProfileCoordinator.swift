//
//  ProfileCoordinator.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

final class ProfileCoordinator: Coordinator {

    @Published var path = NavigationPath()

    @ViewBuilder
    func view() -> some View {
        ProfileView(coordinator: self)
    }
}

//
//  LoginCoordinator.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 16.03.2024.
//

import SwiftUI

final class LoginCoordinator: Coordinator {

    @Published var path = NavigationPath()

    @ViewBuilder
    func view() -> some View {
        SearchView(coordinator: SearchCoordinator())
    }
}

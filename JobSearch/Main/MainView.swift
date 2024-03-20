//
//  MainView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

struct MainView: View {

    let coordinator: MainCoordinator
    @ObservedObject var loginViewModel: LoginViewModel

    var body: some View {
        TabView {
            tabItem(
                coordinator: coordinator.searchCoordinator(),
                page: .search
            )

            tabItem(
                coordinator: coordinator.favoritesCoordinator(),
                page: .favorites
            )

            tabItem(
                coordinator: coordinator.responsesCoordinator(),
                page: .responses
            )

            tabItem(
                coordinator: coordinator.messagesCoordinator(),
                page: .messages
            )

            tabItem(
                coordinator: coordinator.profileCoordinator(),
                page: .profile
            )
        }
        .onAppear {
            configureTabBarAppearance()
        }
        .fullScreenCover(isPresented: $loginViewModel.showConfirm) {
            loginViewModel.login()
        } content: {
            coordinator.confirmCodeView(email: loginViewModel.emailText)
        }
    }

    private func tabItem(
        coordinator: some Coordinator,
        page: TabBarPage
    ) -> some View {
        loginOrTabView(childCoordinator: coordinator)
            .tabItem {
                page.image
                Text(page.title)
                    .font(.customTabText)
                    .foregroundStyle(.customGrey4)
            }
    }

    @ViewBuilder
    private func loginOrTabView(
        childCoordinator: some Coordinator
    ) -> some View {
        if loginViewModel.isAuthenticated {
            childCoordinator.view()
        } else {
            coordinator.loginView(viewModel: loginViewModel)
        }
    }

    private func configureTabBarAppearance() {
        let standardAppearance = UITabBarAppearance()
        standardAppearance.backgroundColor = .customShadows

        let scrollEdgeAppearance = UITabBarAppearance()
        scrollEdgeAppearance.backgroundColor = .customBlack

        UITabBar.appearance().standardAppearance = standardAppearance
        UITabBar.appearance().scrollEdgeAppearance = scrollEdgeAppearance
    }
}

#Preview {
    MainView(
        coordinator: MainCoordinator(),
        loginViewModel: LoginViewModel()
    )
}

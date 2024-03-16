//
//  MainView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

struct MainView: View {

    let coordinator: MainCoordinator
    @StateObject private var loginViewModel = LoginViewModel()

    var body: some View {
        TabView {
            tabItem(
                coordinator: coordinator.searchCoordinator(),
                page: .search
            )

            tabItem(
                coordinator: coordinator.favoritesCoordinator(),
                page: .favorites,
                badgeCounter: 1
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
        .fullScreenCover(isPresented: $loginViewModel.isAuth) {
            coordinator.confirmCodeView(email: loginViewModel.emailText)
        }
    }

    private func tabItem(
        coordinator: some Coordinator,
        page: TabBarPage,
        badgeCounter: Int = 0
    ) -> some View {
        loginOrTabView()
            .tabItem {
                page.image
                Text(page.title)
                    .font(.customTabText)
                    .foregroundStyle(.customGrey4)
            }
            .badge(badgeCounter)
    }

    @ViewBuilder
    private func loginOrTabView() -> some View {
        if loginViewModel.isAuth {
            coordinator.view()
        } else {
            coordinator.loginView(viewModel: loginViewModel)
        }
    }

    private func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(
            style: .systemUltraThinMaterialDark
        )
        appearance.backgroundColor = .customShadows

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

#Preview {
    MainView(coordinator: MainCoordinator())
}

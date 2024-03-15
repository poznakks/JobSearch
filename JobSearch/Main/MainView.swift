//
//  MainView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

struct MainView: View {

    private let coordinator: MainCoordinator

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }

    var body: some View {
        TabView {
            tabItem(coordinator: coordinator.searchCoordinator(),
                    page: .search)

            tabItem(coordinator: coordinator.favoritesCoordinator(),
                    page: .favorites,
                    badgeCounter: 1)

            tabItem(coordinator: coordinator.responsesCoordinator(),
                    page: .responses)

            tabItem(coordinator: coordinator.messagesCoordinator(),
                    page: .messages)

            tabItem(coordinator: coordinator.profileCoordinator(),
                    page: .profile)
        }
        .onAppear {
            configureTabBarAppearance()
        }
    }

    @MainActor
    private func tabItem(
        coordinator: some Coordinator,
        page: TabBarPage,
        badgeCounter: Int = 0
    ) -> some View {
        coordinator.view()
            .tabItem {
                page.image
                Text(page.title)
                    .font(.customTabText)
                    .foregroundStyle(.customGrey4)
            }
            .badge(badgeCounter)
    }

    @MainActor
    private func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        appearance.backgroundColor = .customShadows

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

#Preview {
    MainView(coordinator: MainCoordinator())
}

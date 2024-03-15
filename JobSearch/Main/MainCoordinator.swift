//
//  MainCoordinator.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

final class MainCoordinator: Coordinator {

    @ViewBuilder
    func view() -> some View {
        MainView(coordinator: self)
    }

    func searchCoordinator() -> SearchCoordinator {
        SearchCoordinator()
    }

    func favoritesCoordinator() -> FavoritesCoordinator {
        FavoritesCoordinator()
    }

    func responsesCoordinator() -> ResponsesCoordinator {
        ResponsesCoordinator()
    }

    func messagesCoordinator() -> MessagesCoordinator {
        MessagesCoordinator()
    }

    func profileCoordinator() -> ProfileCoordinator {
        ProfileCoordinator()
    }
}

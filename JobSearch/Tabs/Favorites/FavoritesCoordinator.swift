//
//  FavoritesCoordinator.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

final class FavoritesCoordinator: Coordinator {

    @Published var path = NavigationPath()

    @ViewBuilder
    func view() -> some View {
        FavoritesView(coordinator: self)
    }
}

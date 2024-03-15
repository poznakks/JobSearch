//
//  MessagesCoordinator.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

final class MessagesCoordinator: Coordinator {

    @Published var path = NavigationPath()

    @ViewBuilder
    func view() -> some View {
        MessagesView(coordinator: self)
    }
}

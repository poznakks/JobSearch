//
//  TabBarPage.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

enum TabBarPage: CaseIterable {
    case search
    case favorites
    case responses
    case messages
    case profile

    var title: String {
        switch self {
        case .search:
            return "Поиск"

        case .favorites:
            return "Избранное"

        case .responses:
            return "Отклики"

        case .messages:
            return "Сообщения"

        case .profile:
            return "Профиль"
        }
    }

    var image: Image {
        switch self {
        case .search:
            return Image(.search)

        case .favorites:
            return Image(.favorite)

        case .responses:
            return Image(.response)

        case .messages:
            return Image(.message)

        case .profile:
            return Image(.profile)
        }
    }

    var tag: Int {
        switch self {
        case .search:
            return 0

        case .favorites:
            return 1

        case .responses:
            return 2

        case .messages:
            return 3

        case .profile:
            return 4
        }
    }
}

extension TabBarPage: Identifiable {
    var id: Int {
        tag
    }
}

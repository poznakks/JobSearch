//
//  SearchCoordinator.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

final class SearchCoordinator: Coordinator {

    enum Destination: Hashable {
        case detail(Vacancy)
    }

    @Published var path = NavigationPath()

    func navigate(to destination: Destination) {
        path.append(destination)
    }

    @ViewBuilder
    func view() -> some View {
        SearchView(coordinator: self)
    }

    @ViewBuilder
    func detailView(vacancy: Vacancy) -> some View {
        VacancyDetailView(vacancy: vacancy)
    }
}

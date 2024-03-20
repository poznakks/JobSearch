//
//  FavoritesCoordinator.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI
import SwiftData

final class FavoritesCoordinator: VacancyCoordinator {

    enum Destination: Hashable {
        case detail(VacancyDatabase)
    }

    @Published var path = NavigationPath()
    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func navigate(to destination: Destination) {
        path.append(destination)
    }

    func navigateBack() {
        path.removeLast()
    }

    func view() -> some View {
        let viewModel = FavoritesViewModel(modelContext: modelContext)
        return FavoritesView(coordinator: self, viewModel: viewModel)
    }

    func vacancyView(vacancy: VacancyDatabase) -> some View {
        let viewModel = VacancyViewModel(vacancy: vacancy, modelContext: modelContext)
        viewModel.parentCoordinator = self
        return VacancyView(viewModel: viewModel)
    }

    func detailView(vacancy: VacancyDatabase) -> some View {
        let viewModel = VacancyViewModel(vacancy: vacancy, modelContext: modelContext)
        viewModel.parentCoordinator = self
        return VacancyDetailView(viewModel: viewModel)
    }
}

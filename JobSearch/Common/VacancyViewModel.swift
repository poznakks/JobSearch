//
//  VacancyViewModel.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 20.03.2024.
//

import Foundation
import SwiftData

@MainActor
final class VacancyViewModel: ObservableObject {

    @Published var vacancy: VacancyDatabase
    weak var parentCoordinator: (any VacancyCoordinator)?
    private let modelContext: ModelContext

    init(vacancy: VacancyDatabase, modelContext: ModelContext) {
        self.vacancy = vacancy
        self.modelContext = modelContext
    }

    func changeFavorite() {
        vacancy.isFavorite.toggle()
    }

    func navigateBack() {
        parentCoordinator?.navigateBack()
    }
}

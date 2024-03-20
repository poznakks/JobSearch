//
//  FavoritesViewModel.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 20.03.2024.
//

import SwiftUI
import SwiftData
import Combine

@MainActor
final class FavoritesViewModel: ObservableObject {

    @Published var vacancies: [VacancyDatabase] = []

    private let modelContext: ModelContext
    private var cancellables: Set<AnyCancellable> = []

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchFavoriteVacancies()
    }

    func fetchFavoriteVacancies() {
        do {
            let descriptor = FetchDescriptor<VacancyDatabase>(
                predicate: #Predicate { $0.isFavorite },
                sortBy: [SortDescriptor(\.index)]
            )
            vacancies = try modelContext.fetch(descriptor)
        } catch {
            fatalError("Cannot fetch favorite vacancies from context")
        }
    }
}

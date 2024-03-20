//
//  SearchViewModel.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 17.03.2024.
//

import SwiftUI
import SwiftData
import Combine

final class SearchViewModel: ObservableObject {

    @Published var vacancies: [VacancyDatabase] = []

    private let modelContext: ModelContext
    private let networkClient = NetworkClient()
    private var cancellables: Set<AnyCancellable> = []

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchRemoteVacancies()
    }

    func fetchVacancies() {
        do {
            let descriptor = FetchDescriptor<VacancyDatabase>(sortBy: [SortDescriptor(\.index)])
            vacancies = try modelContext.fetch(descriptor)
        } catch {
            fatalError("Fetch failed")
        }
    }

    private func fetchRemoteVacancies() {
        networkClient.fetchVacancies()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] vacancies in
                for (index, vacancy) in vacancies.enumerated() {
                    let vacancyDatabase = VacancyDatabase(from: vacancy)
                    vacancyDatabase.index = index
                    self?.modelContext.insert(vacancyDatabase)
                }
//                self?.vacancies = vacancies.map { VacancyDatabase(from: $0) }
                self?.fetchVacancies()
            }
            .store(in: &cancellables)
    }
}

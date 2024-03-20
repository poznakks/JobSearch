//
//  SearchViewModel.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 17.03.2024.
//

import SwiftUI
import SwiftData
import Combine

@MainActor
final class SearchViewModel: ObservableObject {

    @Published var vacancies: [VacancyDatabase] = []

    private let modelContext: ModelContext
    private let networkClient: NetworkClient
    private var cancellables: Set<AnyCancellable> = []

    init(modelContext: ModelContext, networkClient: NetworkClient = DefaultNetworkClient()) {
        self.modelContext = modelContext
        self.networkClient = networkClient
        fetchRemoteVacancies()
    }

    func fetchVacancies() {
        do {
            let descriptor = FetchDescriptor<VacancyDatabase>(sortBy: [SortDescriptor(\.index)])
            vacancies = try modelContext.fetch(descriptor)
        } catch {
            fatalError("Cannot fetch vacancies from context")
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
                self?.fetchVacancies()
            }
            .store(in: &cancellables)
    }
}

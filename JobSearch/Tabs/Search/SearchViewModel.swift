//
//  SearchViewModel.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 17.03.2024.
//

import SwiftUI
import Combine

final class SearchViewModel: ObservableObject {

    @Published var vacancies: [Vacancy] = []

    private let networkClient = NetworkClient()
    private var cancellables: Set<AnyCancellable> = []

    func fetchVacancies() {
        networkClient.fetchVacancies()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] vacancies in
                self?.vacancies = vacancies
            }
            .store(in: &cancellables)
    }
}

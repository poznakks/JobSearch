//
//  NetworkClient.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 17.03.2024.
//

import Foundation
import SwiftData
import Combine

final class NetworkClient {
    func fetchVacancies() -> AnyPublisher<[Vacancy], Never> {
        guard let url = URL(string: "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14") else {
            return Just([]).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Vacancies.self, decoder: JSONDecoder())
            .map(\.vacancies)
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}

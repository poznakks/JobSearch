//
//  Coordinator.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

@MainActor
protocol Coordinator: ObservableObject {

    associatedtype Body: View

    @ViewBuilder
    func view() -> Self.Body
}

@MainActor
protocol VacancyCoordinator: Coordinator {
    func navigateBack()
}

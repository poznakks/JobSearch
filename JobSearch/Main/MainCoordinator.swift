//
//  MainCoordinator.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI
import SwiftData

final class MainCoordinator: Coordinator {

    @Published var path = NavigationPath()
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    private let loginViewModel = LoginViewModel()

    init() {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            self.modelContainer = try ModelContainer(for: VacancyDatabase.self, configurations: config)
            self.modelContext = modelContainer.mainContext
        } catch {
            fatalError("Cannot create model container")
        }
    }

    func view() -> some View {
        MainView(coordinator: self, loginViewModel: loginViewModel)
    }

    func searchCoordinator() -> SearchCoordinator {
        SearchCoordinator(modelContext: modelContext)
    }

    func favoritesCoordinator() -> FavoritesCoordinator {
        FavoritesCoordinator(modelContext: modelContext)
    }

    func responsesCoordinator() -> ResponsesCoordinator {
        ResponsesCoordinator()
    }

    func messagesCoordinator() -> MessagesCoordinator {
        MessagesCoordinator()
    }

    func profileCoordinator() -> ProfileCoordinator {
        ProfileCoordinator()
    }

    func loginView(viewModel: LoginViewModel) -> some View {
        LoginView(viewModel: loginViewModel)
    }

    func confirmCodeView(email: String) -> some View {
        ConfirmCodeView(email: email)
    }
}

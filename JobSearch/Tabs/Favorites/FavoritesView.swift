//
//  FavoritesView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {

    @ObservedObject var coordinator: FavoritesCoordinator
    @ObservedObject var viewModel: FavoritesViewModel

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.customBlack.ignoresSafeArea()

                ScrollView(.vertical) {
                    VStack {
                        title
                            .padding(.bottom, 16)

                        vacanciesCount
                            .padding(.bottom, 24)

                        vacancies

                        Spacer()
                    }
                    .padding(16)
                }
                .clipped()
                .onAppear {
                    viewModel.fetchFavoriteVacancies()
                }
                .navigationDestination(for: FavoritesCoordinator.Destination.self) {
                    switch $0 {
                    case .detail(let vacancy):
                        coordinator.detailView(vacancy: vacancy)
                    }
                }
            }
        }
    }

    private var title: some View {
        HStack {
            Text("FavoritesView")
                .font(.customTitle1)
                .foregroundStyle(.customWhite)
            Spacer()
        }
    }

    private var vacanciesCount: some View {
        HStack {
            Text(String.vacanciesText(viewModel.vacancies.count))
                .font(.customText1)
                .foregroundStyle(.customGrey3)
            Spacer()
        }
    }

    private var vacancies: some View {
        ForEach(viewModel.vacancies) { vacancy in
            coordinator.vacancyView(vacancy: vacancy)
                .onTapGesture {
                    coordinator.navigate(to: .detail(vacancy))
                }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: VacancyDatabase.self, configurations: config)
        let vacancy = VacancyDatabase.sample
        container.mainContext.insert(vacancy)
        return FavoritesView(
            coordinator: FavoritesCoordinator(modelContext: container.mainContext),
            viewModel: FavoritesViewModel(modelContext: container.mainContext))
        .preferredColorScheme(.dark)
    } catch {
        fatalError("Cannot create model container for preview")
    }
}

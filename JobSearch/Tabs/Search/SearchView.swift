//
//  SearchView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI
import SwiftData

struct SearchView: View {

    @ObservedObject var coordinator: SearchCoordinator
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.customBlack.ignoresSafeArea()

                ScrollView(.vertical) {
                    VStack {
                        textFieldAndFilter
                            .padding(.horizontal, 12)
                            .padding(.bottom, 24)

                        suggestionScrollView
                            .padding(.bottom, 8)

                        vacanciesForYouTitle
                            .padding(.horizontal, 12)
                            .padding(.bottom, 8)

                        vacancies
                            .padding(.horizontal, 12)
                            .padding(.bottom, 8)

                        Spacer()
                    }
                }
                .clipped()
                .onAppear {
                    viewModel.fetchVacancies()
                }
                .navigationDestination(for: SearchCoordinator.Destination.self) {
                    switch $0 {
                    case .detail(let vacancy):
                        coordinator.detailView(vacancy: vacancy)
                    }
                }
            }
        }
    }

    private var textFieldAndFilter: some View {
        HStack {
            CustomTextField(
                leftImage: Image(.search),
                placeholder: "Должность, ключевые слова",
                error: false,
                text: .constant("")
            )
            .disabled(true)

            Button {
                print("Filter")
            } label: {
                Image(.filter)
                    .frame(width: 40, height: 40)
                    .background(Color.customGrey2)
                    .clipShape(.rect(cornerRadius: 8))
            }
        }
    }

    private var suggestionScrollView: some View {
        ScrollView(.horizontal) {
            HStack {
                SuggestionView(
                    image: Image(.nearYou),
                    imageBgColor: .customDarkBlue,
                    title: "Вакансии рядом с вами"
                )

                SuggestionView(
                    image: Image(.greenStar),
                    imageBgColor: .customDarkGreen,
                    title: "Поднять резюме в поиске",
                    buttonTitle: "Поднять",
                    buttonColor: .customGreen
                )

                SuggestionView(
                    image: Image(.vacancies),
                    imageBgColor: .customDarkGreen,
                    title: "Временная работа и подработка"
                )
            }
            .padding(.horizontal, 12)
        }
        .scrollIndicators(.never)
    }

    private var vacanciesForYouTitle: some View {
        HStack {
            Text("Вакансии для вас")
                .foregroundStyle(.customWhite)
                .font(.customTitle1)
            Spacer()
        }
    }

    private var vacancies: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.vacancies.prefix(3)) { vacancy in
                coordinator.vacancyView(vacancy: vacancy)
                    .onTapGesture {
                        coordinator.navigate(to: .detail(vacancy))
                    }
            }
            moreVacanciesButton
        }
    }

    private var moreVacanciesButton: some View {
        RectangularButton(
            title: "Eще " + String.vacanciesText(viewModel.vacancies.count - 3),
            font: .customButtonText1,
            bgColor: .customBlue,
            height: 48
        ) {
            print("more vacancies")
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: VacancyDatabase.self, configurations: config)
        return SearchView(
            coordinator: SearchCoordinator(
                modelContext: container.mainContext),
            viewModel: SearchViewModel(modelContext: container.mainContext))
        .preferredColorScheme(.dark)
    } catch {
        fatalError("Cannot create model container for preview")
    }
}

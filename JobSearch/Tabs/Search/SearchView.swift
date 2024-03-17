//
//  SearchView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

struct SearchView: View {

    @ObservedObject var coordinator: SearchCoordinator

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

                        vacanciesScrollView
                            .padding(.horizontal, 12)
                            .padding(.bottom, 8)

                        Spacer()
                    }
                }
                .clipped()
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

    private var vacanciesScrollView: some View {
        ScrollView(.vertical) {
            VStack(spacing: 12) {
                VacancyView(
                    title: "Веб-дизайнер",
                    town: "Казань",
                    company: "Алабуга. Маркетинг и PR",
                    experience: "Без опыта",
                    publishedDate: "2024-02-20",
                    isFavorite: false,
                    salary: "от 60 000 ₽",
                    lookingNumber: 7
                )

                VacancyView(
                    title: "Веб-дизайнер",
                    town: "Казань",
                    company: "Алабуга. Маркетинг и PR",
                    experience: "Без опыта",
                    publishedDate: "2024-02-20",
                    isFavorite: false,
                    salary: "от 60 000 ₽",
                    lookingNumber: 7
                )

                VacancyView(
                    title: "Веб-дизайнер",
                    town: "Казань",
                    company: "Алабуга. Маркетинг и PR",
                    experience: "Без опыта",
                    publishedDate: "2024-02-20",
                    isFavorite: false,
                    salary: "от 60 000 ₽",
                    lookingNumber: 7
                )

                moreVacanciesButton
            }
        }
    }

    private var moreVacanciesButton: some View {
        RectangularButton(
            title: "Eще 3 вакансии",
            font: .customButtonText1,
            bgColor: .customBlue,
            height: 48
        ) {
            print("more vacancies")
        }
    }
}

#Preview {
    SearchView(coordinator: SearchCoordinator())
}

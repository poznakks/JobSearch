//
//  VacancyView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 17.03.2024.
//

import SwiftUI
import SwiftData

struct VacancyView: View {

    @ObservedObject var viewModel: VacancyViewModel

    var body: some View {
        VStack(spacing: 10) {
            lookingNumberTitle

            jobTitle
                .padding(.trailing, 40)

            salaryTitle

            townTitle

            companyTitle

            experienceTitle

            publishedDateTitle
                .padding(.bottom, 12)

            RoundedButton(title: "Отклинуться", action: {})
        }
        .padding(16)
        .background(Color.customGrey1)
        .clipShape(.rect(cornerRadius: 8))
        .overlay {
            markAsFavoriteButton
        }
    }

    private var lookingNumberTitle: some View {
        HStack {
            if let lookingNumber = viewModel.vacancy.lookingNumber {
                Text("Cейчас просматривает " + String.peopleText(lookingNumber))
                    .foregroundStyle(.customGreen)
                    .font(.customText1)
                Spacer()
            }
        }
    }

    private var jobTitle: some View {
        HStack {
            Text(viewModel.vacancy.title)
                .foregroundStyle(.white)
                .font(.customTitle2)
            Spacer()
        }
    }

    private var salaryTitle: some View {
        HStack {
            if let salary = viewModel.vacancy.salary?.short {
                Text(salary)
                    .foregroundStyle(.customWhite)
                    .font(.customTitle1)
                Spacer()
            }
        }
    }

    private var townTitle: some View {
        HStack {
            Text(viewModel.vacancy.address.town)
                .foregroundStyle(.white)
                .font(.customText1)
            Spacer()
        }
    }

    private var companyTitle: some View {
        HStack {
            Text(viewModel.vacancy.company)
                .foregroundStyle(.white)
                .font(.customText1)
            Image(.verifiedCompany)
            Spacer()
        }
    }

    private var experienceTitle: some View {
        HStack {
            Image(.briefcase)
            Text(viewModel.vacancy.experience.previewText)
                .foregroundStyle(.white)
                .font(.customText1)
            Spacer()
        }
    }

    private var publishedDateTitle: some View {
        HStack {
            if let publishedDate = formatDate() {
                Text("Опубликовано \(publishedDate)")
                    .foregroundStyle(.customGrey4)
                    .font(.customText1)
                Spacer()
            }
        }
    }

    private var markAsFavoriteButton: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    viewModel.changeFavorite()
                } label: {
                    Image(viewModel.vacancy.isFavorite ? .favoriteSelected : .favorite)
                        .padding(16)
                }
            }
            Spacer()
        }
    }

    private func formatDate() -> String? {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd"

        guard let date = inputDateFormatter.date(from: viewModel.vacancy.publishedDate) else {
            return nil
        }

        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd MMMM"
        outputDateFormatter.locale = Locale(identifier: "ru_RU")

        let formattedDateString = outputDateFormatter.string(from: date)

        return formattedDateString
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: VacancyDatabase.self, configurations: config)
        let vacancy = VacancyDatabase.sample
        return VacancyView(viewModel: VacancyViewModel(
            vacancy: vacancy,
            modelContext: container.mainContext
        ))
        .preferredColorScheme(.dark)
    } catch {
        fatalError("Cannot create model container for preview")
    }
}

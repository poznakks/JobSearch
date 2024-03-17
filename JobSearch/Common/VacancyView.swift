//
//  VacancyView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 17.03.2024.
//

import SwiftUI

struct VacancyView: View {

    let title: String
    let town: String
    let company: String
    let experience: String
    let publishedDate: String
    let isFavorite: Bool
    let salary: String?
    let lookingNumber: Int?

    var body: some View {
        VStack(spacing: 10) {
            if let lookingNumber {
                lookingNumberTitle
            }

            jobTitle

            if let salary {
                salaryTitle
            }

            townTitle

            companyTitle

            experienceTitle

            if let publishedDate = formatDate() {
                publishedDateTitle(publishedDate)
                    .padding(.bottom, 12)
            }
            RoundedButton(title: "Отклинуться", action: {})
        }
        .padding(16)
        .background(Color.customGrey1)
        .clipShape(.rect(cornerRadius: 8))
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    Image(isFavorite ? .favoriteSelected : .favorite)
                        .padding(16)
                }
                Spacer()
            }
        }
    }

    private var lookingNumberTitle: some View {
        HStack {
            Text("Cейчас просматривает \(lookingNumber ?? 0) человек")
                .foregroundStyle(.customGreen)
                .font(.customText1)
            Spacer()
        }
    }

    private var jobTitle: some View {
        HStack {
            Text(title)
                .foregroundStyle(.white)
                .font(.customTitle2)
            Spacer()
        }
    }

    private var salaryTitle: some View {
        HStack {
            Text(salary ?? "")
                .foregroundStyle(.customWhite)
                .font(.customTitle1)
            Spacer()
        }
    }

    private var townTitle: some View {
        HStack {
            Text(town)
                .foregroundStyle(.white)
                .font(.customText1)
            Spacer()
        }
    }

    private var companyTitle: some View {
        HStack {
            Text(company)
                .foregroundStyle(.white)
                .font(.customText1)
            Image(.verifiedCompany)
            Spacer()
        }
    }

    private var experienceTitle: some View {
        HStack {
            Image(.briefcase)
            Text(experience)
                .foregroundStyle(.white)
                .font(.customText1)
            Spacer()
        }
    }

    private func publishedDateTitle(_ date: String) -> some View {
        HStack {
            Text("Опубликовано \(date)")
                .foregroundStyle(.customGrey4)
                .font(.customText1)
            Spacer()
        }
    }

    private func formatDate() -> String? {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd"

        guard let date = inputDateFormatter.date(from: publishedDate) else {
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
}

//
//  VacancyView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 17.03.2024.
//

import SwiftUI
import SwiftData

@MainActor
final class VacancyViewModel: ObservableObject {

    @Published var vacancy: VacancyDatabase
    weak var parentCoordinator: (any VacancyCoordinator)?
    private let modelContext: ModelContext

    init(vacancy: VacancyDatabase, modelContext: ModelContext) {
        self.vacancy = vacancy
        self.modelContext = modelContext
    }

    func changeFavorite() {
        vacancy.isFavorite.toggle()
        do {
            try modelContext.save()
        } catch {
            fatalError("cannot save context")
        }
    }

    func navigateBack() {
        parentCoordinator?.navigateBack()
    }
}

struct VacancyView: View {

    @ObservedObject var viewModel: VacancyViewModel

    var body: some View {
        VStack(spacing: 10) {
            if viewModel.vacancy.lookingNumber != nil {
                lookingNumberTitle
            }

            jobTitle
                .padding(.trailing, 40)

            if viewModel.vacancy.salary?.short != nil {
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
            markAsFavoriteButton
        }
    }

    private var lookingNumberTitle: some View {
        HStack {
            Text("Cейчас просматривает \(viewModel.vacancy.lookingNumber ?? 0) человек")
                .foregroundStyle(.customGreen)
                .font(.customText1)
            Spacer()
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
            Text(viewModel.vacancy.salary?.short ?? "")
                .foregroundStyle(.customWhite)
                .font(.customTitle1)
            Spacer()
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

    private func publishedDateTitle(_ date: String) -> some View {
        HStack {
            Text("Опубликовано \(date)")
                .foregroundStyle(.customGrey4)
                .font(.customText1)
            Spacer()
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

//// swiftlint:disable line_length
// #Preview {
//    let vacancy = VacancyDatabase(
//        id: "54a876a5-2205-48ba-9498-cfecff4baa6e",
//        lookingNumber: 17,
//        title: "UI/UX-дизайнер / Web-дизайнер / Дизайнер интерфейсов",
//        address: Address(town: "Казань", street: "улица Чистопольская", house: "20/10"),
//        company: "Шафигуллин Шакир",
//        experience: Experience(previewText: "Опыт от 1 до 3 лет", text: "1–3 года"),
//        publishedDate: "2024-03-06",
//        isFavorite: false,
//        salary: Salary(full: "от 20 000 до 50 000 ₽ на руки", short: "20 000 до 50 000 ₽"),
//        schedules: ["частичная занятость",
//                    "полный день"],
//        appliedNumber: 147,
//        descriptionText: "Мы разрабатываем мобильные приложения, web-приложения и сайты под ключ.\n\nНам в команду нужен UX/UI Designer!",
//        responsibilities: "- Разработка дизайна Web+App (обязательно Figma)\n\n- Работа над созданием и улучшением систем;\n\n- Взаимодействие с командами frontend-разработки и backend-разработки",
//        questions: ["Где располагается место работы?",
//                    "Какой график работы?",
//                    "Как с вами связаться?"]
//    )
//    return VacancyView(viewModel: VacancyViewModel(vacancy: vacancy))
//                .preferredColorScheme(.dark)
// }
//// swiftlint:enable line_length

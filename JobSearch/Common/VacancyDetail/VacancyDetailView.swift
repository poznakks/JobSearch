//
//  VacancyDetailView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 18.03.2024.
//

import SwiftUI
import SwiftData

struct VacancyDetailView: View {

    @ObservedObject var viewModel: VacancyViewModel

    var body: some View {
        ZStack {
            Color.customBlack.ignoresSafeArea()

            ScrollView(.vertical) {
                VStack {
                    title
                        .padding(.bottom, 16)
                    salary
                        .padding(.bottom, 16)
                    experience
                        .padding(.bottom, 2)
                    schedules
                        .padding(.bottom, 24)
                    currentPeople
                        .padding(.bottom, 16)
                    address
                        .padding(.bottom, 12)
                    description
                        .padding(.bottom, 12)
                    yourResponsibilitiesTitle
                        .padding(.bottom, 8)
                    yourResponsibilities
                        .padding(.bottom, 24)
                    questionsToEmployerTitle
                        .padding(.bottom, 16)
                    questions
                        .padding(.bottom, 16)
                    respondButton
                }
                .padding()
                .navigationBarBackButtonHidden(true)
                .toolbarBackground(Color.black, for: .navigationBar)
                .toolbar(.visible, for: .navigationBar)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button {
                            viewModel.navigateBack()
                        } label: {
                            Image(.leftArrow)
                        }
                    }

                    ToolbarItemGroup(placement: .topBarTrailing) {
                        HStack(spacing: 16) {
                            Image(.eye)
                            Image(.share)
                            Button {
                                viewModel.changeFavorite()
                            } label: {
                                Image(viewModel.vacancy.isFavorite ? .favoriteSelected : .favorite)
                            }
                        }
                    }
                }
            }
        }
    }

    private var title: some View {
        HStack {
            Text(viewModel.vacancy.title)
                .foregroundStyle(.customWhite)
                .font(.customTitle1)
            Spacer()
        }
    }

    private var salary: some View {
        HStack {
            Text(viewModel.vacancy.salary?.full ?? "")
                .foregroundStyle(.customWhite)
                .font(.customTitle3)
            Spacer()
        }
    }

    private var experience: some View {
        HStack {
            Text("Требуемый опыт: \(viewModel.vacancy.experience.text)")
                .foregroundStyle(.customWhite)
                .font(.customTitle3)
            Spacer()
        }
    }

    private var schedules: some View {
        HStack {
            Text(viewModel.vacancy.schedules.joined(separator: ", ").capitalizedFirstLetter)
                .foregroundStyle(.customWhite)
                .font(.customTitle3)
            Spacer()
        }
    }

    private var currentPeople: some View {
        HStack {
            if let appliedNumber = viewModel.vacancy.appliedNumber {
                CurrentPeopleView(type: .applied, number: appliedNumber)
            }
            if let lookingNumber = viewModel.vacancy.lookingNumber {
                CurrentPeopleView(type: .looking, number: lookingNumber)
            }
        }
    }

    private var address: some View {
        AddressView(company: viewModel.vacancy.company, address: viewModel.vacancy.address)
    }

    private var description: some View {
        HStack {
            if let description = viewModel.vacancy.descriptionText {
                Text(description)
                    .foregroundStyle(.customWhite)
                    .font(.customTitle4)
                Spacer()
            }
        }
    }

    private var yourResponsibilitiesTitle: some View {
        HStack {
            Text("Ваши задачи")
                .foregroundStyle(.customWhite)
                .font(.customTitle1)
            Spacer()
        }
    }

    private var yourResponsibilities: some View {
        HStack {
            Text(viewModel.vacancy.responsibilities)
                .foregroundStyle(.customWhite)
                .font(.customTitle4)
            Spacer()
        }
    }

    private var questionsToEmployerTitle: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Задайте вопрос работодателю")
                    .foregroundStyle(.customWhite)
                    .font(.customTitle4)
                Spacer()
            }

            HStack {
                Text("Он получит его с откликом на вакансию")
                    .foregroundStyle(.customGrey4)
                    .font(.customTitle4)
                Spacer()
            }
        }
    }

    private var questions: some View {
        VStack {
            ForEach(viewModel.vacancy.questions, id: \.self) { question in
                HStack {
                    Text(question)
                        .foregroundStyle(.customWhite)
                        .font(.customTitle4)
                        .padding(12)
                        .background(Color.customGrey2)
                        .clipShape(.rect(cornerRadius: 50))
                    Spacer()
                }
            }
        }
    }

    private var respondButton: some View {
        RectangularButton(
            title: "Откликнуться",
            font: .customButtonText1,
            bgColor: .customGreen,
            height: 48,
            action: {}
        )
    }
}

private extension View {
    func customNavigationBarStyle(
        onDismiss: @escaping () -> Void,
        onFavorite: @escaping () -> Void
    ) -> some View {
        modifier(CustomNavigationBarStyle(
            onDismiss: onDismiss,
            onFavorite: onFavorite
        ))
    }
}

private struct CustomNavigationBarStyle: ViewModifier {

    let onDismiss: () -> Void
    let onFavorite: () -> Void

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbar(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button {
                        onDismiss()
                    } label: {
                        Image(.leftArrow)
                    }
                }

                ToolbarItemGroup(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        Image(.eye)
                        Image(.share)
                        Button {
                            onFavorite()
                        } label: {
                            Image(.favorite)
                        }
                    }
                }
            }
    }
}

private extension String {
    var capitalizedFirstLetter: String {
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        return firstLetter + remainingLetters
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: VacancyDatabase.self, configurations: config)
        let vacancy = VacancyDatabase.sample
        return VacancyDetailView(viewModel: VacancyViewModel(
            vacancy: vacancy,
            modelContext: container.mainContext
        ))
        .preferredColorScheme(.dark)
    } catch {
        fatalError("Cannot create model container for preview")
    }
}

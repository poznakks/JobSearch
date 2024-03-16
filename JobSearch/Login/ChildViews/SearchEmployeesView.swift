//
//  SearchEmployeesView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 16.03.2024.
//

import SwiftUI

struct SearchEmployeesView: View {
    var body: some View {
        VStack(spacing: Constants.Constraints.elementsSpacing) {
            employeesSearchTitleAndSubtitle

            lookingForEmployeesButton
        }
        .padding(.horizontal, Constants.Constraints.contentHorizontalPadding)
        .padding(.vertical, Constants.Constraints.contentVerticalPadding)
        .background(Color.customGrey1)
        .clipShape(.rect(
            cornerRadius: Constants.Constraints.viewCornerRadius)
        )
    }

    private var employeesSearchTitleAndSubtitle: some View {
        VStack(spacing: Constants.Constraints.titleAndSubtitleSpacing) {
            HStack {
                Text(Constants.Strings.employeesSearchTitle)
                    .font(.customTitle3)
                    .foregroundStyle(.customWhite)
                Spacer()
            }

            HStack {
                Text(Constants.Strings.employeesSearchSubtitle)
                    .font(.customText1)
                    .foregroundStyle(.customWhite)
                Spacer()
            }
        }
    }

    private var lookingForEmployeesButton: some View {
        RoundedButton(
            title: Constants.Strings.lookingForEmployeesButtonText
        ) {
            print("Я ищу сотрудников")
        }
    }
}

#Preview {
    SearchEmployeesView()
}

private enum Constants {
    enum Strings {
        static let employeesSearchTitle: String = "Поиск сотрудников"
        static let employeesSearchSubtitle: String = "Размещение вакансий и доступ к базе резюме"
        static let lookingForEmployeesButtonText: String = "Я ищу сотрудников"
    }

    enum Constraints {
        static let elementsSpacing: CGFloat = 16
        static let titleAndSubtitleSpacing: CGFloat = 8
        static let contentHorizontalPadding: CGFloat = 16
        static let contentVerticalPadding: CGFloat = 24
        static let viewCornerRadius: CGFloat = 8
    }
}

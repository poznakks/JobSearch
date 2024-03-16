//
//  CredentialsView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 16.03.2024.
//

import SwiftUI

struct CredentialsView: View {

    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack(spacing: Constants.Constraints.elementsSpacing) {
            jobSearchTitle

            textField

            HStack {
                continueButton

                signInWithPasswordButton
            }
        }
        .padding(.horizontal, Constants.Constraints.contentHorizontalPadding)
        .padding(.vertical, Constants.Constraints.contentVerticalPadding)
        .background(Color.customGrey1)
        .clipShape(.rect(
            cornerRadius: Constants.Constraints.viewCornerRadius
        ))
    }

    private var jobSearchTitle: some View {
        HStack {
            Text(Constants.Strings.jobSearchTitle)
                .font(.customTitle3)
                .foregroundStyle(.customWhite)
            Spacer()
        }
    }

    private var textField: some View {
        CustomTextField(
            leftImage: Image(.response),
            placeholder: Constants.Strings.textFieldPlaceholder,
            error: viewModel.emailError,
            text: $viewModel.emailText
        )
    }

    private var continueButton: some View {
        RectangularButton(
            title: Constants.Strings.continueButtonText,
            bgColor: viewModel.emailText.isEmpty ?
                .customDarkBlue : .customBlue,
            height: Constants.Constraints.continueButtonHeight,
            isActive: viewModel.emailText.isEmpty
        ) {
            viewModel.validateEmail()
        }
    }

    private var signInWithPasswordButton: some View {
        Button {
            print("Войти с паролем")
        } label: {
            Text(Constants.Strings.signInWithPasswordButtonText)
                .foregroundColor(.customBlue)
                .font(.customButtonText2)
                .padding(
                    .leading,
                    Constants.Constraints.signInWithPasswordButtonPadding
                )
        }
    }
}

#Preview {
    CredentialsView(viewModel: LoginViewModel())
}

private enum Constants {
    enum Strings {
        static let jobSearchTitle: String = "Поиск работы"
        static let textFieldPlaceholder: String = "Электронная почта или телефон"
        static let continueButtonText: String = "Продолжить"
        static let signInWithPasswordButtonText: String = "Войти с паролем"
    }

    enum Constraints {
        static let elementsSpacing: CGFloat = 16
        static let contentHorizontalPadding: CGFloat = 16
        static let contentVerticalPadding: CGFloat = 24
        static let viewCornerRadius: CGFloat = 8
        static let continueButtonHeight: CGFloat = 40
        static let signInWithPasswordButtonPadding: CGFloat = 24
    }
}

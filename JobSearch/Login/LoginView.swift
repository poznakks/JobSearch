//
//  LoginView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 16.03.2024.
//

import SwiftUI

struct LoginView: View {

    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        ZStack {
            Color.customBlack.ignoresSafeArea()

            VStack(spacing: Constants.Constraints.blocksSpacing) {
                title

                Spacer()

                CredentialsView(viewModel: viewModel)
                SearchEmployeesView()

                Spacer()
            }
            .padding(
                .horizontal,
                Constants.Constraints.blocksHorizontalPadding
            )
        }
    }

    private var title: some View {
        HStack {
            Text(Constants.Strings.title)
                .foregroundStyle(.customWhite)
                .font(.customTitle2)
            Spacer()
        }
        .padding(.top, Constants.Constraints.titleToTopPadding)
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}

private enum Constants {
    enum Strings {
        static let title: String = "Вход в личный кабинет"
    }

    enum Constraints {
        static let blocksSpacing: CGFloat = 16
        static let blocksHorizontalPadding: CGFloat = 16
        static let titleToTopPadding: CGFloat = 16
    }
}

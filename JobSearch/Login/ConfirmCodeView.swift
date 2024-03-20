//
//  ConfirmCodeView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 16.03.2024.
//

import SwiftUI

struct ConfirmCodeView: View {

    let email: String

    @Environment(\.dismiss) private var dismiss
    @State private var digits = ["", "", "", ""]
    @FocusState private var focusedField: DigitTextField.Digit?

    private var isAnyDigitEmpty: Bool {
        digits[0].isEmpty ||
        digits[1].isEmpty ||
        digits[2].isEmpty ||
        digits[3].isEmpty
    }

    var body: some View {
        ZStack {
            Color.customBlack.ignoresSafeArea()

            VStack(spacing: Constants.Constraints.elementsSpacing) {
                title

                subtitle

                digitsTextField

                RectangularButton(
                    title: Constants.Strings.submitButtonText,
                    font: .customButtonText1,
                    bgColor: isAnyDigitEmpty ? .customDarkBlue : .customBlue,
                    height: Constants.Constraints.submitButtonHeight,
                    isDisabled: isAnyDigitEmpty
                ) {
                    dismiss()
                }
            }
            .padding(
                .horizontal,
                Constants.Constraints.viewHorizontalPadding
            )
        }
    }

    private var title: some View {
        HStack {
            Text(Constants.Strings.title + email)
                .foregroundStyle(.customWhite)
                .font(.customTitle2)

            Spacer()
        }
    }

    private var subtitle: some View {
        HStack {
            Text(Constants.Strings.subtitle)
                .foregroundStyle(.customWhite)
                .font(.customTitle3)

            Spacer()
        }
    }

    private var digitsTextField: some View {
        HStack(spacing: Constants.Constraints.digitsSpacing) {
            DigitTextField(text: $digits[0],
                           focusedField: $focusedField,
                           digit: .first,
                           onFilled: focusNextField)

            DigitTextField(text: $digits[1],
                           focusedField: $focusedField,
                           digit: .second,
                           onFilled: focusNextField)

            DigitTextField(text: $digits[2],
                           focusedField: $focusedField,
                           digit: .third,
                           onFilled: focusNextField)

            DigitTextField(text: $digits[3],
                           focusedField: $focusedField,
                           digit: .fourth,
                           onFilled: focusNextField)
            Spacer()
        }
    }

    private func focusNextField() {
        switch focusedField {
        case .first:
            focusedField = .second

        case .second:
            focusedField = .third

        case .third:
            focusedField = .fourth

        case .fourth:
            focusedField = nil

        case .none:
            break
        }
    }
}

private enum Constants {
    enum Strings {
        static let title: String = "Отправили код на "
        static let subtitle: String =
        "Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет"
        static let submitButtonText: String = "Подтвердить"
    }

    enum Constraints {
        static let elementsSpacing: CGFloat = 16
        static let viewHorizontalPadding: CGFloat = 12
        static let digitsSpacing: CGFloat = 8
        static let submitButtonHeight: CGFloat = 48
    }
}

#Preview {
    ConfirmCodeView(email: "sample@email.com")
}

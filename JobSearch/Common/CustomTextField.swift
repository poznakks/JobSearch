//
//  CustomTextField.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 16.03.2024.
//

import SwiftUI

struct CustomTextField: View {

    let leftImage: Image
    let placeholder: String
    let error: Bool
    @Binding var text: String

    var body: some View {
        VStack {
            HStack(spacing: 0) {
                if text.isEmpty {
                    leftView
                }

                textField

                if !text.isEmpty {
                    clearButton
                }
            }
            .customTextFieldStyle(showError: error)

            if error {
                errorMessage
            }
        }
    }

    private var leftView: some View {
        Image(.response)
            .foregroundStyle(.customGrey4)
            .padding(
                .leading,
                Constants.Constraints.textFieldElementsSpacing
            )
    }

    private var textField: some View {
        ZStack(alignment: .leading) {
            // Overlapping text with custom font
            if text.isEmpty {
                Text(placeholder)
                    .font(.customText1)
                    .foregroundColor(.customGrey4)
            }

            TextField("", text: $text)
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .foregroundColor(.customWhite)
        }
        .padding(
            .leading,
            Constants.Constraints.textFieldElementsSpacing
        )
    }

    private var clearButton: some View {
        Button {
            text = ""
        } label: {
            Image(.close)
                .foregroundStyle(.customGrey4)
                .padding(
                    .horizontal,
                    Constants.Constraints.textFieldElementsSpacing
                )
        }
    }

    private var errorMessage: some View {
        HStack {
            Text(Constants.Strings.errorMessage)
                .font(.customText1)
                .foregroundStyle(.customRed)

            Spacer()
        }
    }
}

// MARK: - CustomTextFieldStyle
private extension View {
    func customTextFieldStyle(showError: Bool) -> some View {
        modifier(CustomTextFieldStyle(showError: showError))
    }
}

private struct CustomTextFieldStyle: ViewModifier {

    let showError: Bool

    func body(content: Content) -> some View {
        content
            .frame(height: Constants.Constraints.textFieldHeight)
            .background(Color(.customGrey2))
            .clipShape(.rect(
                cornerRadius: Constants.Constraints.textFieldCornerRadius
            ))
            .overlay {
                if showError {
                    RoundedRectangle(cornerRadius: Constants.Constraints.textFieldCornerRadius)
                        .stroke(
                            .customRed,
                            lineWidth: Constants.Constraints.textFieldBorderWidth
                        )
                }
            }
            .shadow(
                color: Color.customShadows,
                radius: Constants.Constraints.shadowCornerRadius,
                x: Constants.Constraints.shadowOffsetX,
                y: Constants.Constraints.shadowOffsetY
            )
    }
}

// MARK: - Constants
private enum Constants {
    enum Strings {
        static let errorMessage: String = "Вы ввели неверный e-mail"
    }
    enum Constraints {
        static let textFieldElementsSpacing: CGFloat = 8
        static let textFieldCornerRadius: CGFloat = 8
        static let textFieldHeight: CGFloat = 40
        static let textFieldBorderWidth: CGFloat = 1

        static let shadowCornerRadius: CGFloat = 4
        static let shadowOffsetX: CGFloat = 0
        static let shadowOffsetY: CGFloat = 4
    }
}

// MARK: - Preview
#Preview {
    CustomTextField(
        leftImage: Image(.response),
        placeholder: "Электронная почта или телефон",
        error: true,
        text: .constant("")
    )
}

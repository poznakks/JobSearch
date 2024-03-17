//
//  DigitTextField.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 17.03.2024.
//

import SwiftUI

enum Digit: Hashable {
    case first, second, third, fourth
}

struct DigitTextField: View {

    @Binding var text: String
    @FocusState.Binding var focusedField: Digit?
    let digit: Digit?
    let onFilled: () -> Void

    var body: some View {
        ZStack {
            if $text.wrappedValue.isEmpty && focusedField != digit {
                Image(.star)
                    .foregroundStyle(.customGrey4)
            }

            TextField("", text: $text)
                .foregroundStyle(.customWhite)
                .font(.customTitle2)
                .frame(width: 48, height: 48)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .focused($focusedField, equals: digit)
                .onChange(of: $text.wrappedValue) {
                    if $text.wrappedValue.count == 1 {
                        $text.wrappedValue = String($text.wrappedValue.prefix(1))
                        onFilled()
                    }
                }
        }
        .background(Color.customGrey2)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    @FocusState var focusedField: Digit?
    return DigitTextField(
        text: .constant(""),
        focusedField: $focusedField,
        digit: .first,
        onFilled: {}
    )
}

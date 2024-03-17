//
//  RectangularButton.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 16.03.2024.
//

import SwiftUI

struct RectangularButton: View {

    let title: String
    let font: Font
    let bgColor: Color
    let height: CGFloat
    let isDisabled: Bool
    let action: () -> Void

    init(title: String,
         font: Font,
         bgColor: Color,
         height: CGFloat,
         isDisabled: Bool = false,
         action: @escaping () -> Void
    ) {
        self.title = title
        self.font = font
        self.bgColor = bgColor
        self.height = height
        self.isDisabled = isDisabled
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .foregroundColor(.customWhite)
                .font(font)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .background(bgColor)
                .clipShape(.rect(cornerRadius: 8))
        }
        .disabled(isDisabled)
    }
}

#Preview {
    RectangularButton(
        title: "Продолжить",
        font: .customButtonText2,
        bgColor: .customBlue,
        height: 40,
        action: {}
    )
}

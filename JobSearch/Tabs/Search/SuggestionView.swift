//
//  SuggestionView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 17.03.2024.
//

import SwiftUI

struct SuggestionView: View {

    let image: Image
    let imageBgColor: Color
    let title: String
    let buttonTitle: String?
    let buttonColor: Color?

    init(
        image: Image,
        imageBgColor: Color,
        title: String,
        buttonTitle: String? = nil,
        buttonColor: Color? = nil
    ) {
        self.image = image
        self.imageBgColor = imageBgColor
        self.title = title
        self.buttonTitle = buttonTitle
        self.buttonColor = buttonColor
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                image
                    .frame(width: 32, height: 32)
                    .background(imageBgColor)
                    .clipShape(.rect(cornerRadius: 16))

                Spacer()
            }
            .padding(.top, 8)
            .padding(.bottom, 16)

            HStack {
                Text(title)
                    .foregroundStyle(.customWhite)
                    .font(.customTitle4)

                Spacer()
            }
            .padding(.bottom, 4)

            if let buttonTitle, let buttonColor {
                HStack {
                    Text(buttonTitle)
                        .foregroundStyle(buttonColor)
                        .font(.customText1)

                    Spacer()
                }
            }

            Spacer()
        }
        .padding(.leading, 8)
        .frame(width: 136, height: 120)
        .background(Color.customGrey1)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    SuggestionView(
        image: Image(.greenStar),
        imageBgColor: .customDarkGreen,
        title: "Поднять резюме в поиске",
        buttonTitle: "Поднять",
        buttonColor: .customGreen
    )
}

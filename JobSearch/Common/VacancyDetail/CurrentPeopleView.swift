//
//  CurrentPeopleView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 18.03.2024.
//

import SwiftUI

struct CurrentPeopleView: View {

    enum PeopleType {
        case looking
        case applied
    }

    let type: PeopleType
    let number: Int

    var body: some View {
        VStack {
            HStack {
                Text(text)
                    .foregroundStyle(.customWhite)
                    .font(.customText1)
                Spacer()
            }
        }
        .padding(8)
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(Color.customDarkGreen)
        .clipShape(.rect(cornerRadius: 8))
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    image
                        .padding(8)
                }
                Spacer()
            }
        }
    }

    private var image: some View {
        switch type {
        case .looking:
            Image(.looking)

        case .applied:
            Image(.applied)
        }
    }

    private var text: String {
        switch type {
        case .looking:
            String.peopleText(number) + " сейчас смотрят"

        case .applied:
            String.peopleText(number) + " уже откликнулись"
        }
    }
}

#Preview {
    CurrentPeopleView(type: .applied, number: 147)
        .preferredColorScheme(.dark)
}

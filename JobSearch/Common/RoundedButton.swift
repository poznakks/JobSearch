//
//  RoundedButton.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 16.03.2024.
//

import SwiftUI

struct RoundedButton: View {

    let title: String
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .foregroundColor(.customWhite)
                .font(.customButtonText2)
                .frame(maxWidth: .infinity, maxHeight: 32)
                .background(.customGreen)
                .clipShape(.rect(cornerRadius: 50))
        }
    }
}

#Preview {
    RoundedButton(title: "Откликнуться", action: {})
}

//
//  ConfirmCodeView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 16.03.2024.
//

import SwiftUI

struct ConfirmCodeView: View {

    let email: String

    var body: some View {
        Text("Отправили код на \(email)")
    }
}

#Preview {
    ConfirmCodeView(email: "sample@email.com")
}

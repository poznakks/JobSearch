//
//  LoginViewModel.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 16.03.2024.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var showConfirm = false
    @Published var emailError = false
    @Published var emailText: String = "" {
        didSet {
            emailError = false
        }
    }

    func validateEmail() {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let result = predicate.evaluate(with: emailText)
        emailError = !result
        showConfirm = result
    }

    func login() {
        isAuthenticated = true
    }
}

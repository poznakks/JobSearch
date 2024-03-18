//
//  Vacancy.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 17.03.2024.
//

import Foundation
import SwiftData

// MARK: - Vacancies
struct Vacancies: Codable {
    let vacancies: [Vacancy]
}

// MARK: - Vacancy
struct Vacancy: Codable, Identifiable, Hashable {
    let id: String
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    let isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
}

// MARK: - Address
struct Address: Codable, Hashable {
    let town, street, house: String

    var fullAddress: String {
        "\(town), \(street), \(house)"
    }
}

// MARK: - Experience
struct Experience: Codable, Hashable {
    let previewText, text: String
}

// MARK: - Salary
struct Salary: Codable, Hashable {
    let full: String
    let short: String?
}

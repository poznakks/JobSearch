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

@Model
final class VacancyDatabase {
    @Attribute(.unique) var id: String
    var index: Int
    var lookingNumber: Int?
    var title: String
    var address: Address
    var company: String
    var experience: Experience
    var publishedDate: String
    var isFavorite: Bool
    var salary: Salary?
    var schedules: [String]
    var appliedNumber: Int?
    var descriptionText: String?
    var responsibilities: String
    var questions: [String]

    init(
        id: String,
        lookingNumber: Int?,
        title: String,
        address: Address,
        company: String,
        experience: Experience,
        publishedDate: String,
        isFavorite: Bool,
        salary: Salary,
        schedules: [String],
        appliedNumber: Int?,
        descriptionText: String?,
        responsibilities: String,
        questions: [String]
    ) {
        self.id = id
        self.index = 0
        self.lookingNumber = lookingNumber
        self.title = title
        self.address = address
        self.company = company
        self.experience = experience
        self.publishedDate = publishedDate
        self.isFavorite = isFavorite
        self.salary = salary
        self.schedules = schedules
        self.appliedNumber = appliedNumber
        self.descriptionText = descriptionText
        self.responsibilities = responsibilities
        self.questions = questions
    }

    convenience init(from vacancy: Vacancy) {
        self.init(
            id: vacancy.id,
            lookingNumber: vacancy.lookingNumber,
            title: vacancy.title,
            address: vacancy.address,
            company: vacancy.company,
            experience: vacancy.experience,
            publishedDate: vacancy.publishedDate,
            isFavorite: vacancy.isFavorite,
            salary: vacancy.salary,
            schedules: vacancy.schedules,
            appliedNumber: vacancy.appliedNumber,
            descriptionText: vacancy.description,
            responsibilities: vacancy.responsibilities,
            questions: vacancy.questions
        )
    }

    static var sample: VacancyDatabase {
        VacancyDatabase(
            id: "54a876a5-2205-48ba-9498-cfecff4baa6e",
            lookingNumber: 17,
            title: "UI/UX-дизайнер / Web-дизайнер / Дизайнер интерфейсов",
            address: Address(town: "Казань", street: "улица Чистопольская", house: "20/10"),
            company: "Шафигуллин Шакир",
            experience: Experience(previewText: "Опыт от 1 до 3 лет", text: "1–3 года"),
            publishedDate: "2024-03-06",
            isFavorite: true,
            salary: Salary(full: "от 20 000 до 50 000 ₽ на руки", short: "20 000 до 50 000 ₽"),
            schedules: ["частичная занятость",
                        "полный день"],
            appliedNumber: 147,
            descriptionText: """
                            Мы разрабатываем мобильные приложения,
                             web-приложения и сайты под ключ.\n\n
                            Нам в команду нужен UX/UI Designer!
                            """,
            responsibilities: """
                            - Разработка дизайна Web+App (обязательно Figma)\n\n
                            - Работа над созданием и улучшением систем;\n\n
                            - Взаимодействие с командами frontend-разработки и backend-разработки
                            """,
            questions: ["Где располагается место работы?",
                        "Какой график работы?",
                        "Как с вами связаться?"]
        )
    }
}

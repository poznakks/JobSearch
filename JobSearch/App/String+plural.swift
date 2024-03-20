//
//  String+plural.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 20.03.2024.
//

import Foundation

extension String {
    static func vacanciesText(_ count: Int) -> Self {
        let lastOne = count % 10
        let lastTwo = count % 100
        switch (lastOne, lastTwo) {
        case (_, 11...14):
            return "\(count) вакансий"
        case (1, _):
            return "\(count) вакансия"
        case (2...4, _):
            return "\(count) вакансии"
        case (0, _):
            return "\(count) вакансий"
        case (5...9, _):
            return "\(count) вакансий"
        default:
            return "\(count) вакансий"
        }
    }

    static func peopleText(_ count: Int) -> Self {
        let lastOne = count % 10
        let lastTwo = count % 100
        switch (lastOne, lastTwo) {
        case (_, 11...14):
            return "\(count) человек"
        case (1, _):
            return "\(count) человек"
        case (2...4, _):
            return "\(count) человека"
        case (0, _):
            return "\(count) человек"
        case (5...9, _):
            return "\(count) человек"
        default:
            return "\(count) человек"
        }
    }
}

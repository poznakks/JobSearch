//
//  JobSearchApp.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

@main
struct JobSearchApp: App {

    @StateObject private var coordinator = MainCoordinator()

    var body: some Scene {
        WindowGroup {
            coordinator.view()
        }
    }
}

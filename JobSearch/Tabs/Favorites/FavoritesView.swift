//
//  FavoritesView.swift
//  JobSearch
//
//  Created by Vlad Boguzh on 15.03.2024.
//

import SwiftUI

struct FavoritesView: View {

    @ObservedObject var coordinator: FavoritesCoordinator
    @StateObject var viewModel: FavoritesViewModel

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color.customBlack.ignoresSafeArea()

                ScrollView(.vertical) {
                    VStack {
                        Text("FavoritesView")
                            .font(.customTitle1)
                            .foregroundStyle(.customWhite)
                            .padding(.bottom, 24)

                        ForEach(viewModel.vacancies) { vacancy in
                            coordinator.vacancyView(vacancy: vacancy)
                                .onTapGesture {
                                    coordinator.navigate(to: .detail(vacancy))
                                }
                        }

                        Spacer()
                    }
                    .padding(16)
                }
                .clipped()
                .onAppear {
                    viewModel.fetchFavoriteVacancies()
                }
                .navigationDestination(for: FavoritesCoordinator.Destination.self) {
                    switch $0 {
                    case .detail(let vacancy):
                        coordinator.detailView(vacancy: vacancy)
                    }
                }
            }
        }
    }
}

// #Preview {
//    FavoritesView(coordinator: SearchCoordinator(), viewModel: )
// }

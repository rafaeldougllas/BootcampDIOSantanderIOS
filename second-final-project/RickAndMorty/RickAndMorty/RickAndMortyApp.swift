//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by rafael douglas on 20/10/23.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    @StateObject var viewModel = HomeViewModel(service: NetworkService())
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: viewModel)
        }
    }
}

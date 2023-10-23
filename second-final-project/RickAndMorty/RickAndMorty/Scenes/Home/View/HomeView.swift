//
//  HomeView.swift
//  RickAndMorty
//
//  Created by rafael douglas on 21/10/23.
//

import SwiftUI
import AlertToast

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            List {
                firstCharacters
                
                allCharacters
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.fetchCharacters()
            }
            .overlay {
                if viewModel.state == .loading {
                    ProgressView()
                }
            }
            .toast(isPresenting: $viewModel.showAlert){
                    AlertToast(displayMode: .alert,
                               type: .error(Color.red),
                               title: "Ops",
                               subTitle: "Ocorreu um erro ao buscar os dados do App. Tente novamente em alguns segundos",
                               style: nil)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        Task {
                            await viewModel.fetchCharacters()
                        }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(.orange)
                    }
                }
            }
            .navigationDestination(for: RMCharacter.self) { character in
                DetailView(viewModel: DetailViewModel(character: character))
            }
        }
    }
}

extension HomeView {
    private var firstCharacters: some View {
        Section {
            CarouselView(title: "First Sitcom Characters",
                         characters: viewModel.firstCharacters)
            .listRowInsets(EdgeInsets())
        } header: {
            Text("First Sitcom Characters")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(Color.black)
                .padding(.horizontal)
        }
    }
    
    private var allCharacters: some View {
        Section {
            ForEach(viewModel.characters) { character in
                NavigationLink(value: character) {
                    Text(character.name)
                }
                .buttonStyle(.plain)
                .listRowBackground(Color.white)
            }
        } header: {
            Text("All Characters")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(Color.black)
                .padding(.horizontal)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(service: NetworkService()))
}

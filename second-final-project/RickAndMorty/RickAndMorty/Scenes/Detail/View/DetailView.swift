//
//  DetailView.swift
//  RickAndMorty
//
//  Created by rafael douglas on 21/10/23.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(showsIndicators: false) {
                GeometryReader { geo in
                    ZStack(alignment: .bottomLeading) {
                        CharacterImageView
                            .frame(width: geo.size.width, height: GeometryHelper.getHeightForHeaderImage(geo))
                        
                        Rectangle()
                            .foregroundColor(.black.opacity(0.5))
                            .frame(width: geo.size.width, height: 60)
                        
                        CharacterTitleView
                    }
                    .offset(x: 0, y: GeometryHelper.getOffsetForHeaderImage(geo))
                }
                .frame(height: UIScreen.main.bounds.height * 0.5)
                CharacterOverviewView
            }
        }
        .ignoresSafeArea()
    }
    
    private var CharacterImageView: some View {
        AsyncImage(url: viewModel.character.imageUrl) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
            } else if phase.error != nil {
                Image(systemName: "film")
                    .font(.system(size: 48))
                    .opacity(0.5)
            } else {
                ProgressView()
            }
        }
    }
    
    private var CharacterTitleView: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(viewModel.character.name)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .lineLimit(1)
            
            Text(viewModel.character.species)
                .font(.footnote)
        }
        .foregroundColor(.white.opacity(0.7))
        .shadow(radius: 7)
        .padding(.leading)
        .padding(.bottom, 8)
    }
    
    private var CharacterOverviewView: some View {
        VStack(alignment: .leading, spacing: 12) {
            lineInfo(title: "Status:",
                     description: viewModel.character.status.rawValue,
                     iconColor: viewModel.character.status == .alive ? .green : .red)
            lineInfo(title: "Origin:",
                     description: viewModel.character.origin.name,
                     iconColor: Color.blue)
            lineInfo(title: "Gender:", description: viewModel.character.gender.rawValue)
            lineInfo(title: "Current Location:",
                     description: viewModel.character.location.name,
                     iconColor: .yellow)
        }
        .padding(.top, 5)
        .padding([.leading, .trailing])
    }
    
    private func lineInfo(title: String,
                          description: String,
                          iconColor: Color = .black) -> some View {
        HStack {
            Image(systemName: "info.circle.fill")
                .foregroundStyle(iconColor)
            
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
            
            Text(description)
                .font(.callout)
            
            Spacer()
        }
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(character: .fixture()))
}

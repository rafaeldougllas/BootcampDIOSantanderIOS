//
//  CarouselCardView.swift
//  RickAndMorty
//
//  Created by rafael douglas on 21/10/23.
//

import SwiftUI

struct CarouselCardView: View {
    let character: RMCharacter
    
    var body: some View {
        cardView(character: character)
    }
}

extension CarouselCardView {
    func cardView(character: RMCharacter) -> some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.3)
                characterPoster(character: character)
            }
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 5)
            
            characterInfo(character: character)
        }
        .frame(width: 150, height: 150)
    }
    
    func characterPoster(character: RMCharacter) -> some View {
        AsyncImage(url: character.imageUrl) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
            } else if phase.error != nil {
                Image(systemName: "video")
            } else {
                ProgressView()
            }
        }
    }
    
    func characterInfo(character: RMCharacter) -> some View {
        VStack(alignment: .center) {
            Text(character.name)
                .lineLimit(1)
                .font(.caption)
            
            Text(character.species)
                .foregroundColor(.gray)
                .fontWeight(.bold)
                .font(.caption2)
        }
    }
}

struct PosterCard_Previews: PreviewProvider {
    static var previews: some View {
        CarouselCardView(character: .fixture())
    }
}

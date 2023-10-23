//
//  CarouselView.swift
//  RickAndMorty
//
//  Created by rafael douglas on 21/10/23.
//

import SwiftUI

struct CarouselView: View {
    let title: String
    let characters: [RMCharacter]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 15) {
                ForEach(characters) { character in
                    NavigationLink(value: character) {
                        CarouselCardView(character: character)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
    }
}

struct PosterCaroussel_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CarouselView(title: "First characters", characters: [.fixture(),
                                                                 .fixture(id: 2)])
        }
    }
}

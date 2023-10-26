//
//  AnimeDetailViewModel.swift
//  AnimesDiscovery
//
//  Created by rafael douglas on 24/10/23.
//

import Foundation
import Alamofire

final class AnimeDetailViewModel {
    
    let animeId: Int
    var model: AnimeDescription?
    
    init(animeId: Int) {
        self.animeId = animeId
    }
    
    func fetchAnimeBy(completion: @escaping () -> Void) {
        let request = AnimesRequest.anime(id: "\(animeId)")
        AF.request(request.baseURL+request.path).responseDecodable(of: AnimesDiscoveryDetailResponse.self) { [weak self] response in
            guard let self = self else { return }
            if case let .success(animeResponse) = response.result {
                self.model = animeResponse.data
                completion()
            } else {
                completion()
            }
        }
    }
}

//
//  AnimesListTableViewModel.swift
//  AnimesDiscovery
//
//  Created by rafael douglas on 22/10/23.
//

import Foundation
import Alamofire

final class AnimesListTableViewModel {
    
    var dataSource: Observable<[AnimesShortDescription]> = Observable(value: [])
    
    var dataSourceCount: Int {
        dataSource.value?.count ?? 0
    }
    
    func fetchDiscoveryAnimes() {
        let request = AnimesRequest.animesList
        AF.request(request.baseURL+request.path).responseDecodable(of: AnimesDiscoveryResponse.self) { [weak self] (response) in
            guard let self = self else { return }
            if case let .success(animeResponse) = response.result {
                self.dataSource.value = animeResponse.data
            }
        }
    }
}

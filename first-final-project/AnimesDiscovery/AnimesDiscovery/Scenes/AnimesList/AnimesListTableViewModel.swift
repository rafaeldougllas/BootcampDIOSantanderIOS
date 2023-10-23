//
//  AnimesListTableViewModel.swift
//  AnimesDiscovery
//
//  Created by rafael douglas on 22/10/23.
//

import Foundation

final class AnimesListTableViewModel {
    
    private let service: ServiceProtocol
    var dataSource: Observable<[AnimesShortDescription]> = Observable(value: [])
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    var dataSourceCount: Int {
        dataSource.value?.count ?? 0
    }
    
    func fetchDiscoveryAnimes() async throws {
        let response: AnimesDiscoveryResponse = try await service.request(AnimesRequest.animesList)
        dataSource.value = response.data
    }
}

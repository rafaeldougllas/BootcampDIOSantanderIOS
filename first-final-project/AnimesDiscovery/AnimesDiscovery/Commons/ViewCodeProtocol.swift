//
//  ViewCodeProtocol.swift
//  AnimesDiscovery
//
//  Created by rafael douglas on 22/10/23.
//

import Foundation

protocol ViewCodeProtocol {
    func buildViewHierarchy()
    func setupContraints()
    func setupAdditionals()
    func setupAccessibility()
    func setupView()
}

extension ViewCodeProtocol {
    func setupView() {
        buildViewHierarchy()
        setupContraints()
        setupAdditionals()
        setupAccessibility()
    }
    
    func setupAdditionals() {}
}

//
//  Observable.swift
//  AnimesDiscovery
//
//  Created by rafael douglas on 22/10/23.
//

import Foundation

final class Observable<T> {
    
    var value: T? {
        didSet {
            callListeners()
        }
    }
    
    private var listeners: [(T?) -> Void] = []
    
    init(value: T?) {
        self.value = value
        
    }
    
    func bindAndCall(_ listener: @escaping (T?) -> Void) {
        listener(value)
        listeners.append(listener)
    }
    
    func bind(_ listener: @escaping (T?) -> Void) {
        listeners.append(listener)
    }
    
    private func callListeners() {
        listeners.forEach { listener in
            listener(value)
        }
    }
}

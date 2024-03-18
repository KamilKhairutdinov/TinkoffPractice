//
//  Observable.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 18.03.2024.
//

import Foundation

class Observable<Tvalue> {

    typealias Listener = (Tvalue) -> Void
    private var listener: Listener?

    func bind(_ listener: Listener?) {
        self.listener = listener
    }

    var value: Tvalue {
        didSet {
            Dispatch.DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }

    init(_ value: Tvalue) {
        self.value = value
    }
}

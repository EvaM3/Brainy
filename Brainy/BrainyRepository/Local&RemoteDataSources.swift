//
//  Local&RemoteDataSources.swift
//  Brainy
//
//

import Foundation
import SwiftUI



class RemotedataSource {
    
}

class LocalDataSource {
    private var trivias: [Trivia.Result] = []
    
    func getAll() -> [Trivia.Result] {
        return trivias
    }
    
    func get(byId id: String) -> Trivia.Result? {
        return trivias.first(where: { $0.id == id })
    }
    
    func add(_ trivia: Trivia.Result) {
        trivias.append(trivia)
    }
    
    func addAll(_ trivias: [Trivia.Result]) {
        self.trivias.append(contentsOf: trivias)
    }
}


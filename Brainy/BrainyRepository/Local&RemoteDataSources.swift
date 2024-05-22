//
//  Local&RemoteDataSources.swift
//  Brainy
//
//

import Foundation
import SwiftUI



class RemotedataSource {
    func fetchTrivia(completion: @escaping ([Trivia.Result]?, Error?) -> Void) {
        // Example implementation to fetch trivia from a remote source, for testing :-)
        
        let exampleResults = [
            Trivia.Result(category: "General Knowledge", type: "multiple", difficulty: "easy", question: "Example question?", correctAnswer: "Correct", incorrectAnswers: ["Wrong1", "Wrong2", "Wrong3"])
        ]
        completion(exampleResults, nil)
    }
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


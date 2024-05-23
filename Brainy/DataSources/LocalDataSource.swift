//
//  Local&RemoteDataSources.swift
//  Brainy
//
//

import Foundation
import SwiftUI


class LocalTriviaRepository: DataRepository {
    typealias T = Trivia.Result
    
    
    private var triviaItems: [Trivia.Result] = []
    
    func getAll(completion: @escaping (Result<[Trivia.Result], Error>) -> Void) {
        completion(.success(triviaItems))
    }
    
    func get(byId id: String, completion: @escaping (Result<Trivia.Result?, Error>) -> Void) {
        let item = triviaItems.first { $0.id == id }
        completion(.success(item))
    }
    
    func add(_ item: Trivia.Result, completion: @escaping (Result<Void, Error>) -> Void) {
        triviaItems.append(item)
        completion(.success(()))
    }
}


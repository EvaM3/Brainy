//
//  Local&RemoteDataSources.swift
//  Brainy
//
//

import Foundation
import SwiftUI


class LocalDataSource: DataSource {
    typealias T = Trivia.Result
    
    
    private var triviaItems: [Trivia.Result] = []
    
    func getAll(completion: @escaping (Result<[Trivia.Result], Error>) -> Void) {
        // TODO: Fetch Trivia items from CoreData or SwiftData
        completion(.success(triviaItems))
    }
    
    func get(byId id: String, completion: @escaping (Result<Trivia.Result?, Error>) -> Void) {
        let item = triviaItems.first { $0.id == id }
        completion(.success(item))
    }
    

}


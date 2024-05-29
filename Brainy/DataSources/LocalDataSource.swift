//
//  Local&RemoteDataSources.swift
//  Brainy
//
//

import Foundation
import SwiftUI


class LocalDataSource: DataSource {
    private var triviaItems: [Trivia] = []
    
    // Fetch all trivia items
    func getAll() async throws -> [Trivia] {
        
        return triviaItems
    }
    
    // Fetch a trivia item by its ID
    func get(byId id: String) async throws -> Trivia? {
        
        return triviaItems.first { $0.id == id }
    }
    
    // Add trivia items to the local data source for testing purposes (when the time comes :-) )
    func addTriviaItems(_ items: [Trivia]) {
        triviaItems.append(contentsOf: items)
    }
    
    // Protocol requirement
    func get() async throws -> Trivia? {
        // This method can be used to fetch a single Trivia item if needed
        return nil
    }
}




//
//  Local&RemoteDataSources.swift
//  Brainy
//
//

import Foundation


class LocalDataSource: DataSource {
    
    private var triviaItems: [Trivia] = []
    private var cachedTriviaItems: [CachedTrivia] = []
    
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
    
    
    // Save all trivia items
    func saveAll(_ triviaList: [Trivia]) async throws {
        let cachedTriviaList = triviaList.map { mapToCached(trivia: $0) }
        cachedTriviaItems.append(contentsOf: cachedTriviaList)
        triviaItems.append(contentsOf: triviaList)
    }
    
    
    // Fetch all cached trivia items
    func fetchAllCached() async throws -> [CachedTrivia] {
        return cachedTriviaItems
    }
    
    
    // Function to map Trivia to CachedTrivia in Local DataSource
    private func mapToCached(trivia: Trivia) -> CachedTrivia {
        let cachedTrivia = CachedTrivia()
        // cachedTrivia.id = trivia.id
        cachedTrivia.category = trivia.category
        cachedTrivia.correctAnswer = trivia.correctAnswer
        cachedTrivia.difficulty = trivia.difficulty
        // cachedTrivia.incorrectAnswers = trivia.incorrectAnswers
        cachedTrivia.type = trivia.type
        return cachedTrivia
    }
    
    
    // Convert CachedTrivia to Trivia
    private func mapToTrivia(cachedTrivia: CachedTrivia) -> Trivia {
        return Trivia(
            // id: cachedTrivia.id ?? UUID(),
            category: cachedTrivia.category ?? "",
            type: cachedTrivia.type ?? "",
            difficulty: cachedTrivia.difficulty ?? "",
            question: cachedTrivia.question ?? "",
            correctAnswer: cachedTrivia.correctAnswer ?? "",
            incorrectAnswers: cachedTrivia.incorrectAnswers as? [String] ?? []
        )
    }
}




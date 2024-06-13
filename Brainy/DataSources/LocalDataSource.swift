//
//  Local&RemoteDataSources.swift
//  Brainy
//
//

import Foundation
import CoreData

class LocalDataSource: DataSource {
    
    private var triviaItems: [Trivia] = []
    private var cachedTriviaItems: [CachedTrivia] = []
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    // Fetch all trivia items from Core Data
    func getAll() async throws -> [Trivia] {
        let request: NSFetchRequest<CachedTrivia> = CachedTrivia.fetchRequest()
        let cachedTriviaItems = try context.fetch(request)
        return cachedTriviaItems.map { mapFromCached(cachedTrivia: $0) }
    }
    
    // Fetch a trivia item by its ID
    func get(byId id: String) async throws -> Trivia? {
        let request: NSFetchRequest<CachedTrivia> = CachedTrivia.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        let cachedTriviaItems = try context.fetch(request)
        return cachedTriviaItems.first.map { mapFromCached(cachedTrivia: $0) }
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
    
    
    // Save all trivia items to Core Data
    func saveAll(_ triviaList: [Trivia]) async throws {
        for trivia in triviaList {
            let _ = mapToCached(trivia: trivia)
        }
        
        do {
            try context.save()
        } catch {
            context.rollback()
            throw error
        }
    }

    
    // Fetch all cached trivia items
    func fetchAllCached() async throws -> [CachedTrivia] {
        let request: NSFetchRequest<CachedTrivia> = CachedTrivia.fetchRequest()
        return try context.fetch(request)
    }
    
    
    // Function to map Trivia to CachedTrivia in Local DataSource
    private func mapToCached(trivia: Trivia) -> CachedTrivia {
        let cachedTrivia = CachedTrivia()
        cachedTrivia.id = UUID(uuidString: trivia.id)
        cachedTrivia.category = trivia.category
        cachedTrivia.correctAnswer = trivia.correctAnswer
        cachedTrivia.difficulty = trivia.difficulty
        // cachedTrivia.incorrectAnswers = trivia.incorrectAnswers
        cachedTrivia.type = trivia.type
        return cachedTrivia
    }
    
    
    // Convert CachedTrivia to Trivia
    private func mapFromCached(cachedTrivia: CachedTrivia) -> Trivia {
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




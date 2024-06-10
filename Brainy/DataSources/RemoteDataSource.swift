//
//  RemoteDataSource.swift
//  Brainy
//
//

import Foundation
import SwiftUI
import CoreData


class RemoteDataSource: DataSource {
    
    
    
    
    private let apiURL = "https://opentdb.com/api.php?amount=10"
    
    func getAll() async throws -> [Trivia] {
        guard let url = URL(string: apiURL) else {
            throw NSError(domain: "Invalid URL", code: -1, userInfo: nil)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
        }
        
        do {
            let decoder = JSONDecoder()
            let questionResult: Question = try decoder.decode(Question.self, from: data)
            return questionResult.questions
        } catch {
            throw error
        }
    }
    
    func get(byId id: String) async throws -> Trivia? {
        do {
            let triviaItems = try await getAll()
            return triviaItems.first { $0.id == id }
        } catch {
            throw error
        }
    }
    func mapToCached(trivia: Trivia) -> CachedTrivia {
        let cachedTrivia = CachedTrivia(context: context)
        //  cachedTrivia.id = trivia.id
        cachedTrivia.category = trivia.category
        cachedTrivia.type = trivia.type
        cachedTrivia.difficulty = trivia.difficulty
        cachedTrivia.question = trivia.question
        cachedTrivia.correctAnswer = trivia.correctAnswer
        cachedTrivia.incorrectAnswers = trivia.incorrectAnswers as NSObject?
        return cachedTrivia
        
    }
}



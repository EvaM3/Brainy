//
//  Trivia.swift
//  TriviaGame
//




import Foundation
import CoreData

struct Trivia: Decodable, Identifiable {
    
    var id: String = UUID().uuidString
    var category: String
    var type: String
    var difficulty: String
    var question: String
    var correctAnswer: String
    var incorrectAnswers: [String]
    
    var formattedQuestion: AttributedString {
        do {
            return try AttributedString(markdown: question)
        } catch {
            print("Error setting formattedQuestion: \(error)")
            return ""
        }
    }
    
    var answers: [String] {
        // Cleaned it from the do-catch block
       var allAnswers = incorrectAnswers
        allAnswers.append(correctAnswer)
        
        // Shuffled combined array
        return allAnswers.shuffled()
        
        
    }
}

extension Trivia {
    // Initialize Trivia from a managed object
    init(from entity: TriviaEntity) {
        id = entity.id ?? UUID().uuidString
        category = entity.category ?? ""
        type = entity.type ?? ""
        difficulty = entity.difficulty ?? ""
        question = entity.question ?? ""
        correctAnswer = entity.correctAnswer ?? ""
        incorrectAnswers = entity.incorrectAnswers ?? []
    }
    
    // Creating a managed object from the Trivia struct
    func toEntity(context: NSManagedObjectContext) -> TriviaEntity {
        let entity = TriviaEntity(context: context)
        entity.id = id
        entity.category = category
        entity.type = type
        entity.difficulty = difficulty
        entity.question = question
        entity.correctAnswer = correctAnswer
        entity.incorrectAnswers = incorrectAnswers
        return entity
    }
    
}

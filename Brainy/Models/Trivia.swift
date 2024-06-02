//
//  Trivia.swift
//  TriviaGame
//




import Foundation


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
    
    func mapToCached(trivia: Trivia) -> CachedTrivia {
        let cachedTrivia = CachedTrivia()
   //   cachedTrivia.id = trivia.id
        cachedTrivia.category = trivia.category
        cachedTrivia.correctAnswer = trivia.correctAnswer
        cachedTrivia.difficulty = trivia.difficulty
     // cachedTrivia.incorrectAnswers = trivia.incorrectAnswers
        cachedTrivia.type = trivia.type
      
        
        return cachedTrivia
    }
}

//
//extension Trivia { map to cached or map to ui
//    // Initialize from a managed object
//    init(from entity: TriviaEntity) {
//        id = entity.id ?? UUID().uuidString
//        category = entity.category ?? ""
//        type = entity.type ?? ""
//        difficulty = entity.difficulty ?? ""
//        question = entity.question ?? ""
//        correctAnswer = entity.correctAnswer ?? ""
//        incorrectAnswers = entity.incorrectAnswers ?? []
//    }


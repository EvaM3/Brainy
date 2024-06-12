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
        
       var allAnswers = incorrectAnswers
        allAnswers.append(correctAnswer)
        
        // Shuffled combined array
        return allAnswers.shuffled()
        
        
    }
    
    func mapToCached(trivia: Trivia) -> CachedTrivia {
        let cachedTrivia = CachedTrivia()
        cachedTrivia.id = UUID(uuidString: trivia.id)
        cachedTrivia.category = trivia.category
        cachedTrivia.correctAnswer = trivia.correctAnswer
        cachedTrivia.difficulty = trivia.difficulty
     // cachedTrivia.incorrectAnswers = trivia.incorrectAnswers
        cachedTrivia.type = trivia.type
      
        
        return cachedTrivia
    }
    
}




//func mapToCachedFromContext(context: NSManagedObjectContext) -> CachedTrivia {
//           let cachedTrivia = CachedTrivia(context: context)
//           cachedTrivia.id = UUID(uuidString: self.id)
//           cachedTrivia.category = self.category
//           cachedTrivia.correctAnswer = self.correctAnswer
//           cachedTrivia.difficulty = self.difficulty
//           cachedTrivia.question = self.question
//           cachedTrivia.incorrectAnswers = self.incorrectAnswers as NSObject
//           cachedTrivia.type = self.type
//           return cachedTrivia
//       }

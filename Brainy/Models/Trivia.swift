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
    
    
    
}

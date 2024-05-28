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
        do {
    // create an array containing correctAnswer and all valus of incorrectAnswers and shuffle the array
            let allAnswers = correct + incorrects
            
            return allAnswers.shuffled()
        } catch {
            print("Error setting answers: \(error)")
            return []
        }
    }
}

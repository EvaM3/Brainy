//
//  Trivia.swift
//  TriviaGame
//


import Foundation

import Foundation
import SwiftUI

struct Trivia: Decodable {
    var results: [Result]
    var triviaId: String
    
    struct Result: Decodable, Identifiable {
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
        
        var answers: [Answer] {
            do {
                let correct = [Answer(answerId: UUID().uuidString, text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrects = try incorrectAnswers.map { answer in
                    Answer(answerId: UUID().uuidString, text: try AttributedString(markdown: answer), isCorrect: false)
                }
                let allAnswers = correct + incorrects
                
                return allAnswers.shuffled()
            } catch {
                print("Error setting answers: \(error)")
                return []
            }
        }
    }

   
}



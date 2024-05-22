//
//  Answer.swift
//  TriviaGame
//

//

import Foundation


struct Answer: Identifiable, Decodable {
    var id = UUID().uuidString
        var answerId: String
        var text: AttributedString
        var isCorrect: Bool
}

//
//  BrainyAnswerRepository.swift
//  Brainy
//
//

import Foundation
import SwiftUI


// A concrete implementation of the Answer data repository
class AnswerRepository: DataRepository {
    func get(byId id: String) -> Answer? {
        <#code#>
    }
    
  
    
    typealias T = Answer
   
    
    var answers: [Answer] = []
    
    func getAll() -> [Answer] {
        return answers
    }
//     TODO:
    
//    func get(byId id: Int) -> Answer? {
//        return answers.first(where: { $0.answerId == id })
//    }
//    
    func add(_ answer: Answer) {
        answers.append(answer)
    }
    
    func update(_ answer: Answer) {
        if let index = answers.firstIndex(where: { $0.answerId == answer.answerId }) {
            answers[index] = answer
        }
    }
    
    func delete(_ answer: Answer) {
        if let index = answers.firstIndex(where: { $0.answerId == answer.answerId }) {
            answers.remove(at: index)
        }
    }
}


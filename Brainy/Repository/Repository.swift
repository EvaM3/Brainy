//
//  RepositoryProtocol.swift
//  Brainy
//
//

import Foundation
import SwiftUI


protocol Repository {
        func getAll() async throws -> [Trivia]
        func get() async throws -> Trivia
    
}


//func getAll() -> [Trivia]
//func get() -> Trivia



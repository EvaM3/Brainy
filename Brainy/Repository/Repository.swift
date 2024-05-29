//
//  RepositoryProtocol.swift
//  Brainy
//
//

import Foundation
import SwiftUI


protocol Repository {

        func getAll() -> [Trivia]
        func get() -> Trivia
        
}



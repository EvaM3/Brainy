//
//  DataSource.swift
//  Brainy
//

//

import Foundation


protocol DataSource {
    associatedtype T
    
    
    func get(byId id: String, completion: @escaping (Result<T?, Error>) -> Void) // same here
    func getAll() -> [Trivia]
}

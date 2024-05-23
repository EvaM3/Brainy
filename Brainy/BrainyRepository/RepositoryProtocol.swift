//
//  RepositoryProtocol.swift
//  Brainy
//
//

import Foundation
import SwiftUI


/*
 Hi Prateek!
 
 I think you can have a good look at what a mess this project was before :-D
 Cleaned it up , and both datasources are now separate, not knowing from each other :-)
 Please have a look and share your thoughts with me
 
 */

protocol DataRepository {
    associatedtype T
    
    func getAll(completion: @escaping (Result<[T], Error>) -> Void)
        func get(byId id: String, completion: @escaping (Result<T?, Error>) -> Void)
        func add(_ item: T, completion: @escaping (Result<Void, Error>) -> Void)
    
   // Using completion handlers for asynchronous operations - I think this is better (for network requests)
}



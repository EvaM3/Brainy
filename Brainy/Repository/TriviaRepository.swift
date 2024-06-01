//
//  TriviaRepository.swift
//  Brainy
//
//

import Foundation


class TriviaRepository: Repository {
  
    
    
    let remoteDataSource: any DataSource = RemoteDataSource()
    
    let localDataSource: any DataSource = LocalDataSource()
    
    
    func getAll() async throws -> [Trivia] {
            // Attempt to get trivia from the local data source
            let localTrivia = try await localDataSource.getAll()
            
            if !localTrivia.isEmpty {
                // Return local trivia if possible/available
                return localTrivia
            } else {
                // Otherwise, fetch trivia from the remote data source
                let remoteTrivia = try await remoteDataSource.getAll()
                
                // TODO: Save the fetched remote trivia to the local data source for future use
              //  try await localDataSource.saveAll(remoteTrivia)
                
                // Return the remote trivia
                return remoteTrivia
            }
        }
        
        func get() async throws -> Trivia {
            // Fetch all trivia
            let allTrivia = try await getAll()
            
            // Return a random trivia item if available, else handle the case appropriately
            if let randomTrivia = allTrivia.randomElement() {
                return randomTrivia
            } else {
                // Handle the case where there are no trivia items available
                throw TriviaError.noTriviaAvailable
            }
        }
    
    
    enum TriviaError: Error {
        case noTriviaAvailable
    }
  
    
    
}

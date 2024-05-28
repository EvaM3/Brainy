//
//  TriviaRepository.swift
//  Brainy
//
//

import Foundation


class TriviaRepository: Repository {
    
    let remoteDatasource: any DataSource = RemoteDataSource()
    
    let localDataSource: any DataSource = LocalDataSource()
    
    
    
    
    func getAll(completion: @escaping (Result<[Trivia], any Error>) -> Void) {
       // if localDataSource.getAll() 
    }
    
    func get(byId id: String, completion: @escaping (Result<Trivia?, any Error>) -> Void) {
        <#code#>
    }
    
  
    
    
}

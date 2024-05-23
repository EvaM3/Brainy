//
//  RemoteDataSource.swift
//  Brainy
//
//

import Foundation
import SwiftUI

class RemoteTriviaRepository: DataRepository {

  
    typealias T = Trivia.Result
    
    private let apiURL =  "https://opentdb.com/api.php?amount=10" //API from TriviaManager
    
    //
    
    func getAll(completion: @escaping (Result<[Trivia.Result], Error>) -> Void) {
        guard let url = URL(string: apiURL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let trivia = try JSONDecoder().decode(Trivia.self, from: data)
                completion(.success(trivia.results))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func get(byId id: String, completion: @escaping (Result<Trivia.Result?, Error>) -> Void) {
        getAll { result in
            switch result {
            case .success(let triviaItems):
                let item = triviaItems.first { $0.id == id }
                completion(.success(item))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func add(_ item: Trivia.Result, completion: @escaping (Result<Void, Error>) -> Void) {
       
        // Instead of sending to a remote server, we're simulating that by printing to the console
        print("Adding trivia item: \(item)")
        completion(.success(()))
    }
}

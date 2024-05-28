//
//  RemoteDataSource.swift
//  Brainy
//
//

import Foundation
import SwiftUI

class RemoteDataSource: DataSource {

  
    typealias T = Trivia.Result
    
    private let apiURL =  "https://opentdb.com/api.php?amount=10" //API from TriviaManager
    
    
    
    func getAll(completion: @escaping (Result<[Trivia.Result], Error>) -> Void) { // returns a list of trivia objects
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
    
   
//     func getAll() async throws -> [Trivia.Result] {
//         guard let url = URL(string: apiURL) else {
//             throw NSError(domain: "Invalid URL", code: -1, userInfo: nil)
//         }
//         
//         let (data, response) = try await URLSession.shared.data(from: url)
//         
//         if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
//             let triviaResults = try JSONDecoder().decode([Trivia.Result].self, from: data)
//             return triviaResults
//         } else {
//             throw NSError(domain: "Invalid response", code: -1, userInfo: nil)
//             
//         }
//    
//         
//         do {
//             let triviaResults = try await getAll()
//         } catch {
//             print("Error fetching trivia results: \(error)")
//         }
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

}

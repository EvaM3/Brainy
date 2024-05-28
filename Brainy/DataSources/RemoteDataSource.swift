//
//  RemoteDataSource.swift
//  Brainy
//
//

import Foundation
import SwiftUI


class RemoteDataSource: DataSource {
    private let apiURL = "https://opentdb.com/api.php?amount=10"

    func getAll(completion: @escaping (Result<[Trivia], Error>) -> Void) { // returns a list of trivia objects
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
                let triviaResult = try JSONDecoder().decode(Trivia.Result.self, from: data)
                completion(.success(triviaResult.results))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }

    func get(byId id: String, completion: @escaping (Result<Trivia?, Error>) -> Void) {
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

}






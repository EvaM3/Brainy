//
//  RemoteDataSource.swift
//  Brainy
//
//

import Foundation

struct AnswerResponse: Decodable {
    let answers: [Answer]
}

class RemoteDataSource {
    
    var error: Error?
    
    init(url: URL, completion: @escaping ([Trivia.Result]?, Error?) -> Void) {
        fetchTriviaFromData(url: url, completion: completion)
    }
    // fetch trivia 
    private func fetchTriviaFromData(url: URL, completion: @escaping ([Trivia.Result]?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion([], error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
                do {
                    let trivia = try JSONDecoder().decode(Trivia.self, from: data)
                    completion(trivia.results, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, NetworkError.invalidResponse)
            }
        }.resume()
    }
    
    private enum NetworkError: Error {
        case invalidResponse
    }
}



// //HTTP 401 = unauthorized
// HTTP 429 = too many requests (your limit is one query every 5 seconds)

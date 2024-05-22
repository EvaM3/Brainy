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
    
    init(url: URL, completion: @escaping ([Answer]?, Error?) -> Void) {
        fetchAnswersFromData(url: url, completion: completion)
    }
    // fetch trivia - RENAME
    private func fetchAnswersFromData(url: URL, completion: @escaping ([Answer]?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion([], error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
                do {
                    let answers = try JSONDecoder().decode([Answer].self, from: data)
                    completion(answers, nil)
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

//class RemoteDataSource {
//    
//    var error: Error?
//    
//    init(url: URL, completion: @escaping ([Answer]?, Error?) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                completion([], error)
//                return
//            }
//// The init method takes a completion closure, can receive a list of answers or an empty list, as you wished.
//            if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
//                do {
//                    let answers = try self.fetchAnswersFromData(data: data)
//                    completion(answers, nil)
//                } catch {
//                    completion(nil, error)
//                }
//            } else {
//                completion(nil, NetworkError.invalidResponse)
//            }
//        }.resume()
//    }
//    
//    private func fetchAnswersFromData(data: Data) throws -> [Answer] {
//        return try JSONDecoder().decode([Answer].self, from: data)
//    }
//    
//    private enum NetworkError: Error {
//        case invalidResponse
//    }
//}

// //HTTP 401 = unauthorized
// HTTP 429 = too many requests (your limit is one query every 5 seconds)

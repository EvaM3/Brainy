//
//  BrainyTriviaRepository.swift
//  Brainy
//
//

import Foundation
import SwiftUI



class TriviaRepository: DataRepository {
    func getAll() -> [Trivia.Result] {
        <#code#>
    }
    
    typealias T = Trivia.Result
    
    private let remote: RemoteDataSource
    private let local: LocalDataSource
    
    init(remote: RemoteDataSource, local: LocalDataSource) {
        self.remote = remote
        self.local = local
    }
    // TODO: 
//    func getAll() -> [Trivia.Result] {
//        // Fetch trivias from the remote source and return
//        remote.fetchTrivia { [weak self] (remoteTrivias: [Trivia.Result]?, error: Error?) in
//            guard let self = self else { return }
//            if let remoteTrivias = remoteTrivias {
//                // Save remote response to local
//                self.local.addAll(remoteTrivias)
//            }
//        }
//        
//        // Return trivias from the local source
//        return local.getAll()
//    }
    
    func get(byId id: String) -> Trivia.Result? {
        // Fetch trivia from local and return
        return local.get(byId: id)
    }
    
    func add(_ trivia: Trivia.Result) {
        // Add trivia to the local source
        local.add(trivia)
    }
}






// A concrete implementation of the  Trivia data repository
//class TriviaRepository: DataRepository {
 
    
  // Going to contain 2 properties: remote and local
    
    
    
  //  typealias T = Trivia
   
    
   // var trivias: [Trivia] = []
    
 
    

   // func getAll() -> [Trivia] {
         // Trivias from local & return local
         // 1 query remote for new questions
         //2 query local for new questions
         // 3 save remote response to local then use the add function below

        // 4 return local's result from the getAll function
       // return trivias
  //  }
    
    //func get(byId id: Int) -> Trivia? {
// Fetch trivia from local & return
       // return trivias.first(where: { $0.triviaId == id })
   // }
    
   // func add(_ trivia: Trivia) {
        
      //  trivias.append(trivia)
    //}
    
   // func update(_ trivia: Trivia) { // not needed
      //  if let index = trivias.firstIndex(where: { $0.triviaId == trivia.triviaId }) {
     //       trivias[index] = trivia
       // }
    //}
    
   // func delete(_ trivia: Trivia) { // not needed
    //    if let index = trivias.firstIndex(where: { $0.triviaId == trivia.triviaId }) {
   //         trivias.remove(at: index)
    //    }
   // }
//}

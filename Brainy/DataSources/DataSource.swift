//
//  DataSource.swift
//  Brainy
//

//

import Foundation

/*
 
 Hi Prateek!
 
 Worked on the Core Data. Have a few questions on the TriviaManager removal, what you talked about. See you later.
 
 */


  protocol DataSource {
      
      func get() async throws -> Trivia?
      func getAll() async throws -> [Trivia]
      
 }


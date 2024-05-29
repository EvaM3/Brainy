//
//  DataSource.swift
//  Brainy
//

//

import Foundation

/*
 
 Hi Prateek!
 The remote and local datasources are done (or so I think). Please have a look. Next step: Trivia repository.
  That part will be updated by tomorrow (cross fingers).
   Have a great day!
 
 */


  protocol DataSource {
      
      func get() async throws -> Trivia?
      func getAll() async throws -> [Trivia]
      
 }


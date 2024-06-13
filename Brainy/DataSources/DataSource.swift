//
//  DataSource.swift
//  Brainy
//


import Foundation

 /*
     Hi Prateek!
 
 Finished the Core Data implementation in the LocalDataSource file. Please have a look. If everything is good, please provide information for the next steps/tasks. Thanks.
 
    Have a great day!
 
 
 */

  protocol DataSource {
      
      func get(byId id: String) async throws -> Trivia?
      func getAll() async throws -> [Trivia]
      
 }


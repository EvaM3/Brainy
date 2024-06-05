//
//  DataSource.swift
//  Brainy
//


import Foundation

/*
         Hi Prateek!
 
 Please have a look at the LocalDataSource (saving and extracting task for this week)  and tell me what you think.
  
 Question: I should have separate functions in each class (remote, etc.) using the mapper, right? (Considering the separation of concerns in class mappers.)
 
      Have a great day!
 */

  protocol DataSource {
      
      func get(byId id: String) async throws -> Trivia?
      func getAll() async throws -> [Trivia]
      
 }


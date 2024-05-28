//
//  DataSource.swift
//  Brainy
//

//

import Foundation


protocol DataSource {
  /*
   Hi Prateek!
   Question: Shall I leave the dataSource protocol as it was, with completion handlers? Based on the book "Modern Concurrency" it is better (asynchronous), or do the async/await? 
   Question: Clean up models, one core model: That's the Trivia. The Question struct is done, do I need to keep it like this?
     Thanks for your help :-)
   */
    
    func get() -> Trivia?
    func getAll() -> [Trivia]
}

// associatedtype T

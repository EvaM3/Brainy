//
//  DataSource.swift
//  Brainy
//


import Foundation


  protocol DataSource {
      
      func get(byId id: String) async throws -> Trivia?
      func getAll() async throws -> [Trivia]
      
 }


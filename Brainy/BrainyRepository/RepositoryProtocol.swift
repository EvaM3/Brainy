//
//  RepositoryProtocol.swift
//  Brainy
//
//

import Foundation
import SwiftUI

protocol DataRepository {
    associatedtype T
    
    func getAll() -> [T]
    func get(byId id: String) -> T?
    func add(_ item: T)
   
}


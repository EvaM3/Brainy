//
//  TriviaCRUD.swift
//  Brainy
//
//

import Foundation
import CoreData


func saveTrivia(trivia: Trivia) {
    let context = PersistenceController.shared.container.viewContext
    // let savedTrivia = trivia.toEntity(context: context)
    
    do {
        try context.save()
    } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
}

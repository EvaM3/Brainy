//
//  CachedTrivia+CoreDataProperties.swift
//  Brainy
//
//  Created by Eva Sira Madarasz on 02/06/2024.
//
//

import Foundation
import CoreData


extension CachedTrivia {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedTrivia> {
        return NSFetchRequest<CachedTrivia>(entityName: "CachedTrivia")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var category: String?
    @NSManaged public var type: String?
    @NSManaged public var difficulty: String?
    @NSManaged public var question: String?
    @NSManaged public var correctAnswer: String?
    @NSManaged public var incorrectAnswers: NSObject?

}

extension CachedTrivia : Identifiable {

}

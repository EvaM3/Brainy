//
//  TriviaEntityNSmanaged.swift
//  Brainy
//

//

import Foundation
import CoreData


@objc(TriviaEntity)
public class TriviaEntity: NSManagedObject {
    @NSManaged public var id: String?
    @NSManaged public var category: String?
    @NSManaged public var type: String?
    @NSManaged public var difficulty: String?
    @NSManaged public var question: String?
    @NSManaged public var correctAnswer: String?
    @NSManaged public var incorrectAnswers: [String]?
}

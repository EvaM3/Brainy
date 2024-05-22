//
//  TriviaManagerTests.swift
//  BrainyTests
//
//  Created by Eva Madarasz on 09/05/2024.
//

import XCTest
@testable import Brainy

final class TriviaManagerTests: XCTestCase {

    func testSuccessfulySelectedAnswer() {
        
        // Given (Arrange)
   
    let score = 0
  
        
        // When (Act)
        let manager = TriviaManager()
        let triviaScore = manager.score
     
        // Then (Assert)
        XCTAssertEqual(score, triviaScore)
        
    }
  

}

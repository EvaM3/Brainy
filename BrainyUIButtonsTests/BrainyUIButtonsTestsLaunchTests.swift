//
//  BrainyUIButtonsTestsLaunchTests.swift
//  BrainyUIButtonsTests
//
//  Created by Eva Madarasz on 11/05/2024.
//

import XCTest

final class BrainyUIButtonsTestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        func testTriviaButtonTapped() {
            let triviaButton = app.buttons["Easy level"]
            triviaButton.tap()
        }
        
        func testTriviaMediumButtonTapped() {
            let triviaMediumButton = app.buttons["Medium level"]
            triviaMediumButton.tap()
        }
        
        func testTriviaHardButtonTapped() {
            let triviaHardButton = app.buttons["Hard level"]
            triviaHardButton.tap()
        }
        
        func testTriviaLabel() {
            let welcomeLabel = app.staticTexts["Are you ready to test out your knowledge?"]
            XCTAssertTrue(welcomeLabel.exists)
        }
        
        func testTriviaLevelLabel() {
            let levelLabel = app.staticTexts["Which level is yours?"]
            XCTAssertTrue(levelLabel.exists)
        }
        
        func testTriviaGameTextLabel() {
            let gameLabel = app.staticTexts["Trivia Game"]
        }
        
        
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

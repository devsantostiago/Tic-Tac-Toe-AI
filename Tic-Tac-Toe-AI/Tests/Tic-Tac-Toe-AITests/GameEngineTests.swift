//
//  File.swift
//  
//
//  Created by Tiago Santos on 22/06/2021.
//

@testable import Tic_Tac_Toe_AI

import XCTest

class SimpleGameEngineTests: XCTestCase {
    let gameEngine = GameEngine()
    
    func testBoardsAndExpectedResults() {
        GameTestCases.boards.forEach {
            checkBoardAndExpectedResult(boardString: $0, expectedResult: $1)
        }
    }
    
    func checkBoardAndExpectedResult(boardString: String, expectedResult: PlayerSymbol?) {
        let boardArray = Helpers.convertStringIntoBoard(boardString)
        let newBoard = Board(boardArray)
        let result = gameEngine.getWinnerWith(board: newBoard)
        
        XCTAssertEqual(result, expectedResult)
    }
}

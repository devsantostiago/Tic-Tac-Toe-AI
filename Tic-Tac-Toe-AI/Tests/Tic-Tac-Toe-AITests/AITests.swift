//
//  File.swift
//  
//
//  Created by Tiago Santos on 22/06/2021.
//

import XCTest

@testable import Tic_Tac_Toe_AI

class AITests: XCTestCase {
    
    func testAISelectsOptimalMoves() {
        let board = GameTestCases.boardAISymbolAndExpectedChoice.first!.0
        let symbol = GameTestCases.boardAISymbolAndExpectedChoice.first!.1
        let optimalChoice = GameTestCases.boardAISymbolAndExpectedChoice.first!.2
        let aiChoice = getAIChoiceForBoard(boardString: board, symbol: symbol)
        XCTAssertEqual(aiChoice, optimalChoice)
    }
    
    func getAIChoiceForBoard(boardString: String, symbol: PlayerSymbol) -> Int {
        let gameEngine = GameEngine()
        let ai = AI(gameEngine: gameEngine)
        let boardArray = Helpers.convertStringIntoBoard(boardString)
        let board = Board(boardArray)
        return ai.getNextMove(board: board, symbol: symbol)
    }
    
}

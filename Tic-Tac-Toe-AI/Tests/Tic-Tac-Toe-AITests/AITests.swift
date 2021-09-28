//
//  File.swift
//  
//
//  Created by Tiago Santos on 22/06/2021.
//
@testable import Tic_Tac_Toe_AI

import XCTest
import Tic_Tac_Toe_Engine

class AITests: XCTestCase {
    
    func testAISelectsOptimalMoves() {
        GameTestCases.boardAISymbolAndExpectedChoice.forEach {
            let board = $0.0
            let symbol = $0.1
            let optimalChoice = $0.2
            let aiChoice = getAIChoiceForBoard(boardString: board, symbol: symbol)
            XCTAssertEqual(aiChoice, optimalChoice, "Testing -> board: \($0.0) symbol: \($0.1) and optimalChoice: \($0.2)")
        }
    }
    
    func getAIChoiceForBoard(boardString: String, symbol: PlayerSymbol) -> Int {
        let gameEngine = Game()
        let ai = AI(gameEngine: gameEngine)
        let boardArray = Helpers.convertStringIntoBoard(boardString)
        do {
            let board = try Board(board: boardArray)
            return ai.getNextMove(board: board, symbol: symbol)
        } catch {
            XCTFail("Unable to create board object with \(boardArray)")
            return 0
        }
    }
    
}

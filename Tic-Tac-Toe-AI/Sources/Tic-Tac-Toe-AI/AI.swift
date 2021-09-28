//
//  File.swift
//  
//
//  Created by Tiago Santos on 22/06/2021.
//

import Tic_Tac_Toe_Engine

class AI {
    
    let gameEngine: Game!
    
    init(gameEngine: Game) {
        self.gameEngine = gameEngine
    }
    
    func getNextMove(board: Board, symbol: PlayerSymbol, isAITurn: Bool = true) -> Int {
        let freeSpaces = board.getFreeSquares()
        var bestScore = -1
        var nextMove = -1
        freeSpaces.forEach {
            let score = getScoreFor(board: board,
                                    AISymbol: symbol,
                                    isAITurn: true,
                                    nextMove: $0)
            //First move is always maximising
            if score > bestScore {
                bestScore = score
                nextMove = $0
            }
        }
        return nextMove
    }
    
    func getScoreFor(board: Board, AISymbol: PlayerSymbol, isAITurn: Bool, nextMove: Int) -> Int {
        var currentBoard = board
        
        if isAITurn {
            let playerSymbol = AISymbol
            _ = currentBoard.select(square: nextMove, player: playerSymbol)
        } else {
            let playerSymbol = AISymbol.getOppositeSymbol()
            _ = currentBoard.select(square: nextMove, player: playerSymbol)
        }
        
        switch gameEngine.getWinnerWith(board: currentBoard) {
        case .cross:
            if AISymbol == .cross {
                return 1
            }
            return 0
        case .circle:
            if AISymbol == .circle {
                return 1
            }
            return -1
        case .none:
            let freeSpaces = currentBoard.getFreeSquares()
            if freeSpaces.isEmpty {
                return 0
            } else {
                var bestScore = 0
                for freeSpace in freeSpaces {
                    let isNextAI = !isAITurn
                    let nextMoveScore = self.getScoreFor(board: currentBoard,
                                            AISymbol: AISymbol,
                                            isAITurn: isNextAI,
                                            nextMove: freeSpace)
                    if isNextAI {
                        //Maximising
                        if nextMoveScore > bestScore {
                            bestScore = nextMoveScore
                        }
                    } else {
                        //Minimizing
                        if nextMoveScore < bestScore {
                            bestScore = nextMoveScore
                        }
                    }
                }
                return bestScore
            }
        }
    }
}


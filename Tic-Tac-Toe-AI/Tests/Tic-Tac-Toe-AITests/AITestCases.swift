//
//  File.swift
//  
//
//  Created by Tiago Santos on 22/06/2021.
//
import Tic_Tac_Toe_Engine

class GameTestCases {
    
    static let boardAISymbolAndExpectedChoice:[(String, PlayerSymbol, Int)] = [
        
        ("""
        O O .
        X X .
        O O X
        """, .circle, 2),
        
        ("""
        O O .
        X X .
        O O X
        """, .cross, 5),

       ( """
        O . .
        O X .
        . . .
        """, .cross, 6),

        ("""
        O O .
        . . .
        . X .
        """, .cross, 2),

        ("""
        . O .
        . X .
        . O X
        """, .circle, 0),

        ( """
         . . .
         . O .
         . . .
         """, .cross, 0)
//
//        ("""
//        X . O
//        . O .
//        . . X
//        """, .cross, 3)
        
    ]
}


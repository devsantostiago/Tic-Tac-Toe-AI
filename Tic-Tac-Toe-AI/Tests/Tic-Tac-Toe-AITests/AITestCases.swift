//
//  File.swift
//  
//
//  Created by Tiago Santos on 22/06/2021.
//

@testable import Tic_Tac_Toe_AI

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
         . O X
         . X O
         . . .
         """, .cross, 8),
        
        ("""
        . . O
        . X .
        . . .
        """, .cross, 6),
        
        ("""
        X . O
        . O .
        . . X
        """, .cross, 3)
        
    ]
    
    static let boards:[(String, PlayerSymbol?)] = [
        
        ("""
        O X O
        X O X
        X O X
        """, .none ),
        
        ("""
        O O O
        X O X
        O X X
        """, .circle ),
        
        ("""
        O X X
        O O O
        X O X
        """, .circle ),
        
        ("""
        O X X
        X O X
        O O O
        """, .circle ),
        
        ("""
        O X O
        O O X
        O X X
        """, .circle ),
        
        ("""
        X O O
        X O X
        O O X
        """, .circle ),
        
        ("""
        O X O
        X O O
        X X O
        """, .circle ),
        
        ("""
        O O X
        X O X
        O X O
        """, .circle ),
        
        ("""
        O X O
        X O X
        O X O
        """, .circle ),
        
        ("""
        X X X
        X O O
        O O X
        """, .cross ),
        
        ("""
        O X O
        X X X
        O O X
        """, .cross ),
        
        ("""
        O O X
        X O O
        X X X
        """, .cross ),
        
        ("""
        X X O
        X O O
        X O X
        """, .cross ),
        
        ("""
        O X O
        X X O
        O X X
        """, .cross ),
        
        ("""
        O X X
        X O X
        O O X
        """, .cross ),
        
        ("""
        X O X
        X X O
        O O X
        """, .cross ),
        
        ("""
        O O X
        O X X
        X O O
        """, .cross ),
        
    ]
}


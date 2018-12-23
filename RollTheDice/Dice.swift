//
//  Dice.swift
//  RollTheDice
//
//  Created by Fabricio Cordella on 20/12/18.
//  Copyright © 2018 Fabricio Cordella. All rights reserved.
//

import Foundation

struct Dice {
    let max: Int
    
    var value: Int
    
    var name : String {
        get {
            return "d\(max)"
        }
    }
    
    init(max: Int){
        self.max = max
        self.value = 0
    }
    
    mutating func roll(){
        value = Int.random(in: 1...self.max)
    }
}


struct DiceViewModel {
    
    var dices: [Dice] = [Dice(max: 4),
                         Dice(max: 6),
                         Dice(max: 8),
                         Dice(max: 10),
                         Dice(max: 20)
    ]
    
    var selectedDice: Dice?
    
    
    
}


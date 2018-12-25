//
//  Card.swift
//  Concentration
//
//  Created by Nurzhigit Smailov on 12/24/18.
//  Copyright © 2018 Nurzhigit Smailov. All rights reserved.
//

import Foundation


struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    static var identifierFactory = 0
    
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory+=1;
        return identifierFactory
    }
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
    init(identifier: Int){
//        self.identifier = identifier
        self.identifier = identifier
    }
        
}

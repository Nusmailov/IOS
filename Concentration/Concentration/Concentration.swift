//
//  Concentration.swift
//  Concentration
//
//  Created by Nurzhigit Smailov on 12/24/18.
//  Copyright © 2018 Nurzhigit Smailov. All rights reserved.
//

import Foundation


class Concentration
{
    var cards = [Card]()
    
    func chooseCard(at index: Int){
        if cards[index].isFaceUp{
            cards[index].isFaceUp = false
        }
        else{
            cards[index].isFaceUp = true
        }
    }
    init(numberOfPairsOfCards: Int){
        for identifier in 1...numberOfPairsOfCards{
            let card = Card(identifier: identifier)
            cards  += [card,card]
            //cards.append(card)
            //cards.append(card)
        }
    }
}

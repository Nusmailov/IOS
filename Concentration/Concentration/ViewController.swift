 //
//  ViewController.swift
//  Concentration
//
//  Created by Nurzhigit Smailov on 10/31/18.
//  Copyright © 2018 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   // var counter = [string, int]
    @IBOutlet var cardButtons: [UIButton]!

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    
    
    @IBAction func  touchCard(_ sender: UIButton) {
        let cardNumber = cardButtons.index(of: sender)
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("Sorry button is not in CardButton")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    var emojiChoices = ["🎃", "👻", "🎃", "👻", "😂","💋","❤️","🤩","😘"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    var flipCount = 0 {
        didSet{
            flipLabel.text = "Flips: \(flipCount)"
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        flipCount += 1;
        if(button.currentTitle == emoji){
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor =  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    @IBOutlet weak var flipLabel: UILabel!
    
}

 

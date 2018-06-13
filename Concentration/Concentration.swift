//
//  Concentration.swift
//  Concentration
//
//  Created by Armin Spahic on 05/06/2018.
//  Copyright © 2018 Armin Spahic. All rights reserved.
//

import Foundation

struct Concentration {
    
    var cards = [Card]()
    var indexOfOneFaceUpCard: Int? {
        get {
            let faceUpCardIndices = cards.indices.filter { cards[$0].isFaceUp}
            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
            
        } set {
            for index in cards.indices {
                
                    cards[index].isFaceUp = (index == newValue)
                
            }
            
        }
    }
    
   mutating func chooseCard(index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
            } else {
               
                indexOfOneFaceUpCard = index
            }
        }
    }
   mutating func restartGame() {
        for index in 0..<cards.count {
            cards[index].isMatched = false
            cards[index].isFaceUp = false
            
        }
    }
    
    init (numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            
            cards.append(card)
            cards.append(card)
           
        }
    }
    
}

//
//  ViewController.swift
//  Concentration
//
//  Created by Armin Spahic on 05/06/2018.
//  Copyright © 2018 Armin Spahic. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {

    @IBOutlet weak var flipLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    var cards = [Card]()

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var flips = 0 {
        didSet {
            updateFlipCountLabel()
            
        }
    }
   
    @IBOutlet var cardButtons: [UIButton]!
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedStringKey : Any] = [
        
            .strokeWidth : 5.0,
            .strokeColor : UIColor.orange
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flips)", attributes: attributes)
        flipLabel.attributedText = attributedString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnPressed(_ sender: UIButton) {
        
        flips = flips + 1
        if let cardNumber = cardButtons.index(of: sender) {
        print("Card number = \(cardNumber)")
            game.chooseCard(index: cardNumber)
            updateDataFromModel()
            
        }
    }
    
    @IBAction func restartBtnPressed(_ sender: UIButton) {
        game.restartGame()
        flips = 0
        
        
    }
    func updateDataFromModel() {
        if cardButtons != nil {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(card: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            }
        }
    }
    
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateDataFromModel()
        }
    }
    
  private var emojiChoices = "🎃👻😈👹👽💀🤡"
    
    var emoji = [Card: String]()
    
    func emoji(card: Card) -> String {
       
        if emoji[card] == nil {
            if emojiChoices.count > 0 {
                let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
                emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
                
            }
            
            
        }
        return emoji[card] ?? "?"
        
    }


}
extension Int {
    var arc4random: Int {
    return Int(arc4random_uniform(UInt32(self)))
    }
}


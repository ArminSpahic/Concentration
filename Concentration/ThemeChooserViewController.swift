//
//  ThemeChooserViewController.swift
//  Concentration
//
//  Created by Armin Spahic on 12/06/2018.
//  Copyright © 2018 Armin Spahic. All rights reserved.
//

import UIKit

class ThemeChooserViewController: UIViewController {
    
    let themes = [
        "Sports": "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓⛷🎳⛳️",
        "Animals": "🐶🦆🐹🐸🐘🦍🐓🐩🐦🦋🐙🐏",
        "Faces": "😀😌😎🤓😠😤😭😰😱😳😜😇"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    

    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "chooseTheme" {
            if let button = sender as? UIButton {
                if let themeName = button.currentTitle {
                    if let theme = themes[themeName] {
                        let destinationVC = segue.destination as? ConcentrationViewController
                        destinationVC?.theme = theme
                    }
                }
            }
        }
    }
 

}

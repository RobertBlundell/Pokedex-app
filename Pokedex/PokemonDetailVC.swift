//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Robert Blundell on 05/07/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    
    var DetailedPokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        Label.text = DetailedPokemon.name
        
    }
    



}

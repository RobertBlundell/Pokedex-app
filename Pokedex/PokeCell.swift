//
//  PokeCell.swift
//  Pokedex
//
//  Created by Robert Blundell on 30/06/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {

    @IBOutlet weak var Pokeimage: UIImageView!
    @IBOutlet weak var pokemonname: UILabel!
    
    var DisplayedPokemon: Pokemon!
    
    func configurecell(){
        self.Pokeimage.image = UIImage(named: "\(self.DisplayedPokemon.pokemonid)")
        self.pokemonname.text = DisplayedPokemon.name.capitalized
        layer.cornerRadius = 3
    }
    
}

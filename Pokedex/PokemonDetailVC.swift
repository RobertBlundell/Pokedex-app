//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Robert Blundell on 05/07/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    

    var DetailedPokemon: Pokemon!

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var mainimage: UIImageView!
    @IBOutlet weak var pokemondescription: UILabel!
    @IBOutlet weak var pokemontype: UILabel!
    @IBOutlet weak var pokemonheight: UILabel!
    @IBOutlet weak var pokemonweight: UILabel!
    @IBOutlet weak var pokemondefense: UILabel!
    @IBOutlet weak var pokedexID: UILabel!
    @IBOutlet weak var pokemonattack: UILabel!
    @IBOutlet weak var evolutionlabel: UILabel!
    @IBOutlet weak var firstevolution: UIImageView!
    @IBOutlet weak var secondevolution: UIImageView!
    @IBOutlet weak var thirdevolution: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label.text = DetailedPokemon.name.capitalized
        
        DetailedPokemon.downloadinformation { 
            self.pokemonheight.text = self.DetailedPokemon.pokemonHeight
            self.pokemonweight.text = self.DetailedPokemon.pokemonWeight
            self.pokemonattack.text = self.DetailedPokemon.pokemonAttack
            self.pokemondefense.text = self.DetailedPokemon.pokemonDefense
            
            print("Labels changed")
        }
        

    }
    

    
    @IBAction func leaveButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

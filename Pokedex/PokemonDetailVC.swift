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
    @IBOutlet weak var thirdevolution: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label.text = DetailedPokemon.name.capitalized
        mainimage.image = UIImage(imageLiteralResourceName: "\(DetailedPokemon.pokemonid)")
        pokedexID.text = String(DetailedPokemon.pokemonid)
        
        
        DetailedPokemon.downloadinformation() {
            self.pokemonheight.text = self.DetailedPokemon.pokemonHeight
            self.pokemonweight.text = self.DetailedPokemon.pokemonWeight
            self.pokemonattack.text = self.DetailedPokemon.pokemonAttack
            self.pokemondefense.text = self.DetailedPokemon.pokemonDefense
            self.pokemontype.text = self.DetailedPokemon.pokemonType
            self.pokemondescription.text = self.DetailedPokemon.pokemonDescription
            if self.DetailedPokemon.evolution != "" && self.DetailedPokemon.mega != "mega" {
                self.evolutionlabel.text = "The evolution of \(self.DetailedPokemon.name.capitalized) is \(self.DetailedPokemon.evolution.capitalized)!"
                self.thirdevolution.image = UIImage(named: "\(Int(self.DetailedPokemon.pokemonid) + 1)")
                self.thirdevolution.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
            } else {self.evolutionlabel.text = "\(self.DetailedPokemon.name.capitalized) has no evolution"}
        }
        

    }
    

    
    @IBAction func leaveButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

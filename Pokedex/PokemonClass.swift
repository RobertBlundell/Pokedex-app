//
//  PokemonClass.swift
//  Pokedex
//
//  Created by Robert Blundell on 30/06/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import Foundation

class Pokemon {

    private var _name: String!
    private var _pokemonid: Int!
    
    var name: String {
        return _name
    }

    var pokemonid: Int {
        return _pokemonid
    }
    
    init(name: String, pokemonid: Int) {
        _name = name
        _pokemonid = pokemonid
    }


}

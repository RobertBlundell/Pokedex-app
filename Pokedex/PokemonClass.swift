//
//  PokemonClass.swift
//  Pokedex
//
//  Created by Robert Blundell on 30/06/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {

    fileprivate var _name: String!
    fileprivate var _pokemonid: Int!
    private var _nameLabel: String!
    private var _mainImage: String!
    private var _pokemonDescription: String!
    private var _pokemonType: String!
    private var _pokemonHeight: String!
    private var _pokemonWeight: String!
    private var _pokemonDefense: String!
    private var _pokedexID: String!
    private var _pokemonAttack: String!
    private var _evolutionLabel: String!
    private var _firstEvolution: String!
    private var _secondEvolution: String!
    private var _thirdEvolution: String!
    
    private var pokemonURL:String!
    
    var nameLabel: String {
        if _nameLabel == nil {
            return ""
        }
        return _nameLabel
    }
    
    var mainimage: String {
        if _mainImage == nil {
            return ""
        }
        return _mainImage
    }
    
    var pokemonDescription: String {
        if _pokemonDescription == nil {
            return ""
        }
        return _pokemonDescription
    }
    
    var pokemonType: String {
        if _pokemonType == nil {
            return ""
        }
        return _pokemonType
    }
    
    var pokemonHeight: String {
        if _pokemonHeight == nil {
            return ""
        }
        return _pokemonHeight
    }
    
    var pokemonWeight: String {
        if _pokemonWeight == nil {
            return ""
        }
        return _pokemonWeight
    }
    
    var pokemonDefense: String {
        if _pokemonDefense == nil {
            return ""
        }
        return _pokemonDefense
    }
    
    var pokedexID: String {
        if _pokedexID == nil {
            return ""
        }
        return _pokedexID
    }
    
    var pokemonAttack: String {
        if _pokemonAttack == nil {
            return ""
        }
        return _pokemonAttack
    }
    
    var evolutionLabel: String {
        if _evolutionLabel == nil {
            return ""
        }
        return _evolutionLabel
    }
    
    var firstEvolution: String {
        if _firstEvolution == nil {
            return ""
        }
        return _firstEvolution
    }
    
    var secondEvolution: String {
        if _secondEvolution == nil {
            return ""
        }
        return _secondEvolution
    }
    
    var thirdEvolution: String {
        if _thirdEvolution == nil {
            return ""
        }
        return _thirdEvolution
    }
    
    var name: String {
        return _name
    }

    var pokemonid: Int {
        return _pokemonid
    }
    
    init(name: String, pokemonid: Int) {
        _name = name
        _pokemonid = pokemonid
        
        pokemonURL = "http://pokeapi.co/api/v1/pokemon/\(pokemonid)"
    }
    
    func downloadinformation(complete: @escaping () -> ()) {
        
        request(pokemonURL).responseJSON { URLResponse in
            print(URLResponse)
            
            if let dict = URLResponse.result.value as? Dictionary<String, Any?> {
                
                if let weight = dict["weight"] as? String {
                    self._pokemonWeight = weight
                    print("weight:\(self.pokemonWeight)")
                }
                
                if let height = dict["height"] as? String {
                    self._pokemonHeight = height
                    print("height:\(self.pokemonHeight)")
                }
                
                if let attack = dict["attack"] as? Int {
                    self._pokemonAttack = "\(attack)"
                    print("attack:\(self.pokemonAttack)")
                }
                
                if let defense = dict["defense"] as? Int {
                    self._pokemonDefense = "\(defense)"
                    print("defense:\(self.pokemonDefense)")
                }
                
                
            }
            complete()
            
        }
        
    }
    
    

}

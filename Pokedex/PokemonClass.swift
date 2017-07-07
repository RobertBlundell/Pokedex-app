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
    private var _pokemonType = ""
    private var _pokemonHeight: String!
    private var _pokemonWeight: String!
    private var _pokemonDefense: String!
    private var _pokemonAttack: String!
    private var _evolution: String!
    private var _mega: String!
    
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
    
    var pokemonAttack: String {
        if _pokemonAttack == nil {
            return ""
        }
        return _pokemonAttack
    }
    
    var evolution: String {
        if _evolution == nil {
            return ""
        }
        return _evolution
    }
    
    var mega: String {
        if _mega == nil {
            return ""
        }
        return _mega
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
                
                if let types = dict["types"] as? [Dictionary<String,String>], types.count > 0 {
                    self._pokemonType = ""
                    for type in types {
                        if type != types[0] {
                            self._pokemonType.append(" / ")
                        }
                        if let name = type["name"]{
                            self._pokemonType.append(name.capitalized)
                        }
                    }
                    print(self.pokemonType)
                }
                
                if let evolutiondict = dict["evolutions"] as? [Dictionary<String,Any>], evolutiondict.count > 0 {
                    if let evolution = evolutiondict[0]["to"] as? String {
                        self._evolution = evolution
                    }
                    if let mega = evolutiondict[0]["detail"] as? String{
                        self._mega = mega
                        print(mega)
                    }
                }
                
                if let descriptions = dict["descriptions"] as? [Dictionary<String,String>], descriptions.count > 0 {
                    if let resource = descriptions[0]["resource_uri"] {
                        let descriptionURL = "http://pokeapi.co\(resource)"
                        request(descriptionURL).responseJSON { URLResponse in
                            if let dict = URLResponse.result.value as? Dictionary<String, Any> {
                                if let finaldescription = dict["description"] as? String {
                                    let finalfinaldescription = finaldescription.replacingOccurrences(of: "POKMON", with: "pokemon")
                                    self._pokemonDescription = finalfinaldescription
                                }
                            }
                            complete()
                        }
                    }
                }
            }
            complete()
            
        }
        
    }
    
    

}

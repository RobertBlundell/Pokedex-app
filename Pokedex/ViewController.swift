//
//  ViewController.swift
//  Pokedex
//
//  Created by Robert Blundell on 14/06/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    @IBOutlet weak var PokeCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PokeCollection.delegate = self
        PokeCollection.dataSource = self
    }

    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Pokecell", for: indexPath) as? PokeCell {
            
            cell.DisplayedPokemon = Pokemon(name: "Pokemon", pokemonid: indexPath.row)
            cell.configurecell()
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //write what happens when it is selected
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 100)
//    }
    

}



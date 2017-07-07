//
//  ViewController.swift
//  Pokedex
//
//  Created by Robert Blundell on 14/06/2017.
//  Copyright © 2017 Robert Blundell. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate  {

    @IBOutlet weak var PokeCollection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var pokemons: [Pokemon] = []
    var pokemonssearched: [Pokemon] = []
    var pokemonmusicplayer: AVAudioPlayer!
    var insearchmode: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startaudio()
        PokeCollection.delegate = self
        PokeCollection.dataSource = self
        searchBar.delegate = self
        
        searchBar.returnKeyType = UIReturnKeyType.done
        
        parsepokemoncsv()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" || searchBar.text == nil {
            insearchmode = false
            PokeCollection.reloadData()
            
        } else {
            insearchmode = true
            
            let lower = searchBar.text?.lowercased()
            pokemonssearched = pokemons.filter({$0.name.localizedStandardRange(of: lower!) != nil})
            PokeCollection.reloadData()
        }
    }
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    
    
    func startaudio() {
        
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")
        
        do{
            
            pokemonmusicplayer = try AVAudioPlayer(contentsOf: URL(string: path!)!)
            pokemonmusicplayer.prepareToPlay()
            pokemonmusicplayer.numberOfLoops = -1
            pokemonmusicplayer.play()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    @IBAction func musicbuttonpressed(_ sender: UIButton) {
        if pokemonmusicplayer.isPlaying {
            pokemonmusicplayer.pause()
            sender.alpha = 0.4
        } else {
            pokemonmusicplayer.play()
            sender.alpha = 1
        }
    
    }
    
    
    func parsepokemoncsv() {
        
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do { let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let pokename = row["identifier"]!
                
                let thispokemon = Pokemon(name: pokename, pokemonid: pokeId)
            
                pokemons.append(thispokemon)
                
            }
            
            
        } catch let err as NSError {
           print(err.debugDescription)
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Pokecell", for: indexPath) as? PokeCell {
            
            if insearchmode{
                cell.DisplayedPokemon = pokemonssearched[indexPath.row]
                cell.configurecell()
                return cell
            } else {
                cell.DisplayedPokemon = pokemons[indexPath.row]
                cell.configurecell()
                return cell
            }
            
            
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        searchBar.endEditing(true)
        //Transitions to PokemonDetailVC
        
        var SelectedPokemon: Pokemon
            
        if insearchmode{
            SelectedPokemon = pokemonssearched[indexPath.row]
        } else {
            SelectedPokemon = pokemons[indexPath.row]
        }
        performSegue(withIdentifier: "PokemonDetailSegue", sender: SelectedPokemon)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "PokemonDetailSegue" {
            if let PokeView = segue.destination as? PokemonDetailVC {
                if let SelectedPokemon = sender as? Pokemon {
                    PokeView.DetailedPokemon = SelectedPokemon
                }
            }
//        }
    }
    
//        I think thefollowing code is redundant— only needed if there are multiple segues in your app.
//        if segue.identifier == "PokemonDetailVC" {
//        }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if insearchmode{
            return pokemonssearched.count
        } else { return pokemons.count}
    }
    
  
    
//    I believe thses aren't needed — The information is already present in the IB
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 100)
//    }
    

}



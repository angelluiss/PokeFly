//
//  HomeVM.swift
//  PokeFly
//
//  Created by Angel  Rangel  on 28/04/2023.
//

import Alamofire
import CoreData
import UIKit

final class PokemonVM: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [PokemonGe]()
    @Published var pokemonDetails: PokemonDatos?
    @Published var pokemonDetailsMultiples = [PokemonDatos]()
    @Published var searchText = ""
    
    // Used with searchText to filter pokemon results
    var filteredPokemon: [PokemonDatos] {
        return searchText == "" ? pokemonDetailsMultiples : pokemonDetailsMultiples.filter { $0.name.contains(searchText.lowercased()) ||
            $0.types.map({ typeElement in
                typeElement.type.name
            }).contains(searchText.lowercased()) ||
            
            $0.abilities.map({ ability in
                ability.ability.name
            }).contains(searchText.lowercased())
        }
    }
    
    init() {
        getPokemon()
        print(pokemonDetailsMultiples.count)
    }
    
    //Get Pokemon Data
    func getPokemon() {
        pokemonManager.fetchPokemons() { data in
            DispatchQueue.main.async {
                self.pokemonList = data
                var countsf = 0
                for pokemon in self.pokemonList {
                    self.getDetails(pokemon: pokemon)
                    countsf += 1
                }
            }
        }
    }
    
    func fetchMorePokemons() {
        pokemonManager.fetchPokemons() { data in
            DispatchQueue.main.async {
                self.pokemonList = data
                var countsf = 0
                for pokemon in self.pokemonList {
                    self.getDetails(pokemon: pokemon)
                    countsf += 1
                }
            }
        }
    }

    // Get the index of a pokemon ( index + 1 = pokemon id)
    func getPokemonIndex(pokemon: PokemonGe) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getPokemonDetailIndex(pokemon: PokemonDatos) -> Int {
        if let index = self.pokemonDetailsMultiples.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    // Get specific details for a pokemon
    func getDetails(pokemon: PokemonGe) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
                if self.pokemonDetails != nil {
                    self.pokemonDetailsMultiples.append(self.pokemonDetails!)

                }
            }
        }
    }
      
}



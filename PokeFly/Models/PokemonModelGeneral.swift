//
//  PokemonModelGeneral.swift
//  PokeFly
//
//  Created by Angel  Rangel  on 30/04/2023.
//

import Foundation

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [PokemonGe]
}

struct PokemonGe: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var samplePokemon = PokemonGe(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}



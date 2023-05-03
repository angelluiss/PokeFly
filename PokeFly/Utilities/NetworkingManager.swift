//
//  NetworkingManager.swift
//  PokeFly
//
//  Created by Angel  Rangel  on 28/04/2023.
//

import Alamofire
import Foundation

class PokemonManager {
    
    func fetchPokemons(completion: @escaping ([PokemonGe]) -> Void ) {
        AF.request("https://pokeapi.co/api/v2/pokemon?limit=30&offset=0")
            .validate()
            .responseDecodable(of: PokemonPage.self) { response in
                switch response.result {
                case .success(let pokemonList):
                   
                    completion(pokemonList.results)
                case .failure(let error):
                    print(error)
                    completion([])
                    return
                }
            }
    }
    
    
    func getDetailedPokemon(id: Int, _ completion: @escaping (PokemonDatos) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: PokemonDatos.self) { data in
            completion(data)
            
        } failure: { error in
            print(error)
        }

    }
}

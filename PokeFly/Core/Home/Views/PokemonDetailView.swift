//
//  PokemonDetailView.swift
//  PokeFly
//
//  Created by Angel  Rangel  on 28/04/2023.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: PokemonVM
    let pokemon: PokemonDatos
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 60)),
        GridItem(.adaptive(minimum: 60)),
        GridItem(.adaptive(minimum: 60))
    ]
    
    var body: some View {
        
        ScrollView {
            VStack {
                PokemonElement(pokemon: pokemon)
                
                VStack(spacing: 10) {
                    Text("**Habilities**:")
                    List {
                        ForEach(vm.pokemonDetails?.abilities ?? []) { item in
                            
                            Text("\(item.ability.name)")
                            
                        }
                    }
                    .frame(minWidth: 300, idealWidth: 200,maxWidth: 400, minHeight: 120, idealHeight: 130, maxHeight: 150)
                    
                    
                    
                    Text("**Moves**:")
                    List {
                        ForEach(vm.pokemonDetails?.moves ?? []) { item in
                            
                            Text("\(item.move.name)")
                            
                        }
                    }
                    .frame(minWidth: 400, idealWidth: 200, minHeight: 80, idealHeight: 180, maxHeight: 300)
                    
                    
                }
                .padding()
            }
        }
        
    }
    
}


//struct PokemonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailView(pokemon: PokemonGe.samplePokemon)
//            .environmentObject(PokemonVM())
//    }
//}

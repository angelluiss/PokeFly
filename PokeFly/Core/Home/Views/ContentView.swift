//
//  ContentView.swift
//  PokeFly
//
//  Created by Angel  Rangel  on 28/04/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = PokemonVM()
    let dimensions: Double = 140
    
    private let adaptiveColumns = [
        GridItem(.flexible(minimum: 60)),
        GridItem(.flexible(minimum: 60))
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredPokemon) { pokemon in
    
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)
                        ) {
                            PokemonElement(pokemon: pokemon)
                            
                        }
                        .onAppear {
                            if pokemon == vm.pokemonDetailsMultiples.last {
                                print("Ultimo")
                            }
                        }
                    }
                }
                
                .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                .navigationTitle("PokemonUI")
                .navigationBarTitleDisplayMode(.inline)
               
                
            }
            
            .searchable(text: $vm.searchText)
            
        }
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

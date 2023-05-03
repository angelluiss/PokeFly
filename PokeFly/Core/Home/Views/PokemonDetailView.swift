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
    let viewModel: PokemonCellViewModel
    
    init(pokemon: PokemonDatos) {
        self.pokemon = pokemon
        self.viewModel = PokemonCellViewModel(pokemon: pokemon)
    }
    
    private let adaptiveColumns = [
        GridItem(.flexible(minimum: 60)),
        GridItem(.flexible(minimum: 60))

      
    ]
    
    var body: some View {
        
        ZStack {
            ScrollView {
                PokemonElement(pokemon: pokemon, dimensions: 160)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 40, trailing: 10))
                
                VStack {
        
                    Text("Habilities")
                        .foregroundColor(Color(viewModel.backgroundColor))
                        .font(.system(size: 20, weight: .regular, design: .monospaced))
                        .padding(.top, 5)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(vm.pokemonDetails?.abilities ?? []) { item in
                                
                                Text("\(item.ability.name)")
                                    .font(.subheadline).bold()
                                    .foregroundColor(.white)
                                    .padding(.init(top: 8, leading: 10, bottom: 8, trailing: 10))
                                    .background(Color(viewModel.backgroundColor))
                                    .cornerRadius(20)
                            }
                            
                        }
                    }
                   
                    HStack { Spacer() }
                }
                .cornerRadius(40)
                .padding(.top, -20)
                .zIndex(-1)
                
                
                Text("Moves")
                    .foregroundColor(Color(viewModel.backgroundColor))
                    .font(.system(size: 20, weight: .regular, design: .monospaced))
                    .padding(.top, 5)
                    .cornerRadius(40)
                
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(vm.pokemonDetails?.moves ?? []) { item in
                        
                        Text("\(item.move.name)")
                            .font(.subheadline).bold()
                            .foregroundColor(.white)
                            .padding(.init(top: 8, leading: 10, bottom: 8, trailing: 10))
                            .background(Color(viewModel.backgroundColor))
                            .cornerRadius(20)
                        
                        
                    }
                    
                }
                .zIndex(-1)     
                
            }
        }
        
    }
    
}




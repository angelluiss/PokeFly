//
//  HomeView.swift
//  PokeFly
//
//  Created by Angel  Rangel  on 28/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonElement: View {
    @EnvironmentObject var vm: PokemonVM
    let pokemon: PokemonDatos
    var dimensions: Double = 60
    let viewModel: PokemonCellViewModel
    
    init(pokemon: PokemonDatos, dimensions: Double) {
        self.dimensions = dimensions
        self.pokemon = pokemon
        self.viewModel = PokemonCellViewModel(pokemon: pokemon)
    }
    
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                Text("\(pokemon.name.capitalized)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 4)
                    .padding(.leading)
                Spacer()
                
                HStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            
                            ForEach(pokemon.types) { item in
                                
                                Text("\(item.type.name)")
                                    .font(.subheadline).bold()
                                    .foregroundColor(.white)
                                    .padding(.init(top: 8, leading: 16, bottom: 8, trailing: 16))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.white.opacity(0.25)))
//                                    .frame(width: 100, height: 24)
                                
                            }
                            
                        }
                        
                    }
                    .padding(.horizontal)
                   
                    
                    WebImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonDetailIndex(pokemon: pokemon)).png"))
                        .resizable()
                        .placeholder(Image(systemName: "photo\(vm.getPokemonDetailIndex(pokemon: pokemon))"))
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                        .background(.thinMaterial)
                        .clipShape(Circle())
                        .padding(8)
                }
            }.padding(.top, 4)
        }
        .background(Color(viewModel.backgroundColor))
        .cornerRadius(12)
        .shadow(color: Color(viewModel.backgroundColor), radius: 6, x: 0, y: 0)
        
        
        
        
    }
    
}




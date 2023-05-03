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
            let dimensions: Double = 140

            var body: some View {
                VStack {
                    
                    WebImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonDetailIndex(pokemon: pokemon)).png"))
                               .resizable()
                               .placeholder(Image(systemName: "photo\(vm.getPokemonDetailIndex(pokemon: pokemon))"))
                               .indicator(.activity)
                               .transition(.fade(duration: 0.5))
                               .scaledToFit()
                               .frame(width: dimensions, height: dimensions)
                               .background(.thinMaterial)
                               .clipShape(Circle())

                    Text("\(pokemon.name.capitalized)")
                        .font(.system(size: 16, weight: .regular, design: .monospaced))
                        .padding(.bottom, 5)
                
                    ForEach(pokemon.types) { item in
                        
                        Text("\(item.type.name)")
                        
                    }
                
                              

                }
                
            }
    
}



//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(pokemon: PokemonGe.samplePokemon, pokemonDetail: <#PokemonDatos#>)
//            .environmentObject(PokemonVM())
//    }
//}



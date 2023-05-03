//
//  ContentView.swift
//  PokeFly
//
//  Created by Angel  Rangel  on 28/04/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = PokemonVM()
    @State var showFilterButtons = false
    @State var filterApplied = false
    
   
    
    private let adaptiveColumns = [
        GridItem(.flexible(minimum: 60)),
        GridItem(.flexible(minimum: 60))
    ]
    
    var body: some View {
        NavigationView {
            ZStack (alignment: .bottomTrailing){
                
                ScrollView {
                    LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                        ForEach(vm.filteredPokemon) { pokemon in
                            
                            NavigationLink(destination: PokemonDetailView(pokemon: pokemon)
                            ) {
                                PokemonElement(pokemon: pokemon, dimensions: 60)
                                
                            }
                            
                        }
                    }
                    
                    .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                    .navigationTitle("PokemonUI")
                    .navigationBarTitleDisplayMode(.inline)
                    
                    
                }
                
                .searchable(text: $vm.searchText)
                
                
                VStack {
                    if showFilterButtons {
                        FloatingActionButton(imageName: "fire", backgroundColor: .red, show: $showFilterButtons) {
                            filterApplied.toggle()
                            showFilterButtons.toggle()
                        }
                        FloatingActionButton(imageName: "leaf", backgroundColor: .green, show: $showFilterButtons) {
                            filterApplied.toggle()
                            showFilterButtons.toggle()
                            
                        }
                        FloatingActionButton(imageName: "water", backgroundColor: .blue, show: $showFilterButtons) {
                            filterApplied.toggle()
                            showFilterButtons.toggle()
                            
                        }
                        FloatingActionButton(imageName: "lightning", backgroundColor: .yellow, show: $showFilterButtons) {
                            filterApplied.toggle()
                            showFilterButtons.toggle()
                        }
                    }
                    
                    let imageName = filterApplied ? "refresh" : "filter"
                    FloatingActionButton(imageName: imageName, height: 36, width: 36, show: $showFilterButtons) {
                        filterApplied ? filterApplied.toggle() : showFilterButtons.toggle()
                    }.rotationEffect(.init(degrees: self.showFilterButtons ? 180 : 0))
                    
                }
                .padding()
                .animation(.spring())
            }
            
            
        }
        .environmentObject(vm)
    }
}



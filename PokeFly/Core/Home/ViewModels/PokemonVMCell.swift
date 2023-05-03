//
//  PokemonVMCell.swift
//  PokeFly
//
//  Created by Angel  Rangel  on 03/05/2023.
//

import Foundation
import SwiftUI


struct PokemonCellViewModel {
    let pokemon: PokemonDatos

    var backgroundColor: UIColor {
        switch pokemon.types[0].type.name {
        case "fire": return .systemRed
        case "poison", "bug": return .systemGreen
        case "water": return .systemTeal
        case "electric": return .systemYellow
        case "psychic": return .systemPurple
        case "normal": return .systemOrange
        case "ground": return .systemGray
        case "flying": return .systemBlue
        case "fairy": return .systemPink
        default: return .systemIndigo
        }
    }

    init(pokemon: PokemonDatos) {
        self.pokemon = pokemon
    }
}

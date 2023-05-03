//
//  PokemonDatos.swift
//  PokeFly
//
//  Created by Angel  Rangel  on 28/04/2023.
//

import Foundation


struct PokemonDatos: Codable, Identifiable, Equatable {
 
    let abilities: [Ability]
    let id: Int
    let moves: [Move]
    let name: String
    let species: Species
    let stats: [Stat]
    let types: [TypeElement]
    
    static func == (lhs: PokemonDatos, rhs: PokemonDatos) -> Bool {
           return lhs.id == rhs.id &&
               lhs.abilities == rhs.abilities &&
               lhs.moves == rhs.moves &&
               lhs.name == rhs.name &&
               lhs.species == rhs.species &&
               lhs.stats == rhs.stats &&
               lhs.types == rhs.types
       }
    
    enum CodingKeys: String, CodingKey {
           case abilities, id, moves, name, species, stats, types
    }
}


// MARK: - Ability
struct Ability: Codable, Identifiable, Equatable {
   
    let id = UUID()
    let ability: Species
    let isHidden: Bool
    let slot: Int

    static func == (lhs: Ability, rhs: Ability) -> Bool {
        return lhs.id == rhs.id &&
            lhs.ability == rhs.ability &&
            lhs.isHidden == rhs.isHidden &&
            lhs.slot == rhs.slot
    }

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}


// MARK: - Species
struct Species: Codable, Equatable {
    let name: String
    let url: String
    
    static func == (lhs: Species, rhs: Species) -> Bool {
        return lhs.name == rhs.name && lhs.url == rhs.url
    }
}




// MARK: - Move
struct Move: Codable, Identifiable, Equatable {
    let id = UUID()
    let move: Species
    let versionGroupDetails: [VersionGroupDetail]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }

    static func == (lhs: Move, rhs: Move) -> Bool {
        return lhs.id == rhs.id &&
               lhs.move == rhs.move &&
               lhs.versionGroupDetails == rhs.versionGroupDetails
    }
}


// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable, Equatable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: Species

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}


// MARK: - Stat
struct Stat: Codable, Equatable {
    let baseStat, effort: Int
    let stat: Species

    static func ==(lhs: Stat, rhs: Stat) -> Bool {
        return lhs.baseStat == rhs.baseStat &&
            lhs.effort == rhs.effort &&
            lhs.stat == rhs.stat
    }

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}


// MARK: - TypeElement
struct TypeElement: Codable, Identifiable, Equatable {
    let id = UUID()
    let slot: Int
    let type: Species
}






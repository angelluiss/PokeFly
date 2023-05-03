//
//  PokeFlyTests.swift
//  PokeFlyTests
//
//  Created by Angel  Rangel  on 03/05/2023.
//

import XCTest
@testable import PokeFly
@testable import Alamofire
@testable import SDWebImageSwiftUI

final class PokeFlyTests: XCTestCase {
    
    override func setUpWithError() throws {    }
    
    override func tearDownWithError() throws {    }
    
    func testFetchPokemons() {
        // 1. Configura las expectativas
        let expectation = self.expectation(description: "La lista de Pokémon debe ser recibida")
        let api = PokemonManager() // Crea una instancia de la clase que contiene la función fetchPokemons
        
        // 2. Ejecuta la función a probar
        api.fetchPokemons { (pokemonList) in
            
            // 3. Verifica que los resultados sean los esperados
            XCTAssertGreaterThan(pokemonList.count, 0, "La lista de Pokémon debe contener al menos un Pokémon")
            XCTAssertNotNil(pokemonList.first?.name, "El nombre del primer Pokémon en la lista no debe ser nulo")
            
            // 4. Cumple las expectativas
            expectation.fulfill()
        }
        
        // 5. Espera a que se cumplan las expectativas
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchPokemonsRequest() {
        // 1. Configura las expectativas
        let expectation = self.expectation(description: "La solicitud debe tener éxito y devolver una lista de Pokémon")
        let api = PokemonManager() // Crea una instancia de la clase que contiene la función fetchPokemons
        
        // 2. Ejecuta la función a probar
        api.fetchPokemons { (pokemonList) in
            
            // 3. Verifica que los resultados sean los esperados
            XCTAssertGreaterThan(pokemonList.count, 0, "La lista de Pokémon debe contener al menos un Pokémon")
            XCTAssertNotNil(pokemonList.first?.name, "El nombre del primer Pokémon en la lista no debe ser nulo")
            
            // 4. Cumple las expectativas
            expectation.fulfill()
        }
        
        // 5. Espera a que se cumplan las expectativas
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetDetailedPokemon() {
        let expectation = XCTestExpectation(description: "Pokemon datos loaded")
        let pokemonID = 1
        let api = PokemonManager()
        
        api.getDetailedPokemon(id: pokemonID) { pokemonDatos in
            XCTAssertNotNil(pokemonDatos)
            XCTAssertEqual(pokemonDatos.id, pokemonID)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    
    
}

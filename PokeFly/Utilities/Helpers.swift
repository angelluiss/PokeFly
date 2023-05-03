//
//  Helpers.swift
//  PokeFly
//
//  Created by Angel  Rangel  on 30/04/2023.
//

import Foundation
import SwiftUI


extension Bundle {
    func fetchData<T: Decodable> (url: String, model: T.Type, completion: @escaping(T) -> (), failure: @escaping(Error) -> ()){
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    failure(error)
                }
                return
            }
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(serverData)
            }catch {
                failure(error)
            }
        }
        .resume()
    }
    
   
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

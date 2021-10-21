//
//  BreweryClass.swift
//  MVVM-Test
//
//  Created by Michael Gemsa on 21.10.21.
//

import Foundation

struct Brewery: Decodable, Hashable {
    let name: String
    let street: String
    let city: String
}

//
//  BreweryClass.swift
//  MVVM-Test
//
//  Created by Michael Gemsa on 21.10.21.
//

import Foundation

struct Brewery: Decodable, Hashable, Identifiable {
    let id: Int
    let title: String
    let body: String
}

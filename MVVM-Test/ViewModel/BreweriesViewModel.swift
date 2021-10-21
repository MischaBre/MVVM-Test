//
//  BreweriesViewModel.swift
//  MVVM-Test
//
//  Created by Michael Gemsa on 21.10.21.
//

import Combine
import SwiftUI

class BreweriesViewModel: ObservableObject {
    private let url = URL(string: "https://api.openbrewerydb.org/breweries")
    private var task: AnyCancellable?
    
    @Published var breweries: [Brewery] = []
    
    func fetchBreweries() {
        task = URLSession.shared.dataTaskPublisher(for: url!)
            .map { $0.data }
            .decode(type: [Brewery].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \BreweriesViewModel.breweries, on: self)
    }
}

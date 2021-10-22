//
//  BreweriesViewModel.swift
//  MVVM-Test
//
//  Created by Michael Gemsa on 21.10.21.
//

import Combine
import SwiftUI

class BreweriesViewModel: ObservableObject {
    private let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    private var task: AnyCancellable?
    
    @Published var breweries: [Brewery] = []
    
    func fetchBreweries() {
        //guard let url = Bundle.main.url(forResource: "TestData", withExtension: "json")
        //            else {
        //                print("Json file not found")
        //                return
        //            }
        //let data = try? Data(contentsOf: url)
        //let breweries = try? JSONDecoder().decode([Brewery].self, from: data!)
        //self.breweries = breweries!
        
        task = URLSession.shared.dataTaskPublisher(for: url!)
            .map { $0.data }
            .decode(type: [Brewery].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \BreweriesViewModel.breweries, on: self)
    }
}

//
//  BreweryView.swift
//  MVVM-Test
//
//  Created by Michael Gemsa on 21.10.21.
//

import SwiftUI

struct BreweriesView: View {
    @ObservedObject var viewModel = BreweriesViewModel()
    //let breweries = [Brewery]()
    var body: some View {
        NavigationView {
            List(viewModel.breweries, id: \.self) {
                BreweryView(brewery: $0)
            }.navigationBarTitle("Breweries")
                .onAppear {
                    self.viewModel.fetchBreweries()
            }
        }
    }
}

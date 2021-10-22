//
//  BreweryView.swift
//  MVVM-Test
//
//  Created by Michael Gemsa on 21.10.21.
//

import SwiftUI

struct BreweriesView: View {
    @ObservedObject var viewModel = BreweriesViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.breweries) {
                BreweryView(brewery: $0)
            }.navigationBarTitle("Posts")
                .onAppear {
                    self.viewModel.fetchBreweries()
            }
        }
    }
}

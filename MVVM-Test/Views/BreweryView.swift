//
//  BreweryView.swift
//  MVVM-Test
//
//  Created by Michael Gemsa on 21.10.21.
//

import SwiftUI

struct BreweryView: View {
    private let brewery: Brewery
    init(brewery: Brewery) {
        self.brewery = brewery
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Text(String(brewery.id))
                    Text(brewery.title)
                        .font(.system(size: 18))
                        .foregroundColor(Color.blue)
                }
                Text("\(brewery.body)")
                    .font(.system(size: 14))
            }
        }
    }
}

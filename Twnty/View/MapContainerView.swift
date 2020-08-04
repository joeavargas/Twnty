//
//  MapContainerView.swift
//  Twnty
//
//  Created by Joe Vargas on 8/4/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import SwiftUI

struct MapContainerView: View {
    
    @ObservedObject var covidFetch = NetworkRequest()
    
    var body: some View {
        MapView(countryData: $covidFetch.allCountries)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}

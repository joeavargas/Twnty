//
//  ContentView.swift
//  Twnty
//
//  Created by Joe Vargas on 7/31/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var covidFetch = NetworkRequest()
    
    var body: some View {
        Text("\(covidFetch.totalData.confirmed)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

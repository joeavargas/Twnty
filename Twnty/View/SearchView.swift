//
//  SearchView.swift
//  Twnty
//
//  Created by Joe Vargas on 8/3/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        
        HStack{
            TextField("Country...", text: $searchText)
            .padding()
        }
    .frame(height: 50)
    .background(Color("cardBackgroundGray"))
    
    }
}


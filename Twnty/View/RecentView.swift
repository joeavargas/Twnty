//
//  RecentView.swift
//  Twnty
//
//  Created by Joe Vargas on 8/2/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import SwiftUI

struct RecentView: View {
    
    @ObservedObject var covidFetch = NetworkRequest()
    @State var searchText = ""
    @State var isSearchVisible = false
    
    var body: some View {
        NavigationView{
            
            VStack{
                if isSearchVisible{
                    SearchView(searchText: $searchText)
                }
                
                TotalDataView(totalData: covidFetch.totalData)
                ListHeaderView()
                
                List{
                    ForEach(covidFetch.allCountries.filter{
                        self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id: \.country){ countryData in
                        
                        NavigationLink(destination: CountryDetailView(countryData: countryData)){
                            CountryDataRowView(countryData: countryData)
                        }
                    }
                }
            }//End of VStack
                .navigationBarTitle("Recent Data", displayMode: .inline)
                .navigationBarItems(trailing:
                    
                    Button(action: {
                        self.isSearchVisible.toggle()
                        
                        if !self.isSearchVisible{
                            self.searchText = ""
                        }
                    }, label: {
                        Image(systemName: "magnifyingglass")
                    })
            )
        }// End of Navigation Stack
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}

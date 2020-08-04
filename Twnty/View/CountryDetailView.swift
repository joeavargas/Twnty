//
//  CountryDetailView.swift
//  Twnty
//
//  Created by Joe Vargas on 8/4/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    var countryData: CountryData
    
    var body: some View {
        VStack{
            VStack{
                CountryDetailRow(number: countryData.confirmed.formatNumber(), name: "Confirmed")
                    .padding(.top)
                CountryDetailRow(number: countryData.critical.formatNumber(), name: "Critical", color: .yellow)
                CountryDetailRow(number: countryData.deaths.formatNumber(), name: "Deaths", color: .red)
                CountryDetailRow(number: String(format: "%.2f", countryData.fatalityRate), name: "Death Rate %", color: .red)
                CountryDetailRow(number: countryData.recovered.formatNumber(), name: "Recovered", color: .yellow)
                CountryDetailRow(number: String(format: "%.2f", countryData.recoveredRate), name: "Recovered Rate %", color: .green)
                
                
            }//End of inner VStack
                .background(Color("cardBackgroundGray"))
                .cornerRadius(8)
                .padding()
            Spacer()
        }//End of outter VStack
            .padding(.top, 50)
            .navigationBarTitle(countryData.country)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(countryData: testCountryData)
    }
}

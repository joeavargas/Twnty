//
//  ListHeaderView.swift
//  Twnty
//
//  Created by Joe Vargas on 8/2/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import SwiftUI

struct ListHeaderView: View {
    
    var body: some View {
        
        HStack{
            Text("Country")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 100, alignment: .leading)
                .padding(.leading, 15)
            
            Spacer()
            Text("Confirmed")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            
            Spacer()
            Text("Deaths")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            
            Spacer()
            Text("Recovered")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.trailing, 15)
        }
        .background(Color("cardBackgroundGray"))
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}

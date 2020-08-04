//
//  ContentView.swift
//  Twnty
//
//  Created by Joe Vargas on 7/31/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
       
    var body: some View {
        TabView{
            //Recent tab item
            RecentView()
                .tabItem{
                    Tab(imageName: "chart.bar", text: "Recent")
            }.tag(0)
            
            //Map tab item
            MapContainerView()
                .edgesIgnoringSafeArea(.vertical)
                .tabItem{
                    Tab(imageName: "map", text: "Map")
            }.tag(1)
        }
    }
}

private struct Tab: View{
    let imageName: String
    let text: String
    
    var body: some View{
        VStack{
            Image(systemName: imageName)
            Text(text)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

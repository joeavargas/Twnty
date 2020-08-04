//
//  MapView.swift
//  Twnty
//
//  Created by Joe Vargas on 8/4/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit

struct MapView: UIViewRepresentable {
        
    @Binding var countryData: [CountryData]
    
    //Function that conforms and allows UIViews to be shown in SwiftUI
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        //Instantiate an empty array of annotations soon to be filled with the for-loop below
        var allAnnotations: [Covid19CaseAnnotations] = []
        
        //Loop through the array of CountryData, pull the Country name and Coordinates and append them to the allAnnotations array
        for data in countryData{
            
            let title = data.country + "\n Confirmed: " + data.confirmed.formatNumber() + "\n Deaths: " + data.deaths.formatNumber()
            
            let coordindate = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
            
            allAnnotations.append(Covid19CaseAnnotations(title: title, coordinate: coordindate))
        }
        //Clear out the allAnnotations array first
        uiView.annotations.forEach { uiView.removeAnnotation($0) }
        
        //Re-append all annotations collected
        uiView.addAnnotations(allAnnotations)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView()
    }
}

class Covid19CaseAnnotations: NSObject, MKAnnotation{
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

//
//  FetchRequest.swift
//  Twnty
//
//  Created by Joe Vargas on 8/1/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkRequest: ObservableObject{
    
    @Published var totalData: TotalData = testTotalData
    @Published var allCountries: [CountryData] = []
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        "x-rapidapi-key": "d172e810e7msh47584ae043c146dp12d8eejsnb0b3c42c4a59"
    ]
    
    init() {
        getCurrentTotal()
        getAllCountries()
    }
    
    
    
    func getCurrentTotal(){
        
        
        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=undefined", headers: headers).responseJSON { response in
            let result = response.data
            if result != nil{
                let json = JSON(result!)
                //                print("Fetched json", json)
                let confirmed = json[0]["confirmed"].int64
                let recovered = json[0]["recovered"].int64
                let deaths = json[0]["deaths"].int64
                let critical = json[0]["critical"].int64
                
                self.totalData = TotalData(confirmed: confirmed!, critical: critical!, deaths: deaths!, recovered: recovered!)
            } else {
                self.totalData = testTotalData
            }
        }
    }
    
    func getAllCountries(){
        AF.request("https://covid-19-data.p.rapidapi.com/country/all?format=undefined", headers: headers).responseJSON { response in
            
            let result = response.value
            var allCount: [CountryData] = []
            if result != nil{
                let dataDictionary = result as! [Dictionary<String, AnyObject>]
                for countryData in dataDictionary{
                    
                    let country = countryData["country"] as? String ?? "n/a"
                    let longitude = countryData["longitude"] as? Double ?? 404
                    let latitude = countryData["latitude"] as? Double ?? 404
                    let confirmed = countryData["confirmed"] as? Int64 ?? 404
                    let recovered = countryData["recovered"] as? Int64 ?? 404
                    let deaths = countryData["deaths"] as? Int64 ?? 404
                    let critical = countryData["critical"] as? Int64 ?? 404
                    
                    let countryObject = CountryData(country: country,
                                                   confirmed: confirmed,
                                                   critical: critical,
                                                   deaths: deaths,
                                                   recovered: recovered,
                                                   latitude: latitude,
                                                   longitude: longitude)
                    allCount.append(countryObject)
                }
            }
            //Sort results by Confirmed cases; highest value at the top
            self.allCountries = allCount.sorted(by: {$0.confirmed > $1.confirmed})
        }
    }
}

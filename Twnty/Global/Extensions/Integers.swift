//
//  Integers.swift
//  Twnty
//
//  Created by Joe Vargas on 8/2/20.
//  Copyright © 2020 Joe Vargas. All rights reserved.
//

import Foundation

extension Int{
    func formatNumber() -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))!
    }
}

extension Int64{
    func formatNumber() -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))!
    }
}

//
//  ContentView.swift
//  BadAtLengths
//
//  Created by Admin on 16/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var enteredValue = 0.0
    @State private var inputUnit = "m"
    @State private var outputUnit = "km"
    
    let units = ["m", "km", "ft", "yds", "miles"]
    
    var convertingToMeter: Double {
        switch inputUnit {
        case "m":
            return enteredValue
        case "km":
            return enteredValue * 1000
        case "ft":
            return enteredValue * 0.3048
        case "yds":
            return enteredValue * 0.9144
        case "miles":
            return enteredValue * 1609.34
        default:
            return enteredValue
        }
    }
    
    var convertedValue: Double {
        switch outputUnit {
        case "m":
            return convertingToMeter
        case "km":
            return convertingToMeter * 0.001
        case "ft":
            return convertingToMeter * 3.28
        case "yds":
            return convertingToMeter * 1.094
        case "miles":
            return convertingToMeter * 0.00062
        default:
            return convertingToMeter
        }
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

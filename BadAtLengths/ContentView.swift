//
//  ContentView.swift
//  BadAtLengths
//
//  Created by Saurabh Jamadagni on 16/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var enteredValue = 0.0
    @State private var inputUnit = "m"
    @State private var outputUnit = "km"
    @FocusState private var isEnteringValue: Bool
    
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
        NavigationView {
            Form {
                Section {
                    TextField("Enter value", value: $enteredValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isEnteringValue)
                    Picker("Select input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Picker("Select input unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .keyboardType(.decimalPad)
                } header: {
                    Text("Select Output unit")
                }
                
                Section {
                    Text("\(enteredValue.formatted(.number)) \(inputUnit) = \(convertedValue.formatted(.number)) \(outputUnit)")
                } header: {
                    Text("Conversion")
                }
            }
            .navigationTitle("Bad At Lengths!")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        isEnteringValue = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

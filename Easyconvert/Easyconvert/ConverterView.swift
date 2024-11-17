
import SwiftUI

struct ConverterView: View {
    var converterType: ConverterType
    @State private var inputValue: String = ""
    @State private var inputUnit: String = ""
    @State private var outputUnit: String = ""
    
    var body: some View {
        VStack {
            Picker("Input Unit", selection: $inputUnit) {
                ForEach(unitsForType(), id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            TextField("Enter value", text: $inputValue)
                .keyboardType(.decimalPad)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Picker("Output Unit", selection: $outputUnit) {
                ForEach(unitsForType(), id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if let result = convertValue() {
                Text("Converted Value: \(result)")
                    .font(.headline)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            // Set default units based on converter type
            inputUnit = unitsForType().first ?? ""
            outputUnit = unitsForType().last ?? ""
        }
    }
    
    private func unitsForType() -> [String] {
        switch converterType {
        case .temperature:
            return ["Celsius", "Fahrenheit", "Kelvin"]
        case .distance:
            return ["Meters", "Kilometers", "Miles", "Feet"]
        case .weight:
            return ["Kilograms", "Pounds", "Ounces", "Grams"]
        case .volume:
            return ["Liters", "Milliliters", "Gallons", "Cups"]
        case .speed:
            return ["km/h", "mph", "m/s"]
        }
    }
    
    private func convertValue() -> String? {
        guard let value = Double(inputValue) else { return nil }
        let converter = UnitConverter()
        
        switch converterType {
        case .temperature:
            return converter.convertTemperature(value, from: inputUnit, to: outputUnit)
        case .distance:
            return converter.convertDistance(value, from: inputUnit, to: outputUnit)
        case .weight:
            return converter.convertWeight(value, from: inputUnit, to: outputUnit)
        case .volume:
            return converter.convertVolume(value, from: inputUnit, to: outputUnit)
        case .speed:
            return converter.convertSpeed(value, from: inputUnit, to: outputUnit)
        }
    }
}

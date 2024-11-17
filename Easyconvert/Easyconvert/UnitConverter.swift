import Foundation

class UnitConverter {
    
    func convertTemperature(_ value: Double, from inputUnit: String, to outputUnit: String) -> String {
        var result: Double = value
        
        switch inputUnit {
        case "Fahrenheit":
            result = (value - 32) * 5/9
        case "Kelvin":
            result = value - 273.15
        default: break
        }
        
        switch outputUnit {
        case "Fahrenheit":
            result = (result * 9/5) + 32
        case "Kelvin":
            result = result + 273.15
        default: break
        }
        
        return String(format: "%.2f", result)
    }
    
    func convertDistance(_ value: Double, from inputUnit: String, to outputUnit: String) -> String {
        let meters = convertToMeters(value, from: inputUnit)
        let result = convertFromMeters(meters, to: outputUnit)
        return String(format: "%.2f", result)
    }
    
    private func convertToMeters(_ value: Double, from unit: String) -> Double {
        switch unit {
        case "Kilometers": return value * 1000
        case "Miles": return value * 1609.34
        case "Feet": return value * 0.3048
        default: return value // Meters
        }
    }
    
    private func convertFromMeters(_ value: Double, to unit: String) -> Double {
        switch unit {
        case "Kilometers": return value / 1000
        case "Miles": return value / 1609.34
        case "Feet": return value / 0.3048
        default: return value // Meters
        }
    }
    
    func convertWeight(_ value: Double, from inputUnit: String, to outputUnit: String) -> String {
        let kilograms = convertToKilograms(value, from: inputUnit)
        let result = convertFromKilograms(kilograms, to: outputUnit)
        return String(format: "%.2f", result)
    }
    
    private func convertToKilograms(_ value: Double, from unit: String) -> Double {
        switch unit {
        case "Pounds": return value * 0.453592
        case "Ounces": return value * 0.0283495
        case "Grams": return value / 1000
        default: return value // Kilograms
        }
    }
    
    private func convertFromKilograms(_ value: Double, to unit: String) -> Double {
        switch unit {
        case "Pounds": return value / 0.453592
        case "Ounces": return value / 0.0283495
        case "Grams": return value * 1000
        default: return value // Kilograms
        }
    }
    
    func convertVolume(_ value: Double, from inputUnit: String, to outputUnit: String) -> String {
        let liters = convertToLiters(value, from: inputUnit)
        let result = convertFromLiters(liters, to: outputUnit)
        return String(format: "%.2f", result)
    }
    
    private func convertToLiters(_ value: Double, from unit: String) -> Double {
        switch unit {
        case "Milliliters": return value / 1000
        case "Gallons": return value * 3.78541
        case "Cups": return value * 0.24
        default: return value // Liters
        }
    }
    
    private func convertFromLiters(_ value: Double, to unit: String) -> Double {
        switch unit {
        case "Milliliters": return value * 1000
        case "Gallons": return value / 3.78541
        case "Cups": return value / 0.24
        default: return value // Liters
        }
    }

    func convertSpeed(_ value: Double, from inputUnit: String, to outputUnit: String) -> String {
        let metersPerSecond = convertToMetersPerSecond(value, from: inputUnit)
        let result = convertFromMetersPerSecond(metersPerSecond, to: outputUnit)
        return String(format: "%.2f", result)
    }
    
    private func convertToMetersPerSecond(_ value: Double, from unit: String) -> Double {
        switch unit {
        case "km/h": return value / 3.6
        case "mph": return value * 0.44704
        default: return value // m/s
        }
    }
    
    private func convertFromMetersPerSecond(_ value: Double, to unit: String) -> Double {
        switch unit {
        case "km/h": return value * 3.6
        case "mph": return value / 0.44704
        default: return value // m/s
        }
    }
}

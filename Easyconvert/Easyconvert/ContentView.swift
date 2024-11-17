import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ConverterView(converterType: .temperature)) {
                    Text("Temperature Converter")
                }
                NavigationLink(destination: ConverterView(converterType: .distance)) {
                    Text("Distance Converter")
                }
                NavigationLink(destination: ConverterView(converterType: .weight)) {
                    Text("Weight Converter")
                }
                NavigationLink(destination: ConverterView(converterType: .volume)) {
                    Text("Volume Converter")
                }
                NavigationLink(destination: ConverterView(converterType: .speed)) {
                    Text("Speed Converter")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

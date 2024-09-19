//
//  FeelsLikeView.swift
//  WeatherBuddy
//
//  Created by Peter Berning on 9/14/24.
//

import SwiftUI
import WeatherKit

struct FeelsLikeView: View {
    let weatherManager = WeatherManager.shared
    let currentWeather: CurrentWeather
    
    var body: some View {
        HStack {
            let temp = weatherManager.measurementFormatter.string(from: currentWeather.apparentTemperature)
            Text("Feels Like")
                .font(.title2)
            Spacer()
            Text(temp)
                .font(.system(size: 50, weight: .light, design: .rounded))
            Spacer()
            if currentWeather.apparentTemperature.value > (currentWeather.temperature.value + 1) {
                Text("Warmer than actual")
                    .font(.title3)
                    .multilineTextAlignment(.center)
            } else if currentWeather.apparentTemperature.value < (currentWeather.temperature.value - 1) {
                Text("Cooler than actual")
                    .font(.title3)
                    .multilineTextAlignment(.center)
            } else {
                Text("About the same as actual")
                    .font(.title3)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.2)))
    }
}
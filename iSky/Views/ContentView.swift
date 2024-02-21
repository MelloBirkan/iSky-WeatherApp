//
//  ContentView.swift
//  iSky
//
//  Created by Marcello Gonzatto Birkan on 21/02/24.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  @StateObject var locationManager = LocationManager()
  var weatherManager = WeatherManager()
  @State var weather: ResponseBody?
  
  var body: some View {
    VStack {
      if let location = locationManager.location {
        if let weather = weather {
          Text("Weather data fetched!")
        } else {
          LoadingView()
            .task {
              do {
                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
              } catch {
                print("Error getting weather: \(error)")
              }
            }
        }
      } else {
        if locationManager.isLoading {
          LoadingView()
        } else {
          WelcomeView()
            .environmentObject(locationManager)
        }
      }
    }
    .background(colorScheme == .dark ? Image(.nightsky) : Image(.blueSky))
//    .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
  }
}

#Preview {
  ContentView()
}

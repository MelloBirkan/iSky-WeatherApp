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
  
  var body: some View {
    VStack {
      if let location = locationManager.location {
        Text("Your coordinates are: \(location.longitude), \(location.latitude)")
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

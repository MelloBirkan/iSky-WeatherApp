//
//  WelcomeView.swift
//  iSky
//
//  Created by Marcello Gonzatto Birkan on 21/02/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
  @EnvironmentObject var locationManager: LocationManager
  
  var body: some View {
//    ZStack {
//      Image(.blueSky)
      VStack {
        VStack(spacing: 20) {
          Text("Welcome to iSky!")
            .bold()
            .font(.title)
          
          Text("Please share your current location to get weather in your area")
            .padding()
            .frame(width: 300)
        }
        .multilineTextAlignment(.center)
        .padding()
        
        LocationButton(.shareCurrentLocation) {
          locationManager.requestLocation()
        }
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .symbolVariant(.fill)
        .foregroundStyle(.white)
        .shadow(radius: 20)
      }
      .padding()
      .background(.ultraThinMaterial)
      .clipShape(RoundedRectangle(cornerRadius: 20))
//    }
  }
}

#Preview {
  WelcomeView()
}

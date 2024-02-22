//
//  WeatherRow.swift
//  iSky
//
//  Created by Marcello Gonzatto Birkan on 22/02/24.
//

import SwiftUI

struct WeatherRow: View {
  var logo: String
  var name: String
  var value: String
  
  var body: some View {
    HStack(spacing: 20) {
      Image(systemName: logo)
        .font(.title2)
        .frame(width: 20, height: 20)
        .padding()
        .background(Color.secondary)
        .cornerRadius(50)
      
      VStack(alignment: .leading, spacing: 8) {
        Text(name)
          .font(.caption)
        
        Text(value)
          .bold()
          .font(.title)
      }
    }
  }
}


#Preview {
  WeatherRow(logo: "thermometer", name: "Feels like", value: "8°")
}

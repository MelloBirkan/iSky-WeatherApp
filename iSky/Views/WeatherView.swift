//
//  WeatherView.swift
//  iSky
//
//  Created by Marcello Gonzatto Birkan on 21/02/24.
//

import SwiftUI

struct WeatherView: View {
  var weather: ResponseBody
  
  var body: some View {
    ZStack(alignment: .leading) {
      VStack {
        VStack(alignment: .leading, spacing: 5) {
          Text(weather.name)
            .bold()
            .font(.title)
          
          Text("Today, \(Date().formatted(.dateTime.day().month().year().hour().minute()))")
            .fontWeight(.light)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        Spacer()
        
        VStack {
          HStack {
            VStack(spacing: 20) {
              Image(systemName: "sun.max")
                .font(.system(size: 40))
              
              Text(weather.weather[0].main)
            }
            .frame(width: 150, alignment: .leading)
            
            Spacer()
            
            Text(weather.main.feelsLike.roundDouble())
              .font(.system(size: 100))
              .bold()
              .padding()
          }
          
          Spacer()
            .frame(height: 80)
          
          Image(.city)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 350)
            .clipShape(RoundedRectangle(cornerRadius: 30))
          
          Spacer()
        }
        .frame(maxWidth: .infinity)
      }
      .padding()
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      
      VStack {
        Spacer()
        
        VStack(alignment: .leading, spacing: 20) {
          Text("Weather now")
            .bold()
            .padding(.bottom)
          
          HStack {
            WeatherRow(logo: "thermometer", name: "Min Temp", value: (weather.main.tempMin.roundDouble()))
            
            Spacer()
            
            WeatherRow(logo: "thermometer", name: "Max Temp", value: (weather.main.tempMax.roundDouble()))

          }
          
          HStack {
            WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s"))
            
            Spacer()
            
            WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))

          }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .padding(.bottom, 20)
        .foregroundStyle(Color.primary)
        .background(.thickMaterial)
        .cornerRadius(20, corners: [.topLeft, .topRight])
      }
    }
    .ignoresSafeArea(edges: .bottom)
    .background(Color.background)
  }
}


#Preview {
  WeatherView(weather: previewWeather)
}

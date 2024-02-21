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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}

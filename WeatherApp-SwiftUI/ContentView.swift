//
//  ContentView.swift
//  WeatherApp-SwiftUI
//
//  Created by Natcha Taotong on 23/10/2565 BE.
//

import SwiftUI



struct ContentView: View {
    let list =
    [
        [
            "days" : "Tue",
            "weather" : "cloud.sun.fill",
        ],
        [
            "days" : "Wed",
            "weather" : "cloud.sun.fill",
        ]
    ]
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            VStack {
                CityTextView(cityName: "Chiang Mai")
                CurrentWeatherView(currentWeather: "cloud.sun.fill", currentTemperature: 25)
                HStack(spacing:20) {
                    Spacer()
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.fill",
                        temperature: 29
                    )
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "cloud.drizzle.fill",
                        temperature: 23
                    )
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "cloud.sun.fill",
                        temperature: 29
                    )
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "cloud.fill",
                        temperature: 27
                    )
                    WeatherDayView(
                        dayOfWeek: "SAT",
                        imageName: "cloud.rain.fill",
                        temperature: 22
                    )
                    Spacer()
                    }
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    Text("Change Day Time")
                        .font(.system(size: 16, weight: .heavy))
                        .frame(width:280, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 60)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
//            .padding(.horizontal, 20)
            Text(dayOfWeek)
                .font(.system(size:16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding(.vertical, 10)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height:40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size:32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentWeatherView: View {
    var currentWeather: String
    var currentTemperature: Int
    var body: some View {
        VStack {
            Image(systemName: currentWeather)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(currentTemperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        //                Spacer()
        .padding(.bottom, 40)
    }
}

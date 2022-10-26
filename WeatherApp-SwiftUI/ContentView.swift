//
//  ContentView.swift
//  WeatherApp-SwiftUI
//
//  Created by Natcha Taotong on 23/10/2565 BE.
//

import SwiftUI



struct ContentView: View {
    
    @State private var isNight = false
    
    let list =
    [
        weatherOfEachDay(dayOfWeek: "TUE", weather: "cloud.sun.fill", temperature: 29),
        weatherOfEachDay(dayOfWeek: "WED", weather: "cloud.sun.fill", temperature: 27),
        weatherOfEachDay(dayOfWeek: "THU", weather: "cloud.drizzle.fill", temperature: 22),
        weatherOfEachDay(dayOfWeek: "FRI", weather: "cloud.fill", temperature: 25),
        weatherOfEachDay(dayOfWeek: "SAT", weather: "sun.max.fill", temperature: 32)
    ]
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Chiang Mai")
                CurrentWeatherView(currentWeather: isNight ? "moon.fill" : "cloud.sun.fill", currentTemperature: 25)
                HStack(spacing:20) {
                    Spacer()
                    ForEach(list, id: \.id) { data in
                        WeatherDayView(dayOfWeek: data.dayOfWeek, imageName: data.weather, temperature: data.temperature)
                    }
                    Spacer()
                    }
                Spacer()
                
                Button {
                    isNight.toggle()
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

struct weatherOfEachDay {
    let id = UUID()
    let dayOfWeek : String
    let weather : String
    let temperature: Int
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
    
    @Binding var isNight: Bool
    
//    var topColor: Color
//    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
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


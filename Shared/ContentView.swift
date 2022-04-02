//
//  ContentView.swift
//  Shared
//
//  Created by Ankit Raj on 02/04/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            backgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray: Color("lightBlue"))
            VStack(spacing: 10) {
                cityNameView(cityName: "New Delhi, IN")
                
                mainWeatherView(imageName: isNight ? "cloud.moon.fill" :"cloud.sun.fill",
                                    temperature: 34)
                .padding(.bottom, 40)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "Tues",
                                   imageName: "sun.max.fill",
                                   temperature: 43)
                    
                   WeatherDayView(dayOfWeek: "Wed",
                                  imageName: "smoke.fill",
                                  temperature: 28)
                    
                    WeatherDayView(dayOfWeek: "Thur",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 32)
                    
                    WeatherDayView(dayOfWeek: "Fri",
                                   imageName: "wind.snow",
                                   temperature: 20)
                    
                    WeatherDayView(dayOfWeek: "Sat",
                                   imageName: "snowflake",
                                   temperature: 5)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    buttonView(buttonText: "Change Day",
                               backgroundColor: .white,
                               textColor: .blue,
                               buttonCornerRadius: 10)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct backgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct WeatherDayView: View {
    var dayOfWeek = String().self
    var imageName = String().self
    var temperature = Int().self
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct cityNameView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.bottom)
    }
}

struct mainWeatherView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 32, weight: .medium, design: .default))
        }
    }
}

struct buttonView: View {
    var buttonText: String
    var backgroundColor: Color
    var textColor: Color
    var buttonCornerRadius: Int
    var body: some View {
        Text(buttonText)
            .frame(width: 280, height: 50)
            .font(.system(size: 20, weight: .medium, design: .default))
            .foregroundColor(textColor)
            .background(backgroundColor)
            .cornerRadius(CGFloat(buttonCornerRadius))
    }
}

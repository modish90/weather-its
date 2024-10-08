import SwiftUI


struct WeatherInfo: View {
    @State var weather: Weather
    @State private var isNight = false
    
    init(weather: Weather, isNight: Bool = false) {
        self.weather = weather
        self.isNight = isNight

    }
    
    var body: some View {
        VStack {
            CityTextView(weather: weather)
            WeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", weather: weather)
        }
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
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
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var weather: Weather
    var body: some View {
        Text(weather.name ?? "")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
        Text(weather.date?.toDate()?.convertToDateAndMonthFormat() ?? "")
            .font(.system(size: 16, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}

struct WeatherStatusView: View {
    var imageName: String
    var weather: Weather
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("\(weather.temperature ?? 0)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            Text("\(weather.condition?.text ?? "")°")
                .font(.system(size: 10, weight: .semibold))
                .foregroundColor(.white)
            Text("Feels like \(weather.feelsLike ?? 0)°")
                .font(.system(size: 10, weight: .semibold))
                .foregroundColor(.white)
            HStack {
                Text("Sun Rise \(weather.forecasts?[0].sunrise ?? "")°")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.white)
                
                Text("Sun Set \(weather.forecasts?[0].sunset ?? "")°")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.white)
            }
            
            HStack {
                Text("Wind Speed \(weather.wind ?? 0)° km/h")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.white)
                
                Text("UV \(weather.uv ?? 0) index")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.white)
                
                Text("Humidity \(weather.humidity ?? 0)° percentage %")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.white)
            
            }
            
            Spacer()

        }
    }
}



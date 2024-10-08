import SwiftUI
import Kingfisher


struct ForecastWeather: View {
    @State var forecast: [DomainForecast]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Forcast's Weather")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(forecast, id: \.id) { forecast in
                        WeatherCard(forcast: forecast) // Passing the WeatherDay object
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}


struct WeatherCard: View {
    let forcast: DomainForecast // Receive the WeatherDay object

    var body: some View {
        VStack(spacing: 8) {
            let day = forcast.date?.toDate()?.convertToFormat()
            Text((day ?? "")) // Access data from the object
                .font(.headline)
                .foregroundColor(.gray)
            let url = "\("https:")\(forcast.icon!)"
            let _ = print(url)
            KFImage(URL(string: url))
                .resizable()
                .frame(width: 40, height: 40)
            Text("Max \(forcast.maxTemp ?? "")") // Access the temperature from the object
                .font(.subheadline)
                .bold()
            Text("Min \(forcast.minTemp ?? "")") // Access the temperature from the object
                .font(.subheadline)
                .bold()
        }
        .frame(width: 80, height: 150)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}


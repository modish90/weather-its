
import SwiftUI
import Kingfisher


struct HourlyWeather: View {
    @State var hours: [Hour]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Today's Weather")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(hours, id: \.id) { hour in
                        HourlyWeatherCard(hour: hour) // Passing the WeatherDay object
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}


struct HourlyWeatherCard: View {
    let hour: Hour

    var body: some View {
        VStack(spacing: 8) {
            let time = hour.time ?? ""
            let start = String.Index(utf16Offset: 11, in: time)
            let end = String.Index(utf16Offset: 13, in: time)
            Text((time[start..<end]))
                .font(.headline)
                .foregroundColor(.gray)
            let url = "\("https:")\(hour.icon!)"
            KFImage(URL(string: url))
                .resizable()
                .frame(width: 40, height: 40)
            Text("\(hour.temperature ?? "")") // Access the temperature from the object
                .font(.subheadline)
                .bold()
        }
        .frame(width: 80, height: 150)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}


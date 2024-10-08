import SwiftUI
import Combine

struct WeatherView: PatternView {
    @StateObject var viewModel: ViewModel
    @State private var isNight = false
    
    init(viewModel: ViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
                VStack {
                    SearchBar(text: $viewModel.citySearchText,
                              placeHolder: "Search your city")
                    Divider()
                    LoadingView(isShowing: $viewModel.isLoading, text: .constant("")) {
                        VStack {
                            if let _ = viewModel.dailyWeather.temperature {
                                WeatherInfo(weather: viewModel.dailyWeather)
                            }
                            
                            if let hours = viewModel.dailyWeather.forecasts?[0].hour  {
                                HourlyWeather(hours: hours)
                            }
                            
                            if let forecasts = viewModel.dailyWeather.forecasts {
                                    ForecastWeather(forecast: forecasts)
                                }
                            }
                        }.alert(isPresented: $viewModel.alert.isShowing) {
                            Alert(
                                title: Text(viewModel.alert.title),
                                message: Text(viewModel.alert.message),
                                dismissButton: .default(Text("Close"))
                            )
                        }
                }
            }
        }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: .init(diContainer: .defaultValue))
    }
}

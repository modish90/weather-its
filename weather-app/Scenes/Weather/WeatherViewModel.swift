import Foundation
import Combine

extension WeatherView {
    
    final class ViewModel: ObservableObject {
        private var cancellable = Set<AnyCancellable>()
        private let activityTracker = ActivityTracker(false)
        private var errorTracker = ErrorTracker()
        private var usecase: GetWeatherForecastUseCase
        
        // INPUT
        @Published var citySearchText: String = ""
        
        // OUTPUT
        @Published private(set) var dailyWeather: Weather = Weather()
        @Published var isLoading: Bool = false
        @Published var isValidSearch: Bool = true
        @Published var alert = AlertMessage()
        
        init(usecase: GetWeatherForecastUseCase) {
            self.usecase = usecase
            $citySearchText
                .dropFirst(1)
                .filter { $0.count > 2 }
                .sink(receiveValue: loadWeather(cityName:))
                .store(in: &cancellable)
            
            $citySearchText
                .dropFirst(1)
                .filter { $0.count <= 2 && $0.count > 0 }
                .map { _ in AlertMessage(title: "Error", message: "Search text length should be greater than 2", isShowing: true) }
                .assign(to: \.alert, on: self)
                .store(in: &cancellable)
            
            $citySearchText
                .dropFirst(1)
                .filter { $0.count <= 2 }
                .sink { _ in
                    self.dailyWeather = Weather()
                }
                .store(in: &cancellable)
            
            activityTracker
                .receive(on: DispatchQueue.main)
                .assign(to: \.isLoading, on: self)
                .store(in: &cancellable)
            
            errorTracker
                .receive(on: DispatchQueue.main)
                .compactMap { AlertMessage(error: ($0 as? ApiError)) }
                .assign(to: \.alert, on: self)
                .store(in: &cancellable)
            
            loadWeather(cityName: "London")
            
        }
        
        private func loadWeather(cityName: String) {
            dailyWeather = Weather()
            self.usecase.getWeatherDetails(cityName: cityName, unit: "metric", numberOfDays: 5)
                .trackActivity(activityTracker)
                .trackError(errorTracker)
                .replaceError(with: Weather())
                .eraseToAnyPublisher()
                .receive(on: DispatchQueue.main)
                .assign(to: \.dailyWeather, on: self)
                .store(in: &cancellable)
            
        }
    }
}



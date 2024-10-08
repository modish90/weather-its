import Foundation
import Combine

class ApiWeatherRepository: WeatherForecastRepository {
   
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getWeatherDetails(cityName: String, unit: String, numberOfDays: Int) -> AnyPublisher<Weather, ApiError> {
        let weatherApiRequest = WeatherDailyRequest(days: numberOfDays,
                                                    cityName: cityName,
                                                    unit: unit)
        
        return apiClient.execute(request: weatherApiRequest,
                                 returnType: WeatherAPIResponse.self)
        .map {
            $0.toWeather()
        }.eraseToAnyPublisher()
    }
    
}

import Foundation
import Combine

protocol GetWeatherForecastUseCase {
    func getWeatherDetails(cityName: String,
                          unit: String,
                           numberOfDays: Int) -> AnyPublisher<Weather, ApiError>
}

class GetWeatherForecastUseCaseImpl: GetWeatherForecastUseCase {
    
    let weatherForecastRepository: WeatherForecastRepository
    
    init(weatherForecastRepository: WeatherForecastRepository) {
        self.weatherForecastRepository = weatherForecastRepository
    }
    
    func getWeatherDetails(cityName: String, unit: String, numberOfDays: Int) -> AnyPublisher<Weather, ApiError> {
        return self.weatherForecastRepository.getWeatherDetails(cityName: cityName, unit: unit, numberOfDays: numberOfDays)
            .eraseToAnyPublisher()
    }
    
}

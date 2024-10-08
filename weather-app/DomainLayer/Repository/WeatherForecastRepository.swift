import Foundation
import Combine

protocol WeatherForecastRepository {
    func getWeatherDetails(cityName: String, unit: String, numberOfDays: Int) -> AnyPublisher<Weather, ApiError>
}

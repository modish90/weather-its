import Foundation

final class Gateways {
    lazy var apiWeatherGateway: WeatherForecastRepository = {
        let apiClient = ApiClientImpl(urlSessionConfiguration: .default)
        return ApiWeatherRepository(apiClient: apiClient)
    }()
}

import Foundation


extension WeatherView.ViewModel {
    convenience init(diContainer: DIContainer) {
        self.init(usecase: diContainer.getWeatherForecastUseCase)
    }
}

private extension DIContainer {
    var getWeatherForecastUseCase: GetWeatherForecastUseCase {
        return GetWeatherForecastUseCaseImpl(weatherForecastRepository: gateways.apiWeatherGateway)
    }
}

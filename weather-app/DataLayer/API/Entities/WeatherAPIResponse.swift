import Foundation

struct WeatherAPIResponse: Decodable {
    var current: Current?
    var forecast: DataForecast?
    var location: Location?
}

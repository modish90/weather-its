import Foundation

struct Weather {
    var temperature: Int?
    var date: String?
    var wind: Int?
    var humidity: Int?
    var feelsLike: Int?
    var condition: Condition?
    var uv: Int?
    var name: String?
    var forecasts: [DomainForecast]?
}

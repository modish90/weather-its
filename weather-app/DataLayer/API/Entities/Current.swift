import Foundation

struct Current: Decodable {
    var cloud: Int?
    var condition: DataCondition?
    var feelslike_c: Double?
    var humidity: Int?
    var temp_c: Double?
    var uv: Int?
    var wind_kph: Double?
}

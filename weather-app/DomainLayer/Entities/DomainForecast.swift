import Foundation

struct DomainForecast : Identifiable {
    var id =  UUID()
    var date: String?
    var maxTemp: String?
    var minTemp: String?
    var sunrise: String?
    var sunset: String?
    var icon: String?
    var hour: [Hour]?
}

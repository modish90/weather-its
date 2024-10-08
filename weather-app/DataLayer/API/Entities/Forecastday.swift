import Foundation

struct Forecastday: Decodable{
    var astro: Astro?
    var date: String?
    var day: Day?
    var hour: [NetworkHour]?
}


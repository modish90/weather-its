import Foundation

struct Day: Decodable {
    var condition: DataCondition?
    var maxtemp_c: Double?
    var mintemp_c: Double?
}


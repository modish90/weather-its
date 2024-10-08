import Foundation

struct NetworkHour: Decodable {
    var condition: DataCondition?
    var temp_c: Double?
    var time: String?
}

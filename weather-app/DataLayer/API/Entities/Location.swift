import Foundation

struct Location: Decodable{
    var country: String?
    var lat: Double?
    var localtime: String?
    var localtime_epoch: Int?
    var name: String?
    var region: String?
    var tz_id: String?
}

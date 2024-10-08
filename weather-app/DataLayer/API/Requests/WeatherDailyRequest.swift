import Foundation

struct WeatherDailyRequest: ApiRequest {
    let days: Int
    let cityName: String
    let unit: String
    
    var urlRequest: URLRequest {
        let queryCityName = cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let url: URL! = URL(string: "\(AppConstants.apiBaseURL)/v1/forecast.json?" +
                                "q=\(queryCityName)&" +
                                "days=\(days)&" +
                                "key=\(AppConstants.apiKey)")
            
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        return request
    }
}

import Foundation

extension WeatherAPIResponse {
    func toWeather() -> Weather {
        var weather: Weather = Weather()
        weather.name = location?.name
        weather.humidity = current?.humidity
        weather.date = forecast?.forecastday?[0].date
        weather.feelsLike = current?.feelslike_c?.toInt()
        weather.temperature = current?.temp_c?.toInt()
        weather.wind = current?.wind_kph?.toInt()
        weather.condition = Condition(icon: current?.condition?.icon,text: current?.condition?.text)
        weather.uv = current?.uv
        weather.forecasts = forecast?.forecastday?.map { $0.toWeatherForecast()
        }
        return weather
    }
}
    
extension NetworkHour {
    func toHour() -> Hour {
        var hour: Hour = Hour()
        hour.time = time
        hour.icon = condition?.icon
        hour.temperature = temp_c?.toInt()?.toString()
        return hour
    }
}

extension Forecastday {
    func toWeatherForecast() -> DomainForecast {
        var forecast: DomainForecast = DomainForecast()
        forecast.date = date
        forecast.maxTemp = day?.maxtemp_c?.toInt()?.toString()
        forecast.minTemp = day?.mintemp_c?.toInt()?.toString()
        forecast.sunrise = astro?.sunrise
        forecast.sunset = astro?.sunset
        forecast.icon = day?.condition?.icon
        forecast.hour = hour?.map {
            $0.toHour()
        }
        return forecast
   }
}

extension Double {
    func toInt() -> Int? {
        let roundedValue = rounded(.toNearestOrEven)
        return Int(exactly: roundedValue)
    }
}

extension Int{
    func toString() -> String {
        var myString = String(self)
        return myString
    }
}


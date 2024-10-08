import Foundation

extension Date {
    func convertToFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self)
    }
    
    func convertToDateAndMonthFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "MMM dd"
        return dateFormatter.string(from: self)
    }
}

extension String {
  func toDate() -> Date?{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY/MM/dd"
    let date = dateFormatter.date(from: self)
    return date
   }
}

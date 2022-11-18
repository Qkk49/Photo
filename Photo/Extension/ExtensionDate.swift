import Foundation

//MARK: - Extension DateFormatter
extension Date {
    
    static func formatDate(from datString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dataDate = formatter.date(from: datString)
        
        formatter.dateFormat = "MM/dd/yyyy"
        let newStringDate = formatter.string(from: dataDate!)
        return newStringDate
    }
}

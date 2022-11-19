import UIKit

//MARK: - Extension DateFormatter
extension PhotoDetailInteractor {
    
    static func formatDate(from datString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let dataDate = formatter.date(from: datString) else { return datString }
        
        formatter.dateFormat = "MM.dd.yyyy"
        let newStringDate = formatter.string(from: dataDate)
        return newStringDate
    }
}

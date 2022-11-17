import Foundation

enum Section {
    case photoList
    
    private var urlComponents: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        
        switch self {
        case .photoList:
            components.path = "/photos/random"
            components.queryItems = [URLQueryItem(name: "count", value: String(30)),
                                     URLQueryItem(name: "orientation", value: "portrait")]
        }
        return components.url!
    }
    
    var URLrequest: URLRequest {
        var request = URLRequest(url: urlComponents)
        request.httpMethod = "GET"
        var header = [String: String]()
        header["Authorization"] = "Client-ID AdCbt-3vo6u4gHGWmJ2QjQ_vaAPx0NDjNJiEOH_oTkU"
        request.allHTTPHeaderFields = header
        return request
    }
}

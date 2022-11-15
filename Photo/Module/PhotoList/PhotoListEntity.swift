import Foundation

struct RandomPhoto: Decodable {
    var created_at: String
    var urls: PhotoURL
    var user : UserName?
}

struct PhotoURL: Decodable {
    var small: String?
}

struct UserName: Decodable {
    var name: String?
}

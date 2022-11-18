import Foundation

struct RandomPhoto: Decodable {
    let created_at: String
    let urls: PhotoURL
    let user : UserName?
}

struct PhotoURL: Decodable {
    let small: String
}

struct UserName: Decodable {
    let name: String?
}

struct PhotoComplete: Decodable {
    let date: String
    let url: String
    let name: String?
}

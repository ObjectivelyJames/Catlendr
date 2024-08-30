import Foundation

struct Animal: Codable {
    let id: String
    let imageUrl: String
    let width: Int
    let height: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "url"
        case width
        case height
    }
}

import Foundation

protocol Request {
    var url: URL? { get }
}

struct APIConstants {
    static let dogAPIBaseURL = "https://api.thedogapi.com/v1/images/search"
    static let catAPIBaseURL = "https://api.thecatapi.com/v1/images/search"
    static let imageQueryParameters = "?size=med&mime_types=png&limit="
}

enum AnimalAPIRequest: Request  {
    case dog(amount: Int = 1)
    case cat(amount: Int = 1)
    
    var url: URL? {
        switch self {
        case .dog(let amount):
            return URL(string: "\(APIConstants.dogAPIBaseURL)\(APIConstants.imageQueryParameters)\(amount)")
        case .cat(let amount):
            return URL(string: "\(APIConstants.catAPIBaseURL)\(APIConstants.imageQueryParameters)\(amount)")
        }
    }
}

class AnimalAPI {
    static var catAPIKey: String {
        Bundle.main.object(forInfoDictionaryKey: "CatAPIKey") as? String ?? ""
    }
    
    func getAnimals(request: Request = AnimalAPIRequest.cat()) async throws -> [Animal] {
        guard let url = request.url else {
            throw URLError(.badURL)
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue(AnimalAPI.catAPIKey, forHTTPHeaderField: "x-api-key")
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let animals = try JSONDecoder().decode([Animal].self, from: data)
        return animals
    }
}

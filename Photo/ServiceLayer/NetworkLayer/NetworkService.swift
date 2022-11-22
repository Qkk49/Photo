import Foundation

//MARK: - Protocol
protocol NetworkServiceProtocol {
    func fetchPhotoLists(complition: @escaping (Result<[RandomPhoto]?, Error>) -> Void)
    func getSearchPhotos(query: String, complitions: @escaping (Result<SearchPhoto?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    //MARK: - Get Random Photos
    func fetchPhotoLists(complition: @escaping (Result<[RandomPhoto]?, Error>) -> Void) {
        URLSession.shared.dataTask(with: Section.photoList.URLrequest) {data, _, error in
            if let error = error {
                complition(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([RandomPhoto].self, from: data!)
                complition(.success(obj))
            } catch {
                complition(.failure(error))
            }
        } .resume()
    }
    
    //MARK: - Get Search Photos
    func getSearchPhotos(query: String, complitions: @escaping (Result<SearchPhoto?, Error>) -> Void) {
        URLSession.shared.dataTask(with: Section.search(query: query).URLrequest) { data, response, error in
            if let error = error {
                complitions(.failure(error))
                print(error)
                return
            }
            do {
                let obj = try JSONDecoder().decode(SearchPhoto.self, from: data!)
                complitions(.success(obj))
            } catch {
                complitions(.failure(error))
                print(error)

            }
        }.resume()
    }
}

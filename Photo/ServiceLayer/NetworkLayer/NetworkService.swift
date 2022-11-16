import Foundation

protocol NetworkServiceProtocol {
    func fetchPhotoList(complition: @escaping (Result<[RandomPhoto]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func fetchPhotoList(complition: @escaping (Result<[RandomPhoto]?, Error>) -> Void) {
        URLSession.shared.dataTask(with: Section.photoList.URLrequest) {data, _, error in
            if let error = error {
                complition(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([RandomPhoto].self, from: data!)
                print("jdjdj")
                complition(.success(obj))
            } catch {
                complition(.failure(error))
                print("fail")
            }
        } .resume()
    }
}

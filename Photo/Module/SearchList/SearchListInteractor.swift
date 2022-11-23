import Foundation

//MARK: - Protocol
protocol InteractorSearchListProtocol: AnyObject {
    func getSearchPhoto(query: String)
}

final class SearchListInteractor: InteractorSearchListProtocol {
    
    weak var presenter: PresenterSearchListProtocol?
    let networkService = NetworkService()

    //MARK: - Get Photos from Network
    func getSearchPhoto(query: String) {
        networkService.getSearchPhotos(query: query) { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let photosResult):
                    self.presenter?.fetchSearchListSucces(searchList: photosResult!.results)
                case .failure(let error):
                    self.presenter?.fetchSearchListFailure(with: error)
                }
            }
        }
    }
}

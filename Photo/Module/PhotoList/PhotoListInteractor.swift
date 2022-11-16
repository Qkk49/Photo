import Foundation

final class PhotoListInteractor: InteractorPhotoListProtocol {
    
    let networkService = NetworkService()
    weak var presenter: PresenterPhotoListProtocol?
    var photos: [RandomPhoto]?
//
//    init(networkService: NetworkServiceProtocol, presenter: PresenterPhotoListProtocol) {
//        self.networkService = networkService
//        self.presenter = presenter
//        fetchPhotoList()
//    }
    required init() {
        fetchPhotoList()
    }
    func fetchPhotoList() {
        networkService.fetchPhotoList { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let photos):
                    print("Da")
                    self.photos = photos
                    self.presenter?.fetchPhotoListSucces()
                    print(photos!)
                case .failure(let error):
                    self.presenter?.fetchPhotoListFailure()
                    print(error)
                }
            }
        }
    }
}

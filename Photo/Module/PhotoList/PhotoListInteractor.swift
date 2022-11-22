import Foundation

//MARK: - Protocol
protocol InteractorPhotoListProtocol: AnyObject {
    func fetchPhotoList()
}

final class PhotoListInteractor: InteractorPhotoListProtocol {
    
    let networkService = NetworkService()
    weak var presenter: PresenterPhotoListProtocol?
    
    func fetchPhotoList() {
        networkService.fetchPhotoLists { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let photos):
                    self.presenter?.fetchPhotoListSucces(photoList: photos!)
                case .failure(let error):
                    self.presenter?.fetchPhotoListFailure(with: error)
                }
            }
        }
    }
}

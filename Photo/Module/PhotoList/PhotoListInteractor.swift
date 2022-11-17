import Foundation

protocol InteractorPhotoListProtocol: AnyObject {
//    var photos: [RandomPhoto]? { get set }
    func fetchPhotoList()
//    func getPhotoDetailAt(index: Int)
}

final class PhotoListInteractor: InteractorPhotoListProtocol {
    
    let networkService = NetworkService()
    weak var presenter: PresenterPhotoListProtocol?
//    var photos: [RandomPhoto]? //----<---------
    
//    required init() {
//        fetchPhotoList()
//    }
    
    func fetchPhotoList() {
        networkService.fetchPhotoLists { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let photos):
                    print("Da")
                    self.presenter?.fetchPhotoListSucces(photoList: photos!)
//                    self.presenter?.fetchPhotoListSucces() //------<----------
//                    self.photos = photos //----<-----------
//                    print(photos!)
                case .failure(let error):
//                    self.presenter?.fetchPhotoListFailure()
                    print(error)
                }
            }
        }
    }
}

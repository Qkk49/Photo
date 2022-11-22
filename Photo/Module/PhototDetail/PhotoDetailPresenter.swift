import UIKit

//MARK: - Protocol
protocol PresenterPhotoDetailProtocol: AnyObject {
    func getPhotoComplete() -> DataPhotoDetail
    func savedFavorite()
    func deletedFavorite()
    func viewDidLoad()
}

final class PhotoDetailPresenter {
    
    weak var view: ViewPhotoDetailProtocol?
    var router: RouterPhotoDetailProtocol?
    var interactor: InteractorPhotoDetailProtocol?
    
    private let moduleTitle = "Photo"
}

extension PhotoDetailPresenter: PresenterPhotoDetailProtocol {
    
    func getPhotoComplete() -> DataPhotoDetail {
        return interactor!.dataDetail
    }
    
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: moduleTitle)
    }
    
    func savedFavorite() {
        interactor?.saveFavorite()
    }
    
    func deletedFavorite() {
        interactor?.deleteFavorite()
    }
}

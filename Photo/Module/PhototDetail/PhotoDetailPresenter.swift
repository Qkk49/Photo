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
    
    //MARK: - Get Model
    func getPhotoComplete() -> DataPhotoDetail {
        guard let result = interactor?.dataDetail else {
            return DataPhotoDetail(date: "", url: "", name: "", but: false)
        }
        return result
    }
    
    //MARK: - ViewDidLoad
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: moduleTitle)
    }
    
    //MARK: - CoreData Save/Delete
    func savedFavorite() {
        interactor?.saveFavorite()
    }
    
    func deletedFavorite() {
        interactor?.deleteFavorite()
    }
}

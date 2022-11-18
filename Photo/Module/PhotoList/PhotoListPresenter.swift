import UIKit

//MARK: - CollectionModel
typealias PhotoViewModel = (data: String, url: String, name: String?)

//MARK: - Protocol
protocol PresenterPhotoListProtocol: AnyObject {
    func viewDidLoad()
    func getPhotoViewModels() -> [PhotoViewModel]?
    func photoSelected()
    func fetchPhotoListSucces(photoList: [RandomPhoto])
    func fetchPhotoListFailure(with errorMessage: Error)
}

final class PhotoListPresenter {
    
    weak var view: ViewPhotoListProtocol?
    var router: RouterPhotoListProtocol?
    var interactor: InteractorPhotoListProtocol?
    var photoViewModels: [PhotoViewModel]?
    
    let detailIdentifier = "showPhotoDetail"
    private let moduleTitle = "Gallery"
    
}

extension PhotoListPresenter: PresenterPhotoListProtocol {
    
    func getPhotoViewModels() -> [PhotoViewModel]? {
        return photoViewModels
    }
    
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: moduleTitle)
        interactor?.fetchPhotoList()
    }
    
    func photoSelected() {
        router?.performDetail(with: detailIdentifier)
    }
    
    func fetchPhotoListSucces(photoList: [RandomPhoto]) {
        var photoViewModels = [PhotoViewModel]()
        for photo in photoList {
            let photoViewModel: PhotoViewModel = (photo.created_at, photo.urls.small, photo.user?.name)
            photoViewModels.append(photoViewModel)
        }
        self.photoViewModels = photoViewModels
        view?.reloadData()
    }
    
    func fetchPhotoListFailure(with errorMessage: Error) {
        print(errorMessage)
    }
}

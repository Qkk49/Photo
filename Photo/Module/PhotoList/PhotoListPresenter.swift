import UIKit

//MARK: - CollectionModel
typealias PhotoViewModel = (date: String, url: String, name: String?)

//MARK: - Protocol
protocol PresenterPhotoListProtocol: AnyObject {
    func viewDidLoad()
    func getPhotoViewModels() -> [PhotoViewModel]?
    func getPhotoViewModels2() -> [PhotoComplete]?
    func photoSelected(using navigationController: UINavigationController, data: PhotoViewModel?)
    func fetchPhotoListSucces(photoList: [RandomPhoto])
    func fetchPhotoListSucces2(photoList: [RandomPhoto])
    func fetchPhotoListFailure(with errorMessage: Error)
}

final class PhotoListPresenter {
    
    weak var view: ViewPhotoListProtocol?
    var router: RouterPhotoListProtocol?
    var interactor: InteractorPhotoListProtocol?
    var photoViewModels: [PhotoViewModel]?
    var photoComs: [PhotoComplete]?
    
    private let moduleTitle = "Gallery"
    
}

extension PhotoListPresenter: PresenterPhotoListProtocol {
    
    func getPhotoViewModels() -> [PhotoViewModel]? {
        return photoViewModels
    }
    func getPhotoViewModels2() -> [PhotoComplete]? {
        return photoComs
    }
    
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: moduleTitle)
        interactor?.fetchPhotoList()
    }
    
    func photoSelected(using navigationController: UINavigationController, data: PhotoViewModel?) {
        router?.performDetail(using: navigationController, data: data)
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
    
    func fetchPhotoListSucces2(photoList: [RandomPhoto]) {
        var photoComs = [PhotoComplete]()
        for photo in photoList {
            let photoCom: PhotoComplete = PhotoComplete(date: photo.created_at, url: photo.urls.small, name: photo.user?.name)
//            let photoViewModel: PhotoViewModel = (photo.created_at, photo.urls.small, photo.user?.name)
            photoComs.append(photoCom)
        }
        self.photoComs = photoComs
        view?.reloadData()
    }
    
    func fetchPhotoListFailure(with errorMessage: Error) {
        print(errorMessage)
    }
}

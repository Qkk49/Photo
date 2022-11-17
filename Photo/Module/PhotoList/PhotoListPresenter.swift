import UIKit

typealias PhotoViewModel = (data: String, url: String?, name: String?)

protocol PresenterPhotoListProtocol: AnyObject {
    func viewDidLoad()
    func getPhotoViewModels() -> [PhotoViewModel]?
    func fetchPhotoListSucces(photoList: [RandomPhoto])
//    func fetchPhotoListFailure()
//    func getPhotoUrl(for indexpath : Int) -> String?
}

final class PhotoListPresenter {
    
    private weak var view: ViewPhotoListProtocol?
    private var router: RouterPhotoListProtocol?
    private var interactor: InteractorPhotoListProtocol?
//    private var photos: [RandomPhoto]?
    private var photoViewModels: [PhotoViewModel]?
    
    init(view: ViewPhotoListProtocol?, router: RouterPhotoListProtocol?, interactor: InteractorPhotoListProtocol?) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension PhotoListPresenter: PresenterPhotoListProtocol {
    
    func getPhotoViewModels() -> [PhotoViewModel]? {
        return photoViewModels
    }
    
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: "Home")
        interactor?.fetchPhotoList()
    }
    
//    func getPhotoUrl(for indexpath : Int) -> String? {
//        print(photos?[indexpath].urls.small)
//        return photos?[indexpath].urls.small
//    }
    
    func fetchPhotoListSucces(photoList: [RandomPhoto]) {
        print("sucs")
//        print(interactor?.photos)
//        photos = interactor?.photos
        var photoViewModels = [PhotoViewModel]()
        for photo in photoList {
            let photoViewModel: PhotoViewModel = (photo.created_at, photo.urls.small, photo.user?.name)
            photoViewModels.append(photoViewModel)
        }
        self.photoViewModels = photoViewModels
        view?.reloadData()
    }
    
//    func fetchPhotoListFailure() {
//        view?.onFetchPhotoListFailure(error: "Fetch photos error with error code")
//    }
}

import UIKit

//MARK: - Protocol
protocol PresenterPhotoListProtocol: AnyObject {
    func viewDidLoad()
    func getPhotoViewModels() -> [PhotoComplete]?
    func photoSelected(using navigationController: UINavigationController, data: PhotoComplete?)
    func fetchPhotoListSucces(photoList: [RandomPhoto])
    func fetchPhotoListFailure(with errorMessage: Error)
}

final class PhotoListPresenter {
    
    weak var view: ViewPhotoListProtocol?
    var router: RouterPhotoListProtocol?
    var interactor: InteractorPhotoListProtocol?
    var photoCompletes: [PhotoComplete]?
    
    private let moduleTitle = "Gallery"
    
}

extension PhotoListPresenter: PresenterPhotoListProtocol {
    
    //MARK: - Get Model
    func getPhotoViewModels() -> [PhotoComplete]? {
        return photoCompletes
    }
    
    //MARK: - ViewDidLoad
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: moduleTitle)
        interactor?.fetchPhotoList()
    }
    
    //MARK: - Go to next Module
    func photoSelected(using navigationController: UINavigationController, data: PhotoComplete?) {
        router?.performDetail(using: navigationController, data: data)
    }
    
    //MARK: - Get Photos from Interactor
    func fetchPhotoListSucces(photoList: [RandomPhoto]) {
        var photoCompletes = [PhotoComplete]()
        for photo in photoList {
            let photoComplete: PhotoComplete = PhotoComplete(date: photo.created_at, url: photo.urls.small, name: photo.user?.name, button: false)
            photoCompletes.append(photoComplete)
        }
        self.photoCompletes = photoCompletes
        view?.reloadData()
    }
    
    func fetchPhotoListFailure(with errorMessage: Error) {
        print(errorMessage)
    }
}

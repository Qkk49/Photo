import UIKit

//MARK: - Protocol
protocol PresenterFavoriteListProtocol: AnyObject {
    func viewDidLoad()
//    func getPhotoViewModels() -> [PhotoComplete]?
//    func photoSelected(using navigationController: UINavigationController, data: PhotoComplete?)
//    func fetchPhotoListSucces(photoList: [RandomPhoto])
//    func fetchPhotoListFailure(with errorMessage: Error)
}

final class FavoriteListPresenter {
    
    weak var view: ViewFavoriteListProtocol?
    var router: RouterFavoriteListProtocol?
    var interactor: InteractorFavoriteListProtocol?
    
    private let moduleTitle = "Favorites"
    
}

extension FavoriteListPresenter: PresenterFavoriteListProtocol {
    
    func viewDidLoad() {
        view?.setupView()
        view?.setTitle(with: moduleTitle)
    }
}

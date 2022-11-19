import UIKit

//MARK: - Protocol
protocol RouterFavoriteListProtocol: AnyObject {
    static func createFavoriteListModule(using navigationController: UINavigationController) -> FavoriteListViewController
//    func performDetail(using navigationController: UINavigationController, data: PhotoComplete?)
}

class FavoriteListRouter: RouterFavoriteListProtocol {
    
    weak var presenter: PresenterFavoriteListProtocol?
    weak var navigationController: UINavigationController?
    
    static func createFavoriteListModule(using navigationController: UINavigationController) -> FavoriteListViewController {
        
        // Create layers
        let router = FavoriteListRouter()
        let view = FavoriteListViewController()
        let interactor = FavoriteListInteractor()
        let presenter = FavoriteListPresenter()

        // Connect layers
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        router.navigationController = navigationController

        return view
    }
    
//    func performDetail(using navigationController: UINavigationController, data: PhotoComplete?) {
//        let photoDetailModule = PhotoDetailRouter.createDetailModule(using: navigationController, data: data)
//        self.navigationController?.pushViewController(photoDetailModule, animated: false)
//    }
}

import UIKit

//MARK: - Protocol
protocol RouterSearchListProtocol: AnyObject {
    static func createSearchListModule(using navigationController: UINavigationController) -> SearchListViewController
//    func performDetail(using navigationController: UINavigationController, data: PhotoComplete?)
}

class SearchListRouter: RouterSearchListProtocol {
    
    weak var presenter: PresenterSearchListProtocol?
    weak var navigationController: UINavigationController?
    
    static func createSearchListModule(using navigationController: UINavigationController) -> SearchListViewController {
        
        // Create layers
        let router = SearchListRouter()
        let view = SearchListViewController()
        let interactor = SearchListInteractor()
        let presenter = SearchListPresenter()

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

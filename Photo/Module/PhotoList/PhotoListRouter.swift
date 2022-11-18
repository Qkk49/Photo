import UIKit

//MARK: - Protocol
protocol RouterPhotoListProtocol: AnyObject {
    static func createListModule(using navigationController: UINavigationController) -> PhotoListViewController
    func performDetail(with identifier: String)
}

class PhotoListRouter: RouterPhotoListProtocol {
    
    weak var presenter: PresenterPhotoListProtocol?
    weak var navigationController: UINavigationController?
    
    static func createListModule(using navigationController: UINavigationController) -> PhotoListViewController {
        
        // Create layers
        let router = PhotoListRouter()
        let view = PhotoListViewController()
        let interactor = PhotoListInteractor()
        let presenter = PhotoListPresenter()

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
    
    func performDetail(with identifier: String) {
        let photoDetailModule = PhotoDetailRouter.createDetailModule(using: navigationController!)
        self.navigationController?.pushViewController(photoDetailModule, animated: false)
    }
}

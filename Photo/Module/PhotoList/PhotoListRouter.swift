import UIKit

//MARK: - Protocol
protocol RouterPhotoListProtocol: AnyObject {
    static func createModule(using navigationController: UINavigationController) -> PhotoListViewController
}

class PhotoListRouter: RouterPhotoListProtocol {
    
    weak var presenter: PresenterPhotoListProtocol?
    
    static func createModule(using navigationController: UINavigationController) -> PhotoListViewController {
        
        // Create layers
        let router = PhotoListRouter()
        let view = PhotoListViewController()
        let interactor = PhotoListInteractor()
        let presenter = PhotoListPresenter()

        // Connect layers
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        router.presenter = presenter
        view.presenter = presenter
        
        return view
    }
}

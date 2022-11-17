import UIKit

//MARK: - Protocol
protocol RouterPhotoListProtocol: AnyObject {
    static func createModule(using navigationController: UINavigationController) -> PhotoListViewController
    func performDetail(with identifier: String)
}

class PhotoListRouter: RouterPhotoListProtocol {
    
    weak var presenter: PresenterPhotoListProtocol?
    weak var navigationController: UINavigationController?
    
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
    
    func performDetail(with identifier: String) {
//        self.navigationController
    }
}

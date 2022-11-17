import UIKit

//MARK: - Protocol
protocol RouterPhotoDetailProtocol: AnyObject {
    static func createDetailModule(using navigationController: UINavigationController) -> PhotoDetailViewController
}

final class PhotoDetailRouter: RouterPhotoDetailProtocol {
    
    weak var presenter: PresenterPhotoDetailProtocol?
    weak var navigationController: UINavigationController?
    
    static func createDetailModule(using navigationController: UINavigationController) -> PhotoDetailViewController {
        
        // Create layers
        let router = PhotoDetailRouter()
        let view = PhotoDetailViewController()
        let interactor = PhotoDetailInteractor()
        let presenter = PhotoDetailPresenter()
        
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
